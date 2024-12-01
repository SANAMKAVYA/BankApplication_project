package dto;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/ForgetPassword")
public class ForgetPasswordServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/bank";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            checkEmail(request, response);
        } else if ("reset".equals(action)) 
        {
            resetPassword(request, response);
        }
    }
    private void checkEmail(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String bankAccount = request.getParameter("bankAccount");

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM accounts WHERE bankAccount = ?")) {

            stmt.setString(1, bankAccount);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Email exists, redirect to reset password page
                response.sendRedirect("ResetPin.jsp?bankAccont=" + bankAccount);
            } else {
                // Email not found, send error message
                response.getWriter().println("Email not found. <a href='ForgetPassword.jsp'>Try again</a>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
    private void resetPassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String bankAccount = request.getParameter("bankAccount");
        String pin = request.getParameter("newpin");

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement("UPDATE accounts SET pin = ? WHERE bankAccount = ?")) {

            stmt.setString(1, pin);
            stmt.setString(2, bankAccount);

            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                response.getWriter().println("Password updated successfully. <a href='Login.jsp'>Sign In</a>");
            } else {
                response.getWriter().println("Failed to update password. <a href='ForgetPassword.jsp'>Try again</a>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}