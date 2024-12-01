package dto;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.jdbc.Driver;
import dao.WithdrawDao;

@WebServlet("/WithdrawServlet")
public class WithdrawServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bankAccounts = req.getParameter("bankAccount");
        String balances = req.getParameter("balance");
        String pins = req.getParameter("pin");

        try {
            // Parse inputs
            long bankAccount = Long.parseLong(bankAccounts);
            double amount = Double.parseDouble(balances);
            int pin = Integer.parseInt(pins);

            // Create WithdrawDao instance
            WithdrawDao withdrawDao = new WithdrawDao(bankAccount, amount, pin);

            // Register MySQL driver
            DriverManager.registerDriver(new Driver());
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");

            // Validate PIN from the account table
            PreparedStatement psPin = con.prepareStatement("SELECT pin FROM account WHERE bankAccount = ?");
            psPin.setLong(1, withdrawDao.getBankAccount());
            ResultSet rsPin = psPin.executeQuery();

            if (rsPin.next()) {
                int storedPin = rsPin.getInt("pin");

                // Check if the entered PIN is correct
                if (storedPin == withdrawDao.getPin()) {
                    // Fetch current balance from the transactions table
                    PreparedStatement psBalance = con.prepareStatement("SELECT balance FROM transactions WHERE bankAccount = ?");
                    psBalance.setLong(1, withdrawDao.getBankAccount());
                    ResultSet rsBalance = psBalance.executeQuery();

                    if (rsBalance.next()) {
                        double currentBalance = rsBalance.getDouble("balance");

                        // Check if there are sufficient funds for the withdrawal
                        if (currentBalance >= withdrawDao.getAmount()) {
                            // Withdraw the amount
                            double newBalance = currentBalance - withdrawDao.getAmount();

                            // Update the balance in the transactions table
                            PreparedStatement psUpdate = con.prepareStatement("UPDATE transactions SET balance = ? WHERE bankAccount = ?");
                            psUpdate.setDouble(1, newBalance);
                            psUpdate.setLong(2, withdrawDao.getBankAccount());
                            psUpdate.executeUpdate();

                            // Forward to success page
                            req.setAttribute("msg", "Withdrawal successful.");
                            RequestDispatcher dispatcher = req.getRequestDispatcher("WithdrawanSuccess.jsp");
                            dispatcher.include(req, resp);
//                            req.setAttribute("msg", "Withdrawal successful.");
                        } else {
                            // Insufficient funds
                            req.setAttribute("msg", "Insufficient funds for withdrawal.");
                            RequestDispatcher dispatcher = req.getRequestDispatcher("withdraw.jsp");
                            dispatcher.forward(req, resp);
                        }
                    } else {
                        // Account not found in transactions
                        req.setAttribute("msg", "Bank account not found in transactions.");
                        RequestDispatcher dispatcher = req.getRequestDispatcher("withdrawal.jsp");
                        dispatcher.forward(req, resp);
                    }
                } else {
                    // Incorrect PIN
                    req.setAttribute("msg", "Incorrect PIN. Please try again.");
                    RequestDispatcher dispatcher = req.getRequestDispatcher("withdrawal.jsp");
                    dispatcher.forward(req, resp);
                }
            } else {
                // Account not found in account table
                req.setAttribute("msg", "Bank account not found.");
                RequestDispatcher dispatcher = req.getRequestDispatcher("withdrawal.jsp");
                dispatcher.forward(req, resp);
            }

            // Close resources
            rsPin.close();
            psPin.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("msg", "Database error: " + e.getMessage());
            RequestDispatcher dispatcher = req.getRequestDispatcher("withdrawal.jsp");
            dispatcher.forward(req, resp);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            req.setAttribute("msg", "Invalid input. Please check your data.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("withdrawal.jsp");
            dispatcher.forward(req, resp);
        }
    }
}