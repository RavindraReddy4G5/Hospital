<%@ page import="java.sql.*" %>
<%
Connection con=null;
PreparedStatement pst=null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:1432/motivity";
String user="root";
String pwd="root";
con=DriverManager.getConnection(url,user,pwd);
String name=request.getParameter("name");
String specialization=request.getParameter("specialization");
long mobile=Long.parseLong(request.getParameter("phone"));
String mail=request.getParameter("mail");
String password=request.getParameter("password");
String country=request.getParameter("country");
String gender=request.getParameter("gender");
int age=Integer.parseInt(request.getParameter("age"));
String time=request.getParameter("time");
int id=Integer.parseInt(request.getParameter("id"));
String sql="update doctor set name=?,specialization=?,phonenumber=?,emailid=?,password=?,country=?,gender=?,age=?,workingdays=? where id=?";
pst=con.prepareStatement(sql);
pst.setString(1, name);
pst.setString(2,specialization);
pst.setLong(3,mobile);
pst.setString(4,mail);
pst.setString(5,password);
pst.setString(6,country);
pst.setString(7,gender);
pst.setInt(8,age);
pst.setString(9,country);
pst.setInt(10, id);
int x=pst.executeUpdate();
if(x!=0)
	response.sendRedirect("doctor_profile.jsp?msg=updated");
%>