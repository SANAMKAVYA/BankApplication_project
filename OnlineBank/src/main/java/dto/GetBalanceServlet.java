package dto; // Ensure this matches your package structure

import dao.BalanceDao;
import dao.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

@WebServlet("/GetBalanceServlet") // Ensure this matches the URL you are using
public class GetBalanceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bankAccount = request.getParameter("bankAccount");
        
        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/bank"; // Update with your DB URL
        String dbUser     = "root"; // Update with your DB username
        String dbPassword = "root"; // Update with your DB password

        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser , dbPassword)) {
            BalanceDao balanceDao = new BalanceDao(connection);
            Account balance = balanceDao.getAccount(bankAccount);

            if (balance != null) {
                // Set the balance attribute to be accessed in the JSP
                request.setAttribute("balance", balance.getBalance());
            } else {
                // Optionally set a message for account not found
                request.setAttribute("balance", "Account not found."); // Set a message if desired
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("balance", "Error retrieving balance."); // Handle exceptions appropriately
        }

        // Forward the request back to the JSP page to display the balance
        request.getRequestDispatcher("balance.jsp").forward(request, response); // Ensure this matches your JSP file name
    }
}