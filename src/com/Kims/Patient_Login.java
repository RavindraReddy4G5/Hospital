package com.Kims;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/Patient_Login")
public class Patient_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection connection=null;
	PreparedStatement pst=null;
	public void init(ServletConfig config)
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String url="jdbc:mysql://localhost:1432/motivity";
		String user="root";
		String password="root";
		try {
			connection=DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter writer=response.getWriter();
		String mailid=request.getParameter("emailid");
		String password=request.getParameter("password");
		HttpSession session=request.getSession();
		String sql="select * from patient where emailid=? and password=?";
		try 
		{
		pst=connection.prepareStatement(sql);
		pst.setString(1, mailid);
		pst.setString(2, password);
		ResultSet set=pst.executeQuery();
		if(set.next())
		{
			session.setAttribute("setmail",mailid);
			session.setAttribute("setpwd", password);
			session.setAttribute("id",set.getInt("id"));
			writer.println("=======login sucess======");
			response.sendRedirect("patient_profile.jsp");
		}
		else
		{
			writer.println("no");
		
		} 
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


}
