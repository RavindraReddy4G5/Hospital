package com.Kims;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Doctor_Reg")
public class Doctor_Reg extends HttpServlet {
	Connection con=null;
	PreparedStatement pst=null;
	public void init(ServletConfig config)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://localhost:1432/motivity";
			String username="root";
			String password="root";
			con=DriverManager.getConnection(url, username, password);
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		PrintWriter writer=resp.getWriter();
		int id=Integer.parseInt(req.getParameter("id"));
		String name=req.getParameter("name");
		String specialization=req.getParameter("specialization");
		long phone=Long.parseLong(req.getParameter("phone"));
		String email=req.getParameter("mail");
		String password=req.getParameter("password");
		String nationality=req.getParameter("nationality");
		String gender=req.getParameter("gender");
		int age=Integer.parseInt(req.getParameter("age"));
		String time=req.getParameter("time");
		String sql="insert into doctor (id,name,specialization,phonenumber,emailid,password,country,gender,age,workingdays) values(?,?,?,?,?,?,?,?,?,?)";
		try {
			pst=con.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, name);
			pst.setString(3, specialization);
			pst.setLong(4, phone);
			pst.setString(5, email);
			pst.setString(6, password);
			pst.setString(7, nationality);
			pst.setString(8, gender);
			pst.setInt(9, age);
			pst.setString(10, time);
			int x=pst.executeUpdate();
			if(x==1)
			{
				writer.println("==========inserted sucessfull====-------");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
		


}
