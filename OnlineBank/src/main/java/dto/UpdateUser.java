package dto;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateUser") // Correct servlet mapping
public class UpdateUser extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    
    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/bank"; // Change to your database name
    private static final String DB_USER = "root"; // Change to your database username
    private static final String DB_PASSWORD = "root"; // Change to your database password

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String pin = request.getParameter("pin");

        // Basic validation to ensure input is correct
        if (name == null || name.isEmpty() || mobile == null || mobile.isEmpty() || 
            address == null || address.isEmpty() || pin == null || pin.isEmpty()) {
            
            // Set error message if validation fails
            request.setAttribute("errorMessage", "All fields are required. Please fill out all fields.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Update.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Ensure PIN is exactly 4 digits
        if (pin.length() != 4) {
            request.setAttribute("errorMessage", "PIN must be exactly 4 digits.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Update.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Update the user details in the database
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Prepare the SQL update statement
            String updateSQL = "UPDATE account SET name = ?, mobile = ?, address = ? WHERE pin = ?";
            PreparedStatement stmt = conn.prepareStatement(updateSQL);
            stmt.setString(1, name);
            stmt.setString(2, mobile);
            stmt.setString(3, address);
            stmt.setString(4, pin);
            
            // Execute the update
            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                // Forward to success page if update is successful
                request.setAttribute("successMessage", "User details updated successfully.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("updateSuccess.jsp");
                dispatcher.forward(request, response);
            } else {
                // If no rows were updated, the PIN might not match any record
                request.setAttribute("errorMessage", "Update failed. Please check your PIN and try again.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("Update.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            // Handle any SQL exceptions
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("Update.jsp");
            dispatcher.forward(request, response);
        }
    }
}
