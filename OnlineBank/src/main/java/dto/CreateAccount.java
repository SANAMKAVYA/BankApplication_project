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

@WebServlet("/OpenAccount")
public class CreateAccount extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException,NumberFormatException {
		String name = req.getParameter("name");
		String mobile = req.getParameter("mobile");
		String aadhar = req.getParameter("aadhar");
		String address = req.getParameter("address");
		String bankAccount = req.getParameter("bankAccount");
		String pin = req.getParameter("pin");
		String cpin = req.getParameter("cpin");
		
		try {
			DriverManager.registerDriver(new Driver());
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank?createDatabaseIfNotExist=true","root","root");
			PreparedStatement ps = con.prepareStatement("create table if not exists account(name varchar(45) not null,mobile bigint(10) not null,aadhar bigint(12) not null unique,address varchar(45) not null,bankAccount bigint(12) primary key,pin int(4) not null,cpin int(4) not null)");
			PreparedStatement ps1 = con.prepareStatement("insert into account values(?,?,?,?,?,?,?)");
			ps1.setString(1, name);
			ps1.setLong(2, Long.parseLong(mobile));
			ps1.setLong(3, Long.parseLong(aadhar));
			ps1.setString(4, address);
			ps1.setLong(5, Long.parseLong(bankAccount));
    		ps1.setInt(6, Integer.parseInt(pin));
			ps1.setInt(7, Integer.parseInt(cpin));
			//ps1.setString(6, pin);
			//ps1.setString(7, cpin);
			
			ps.executeUpdate();
			ps1.execute();
			//if(pin==cpin)
			if(req.getParameter("pin").equals(req.getParameter("cpin"))){
				RequestDispatcher dispatcher = req.getRequestDispatcher("ApplicationSuccess.jsp");
				dispatcher.forward(req, resp);
			}
			else {
				RequestDispatcher dispatcher = req.getRequestDispatcher("PinMismatch.jsp");
				dispatcher.forward(req, resp);
			}
			
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
