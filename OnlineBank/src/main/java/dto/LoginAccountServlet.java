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

// Import the correct LoginAccount class from the dao package
import dao.LoginAccount;

@WebServlet("/login")
public class LoginAccountServlet extends HttpServlet {

    // No-argument constructor
    public LoginAccountServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bankAccount = req.getParameter("bankAccount");
        String pin = req.getParameter("pin");

        try {
            // Register the MySQL JDBC driver
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            // Establish a connection to the database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");

            // Prepare SQL statement to check credentials
            PreparedStatement ps = con.prepareStatement("SELECT * FROM account WHERE bankAccount = ? AND pin = ?");
            ps.setLong(1, Long.parseLong(bankAccount));
            ps.setInt(2, Integer.parseInt(pin));

            // Execute the query
            ResultSet rs = ps.executeQuery();

            // Check if a record exists with the provided account number and PIN
            if (rs.next()) {
                // Successful login
                req.setAttribute("loginaccount", new LoginAccount(Long.parseLong(bankAccount), Integer.parseInt(pin)));
                RequestDispatcher dispatcher = req.getRequestDispatcher("dashboard.jsp");
                dispatcher.forward(req, resp); // Use forward to redirect to dashboard
            } else {
                req.setAttribute("msg", "<h3 style='color:red'>Incorrect account number or PIN</h3>");
                // Login failed
                RequestDispatcher dispatcher = req.getRequestDispatcher("Login.jsp");
                dispatcher.forward(req, resp); // Use forward to return to the login page
            }

            // Close the connection
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
            // Optionally set an error message attribute to be displayed on the login page
            req.setAttribute("msg", "<h3 style='color:red'>Database error occurred</h3>");
            RequestDispatcher dispatcher = req.getRequestDispatcher("Login.jsp");
            dispatcher.forward(req, resp);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            // Optionally set an error message attribute to be displayed on the login page
            req.setAttribute("msg", "<h3 style='color:red'>Invalid input format</h3>");
            RequestDispatcher dispatcher = req.getRequestDispatcher("Login.jsp");
            dispatcher.forward(req, resp);
        }
    }
}