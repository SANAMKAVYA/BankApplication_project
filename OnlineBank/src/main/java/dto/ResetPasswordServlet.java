package dto;

import dao.UserDao;
import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/bank";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bankAccount = request.getParameter("bankAccount");
        String newPin = request.getParameter("newpin");
        String confirmPin = request.getParameter("confirmPin");

        // Validate input
        if (newPin == null || confirmPin == null || !newPin.equals(confirmPin)) {
//            response.getWriter().println("PINs do not match. <a href='ResetPin.jsp?bankAccount=" + bankAccount + "'>Try again</a>");
            request.getRequestDispatcher("pin.jsp").forward(request, response); // Ensure this matches your JSP file name
            

            return;
        }

        // Update PIN in the database
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement("UPDATE account SET pin = ? WHERE bankAccount = ?")) {
            stmt.setString(1, newPin);
            stmt.setString(2, bankAccount);
            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                response.getWriter().println("PIN updated successfully. <a href='Login.jsp'>Sign In</a>");
            } else {
                response.getWriter().println("Failed to update PIN. <a href='ResetPin.jsp?bankAccount=" + bankAccount + "'>Try again</a>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}