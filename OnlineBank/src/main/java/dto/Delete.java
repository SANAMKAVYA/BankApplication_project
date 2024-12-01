package dto;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/DeleteAccountServlet")
public class Delete extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bankAccount = req.getParameter("bankAccount");
		String pin = req.getParameter("pin");
		PrintWriter out = resp.getWriter(); 
		try {
			DriverManager.registerDriver(new Driver());
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank?createDatabaseIfNotExist=true","root","root");
			PreparedStatement ps = con.prepareStatement("delete from account where bankAccount=? and pin=?");
			ps.setLong(1, Long.parseLong(bankAccount));
			ps.setInt(2, Integer.parseInt(pin));
			
			int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                // Account was successfully deleted
                RequestDispatcher dispatcher = req.getRequestDispatcher("DeletedAccount.jsp");
                dispatcher.forward(req, resp);
            } 
            else {
                RequestDispatcher dispatcher = req.getRequestDispatcher("Delete.jsp");
                dispatcher.include(req, resp);
            }
			ps.close();
			con.close();
			}
		 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}