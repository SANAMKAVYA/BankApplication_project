package dto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Transaction;
import dao.TransactionDao;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/viewTransactions")
public class TransactionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNumber = request.getParameter("accountNumber");

        // Validate the account number
        if (accountNumber == null || accountNumber.isEmpty()) {
            request.setAttribute("errorMessage", "Account number is required.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        // Get database connection
        try (Connection connection = DatabaseConnection.getConnection()) { // Ensure you have a method to get DB connection
            TransactionDao transactionDAO = new TransactionDao(connection);
            List<Transaction> transactions = transactionDAO.getTransactionHistory(accountNumber);
            
            // Check if transactions were found
            if (transactions.isEmpty()) {
                request.setAttribute("message", "No transactions found for account: " + accountNumber);
            }

            // Set the transaction history and account number in the request
            request.setAttribute("transactionHistory", transactions);
            request.setAttribute("accountNumber", accountNumber);

            // Forward to JSP page to display transactions
            request.getRequestDispatcher("transactions.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while retrieving transactions.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}