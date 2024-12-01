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

import dao.ProfileDao;
@WebServlet("/profileform")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get the account number from the request
        long bankAccount = Long.parseLong(req.getParameter("bankAccount"));

        // Database connection setup
        try {
            // Register the MySQL driver and connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");

            // Prepare SQL statement to retrieve the user's details based on account number
            String query = "SELECT name, mobile, address, aadhar, bankAccount FROM account WHERE bankAccount=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setLong(1, bankAccount);
            ResultSet rs = ps.executeQuery();

            // If user exists, set user details in request attribute and forward to profile.jsp
            if (rs.next()) {
                String name = rs.getString("name");
                String mobile = rs.getString("mobile");
                String address = rs.getString("address");
                long aadhar = rs.getLong("aadhar");

                // Set user object with retrieved details
                ProfileDao user = new ProfileDao(name, mobile, address, bankAccount, aadhar);
                req.setAttribute("user", user);
            } else {
                // If account number is invalid, set an error message
                req.setAttribute("errorMsg", "Invalid account number. Please try again.");
            }

            // Forward to profile.jsp
            RequestDispatcher dispatcher = req.getRequestDispatcher("profile.jsp");
            dispatcher.forward(req, resp);

            // Close the resources
            rs.close();
            ps.close();
            con.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            req.setAttribute("errorMsg", "An error occurred while retrieving the profile. Please try again.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("profile.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
