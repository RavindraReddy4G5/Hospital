<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<center>
<h2> Fill The Details</h2>
</center>
<body bgcolor="green">
<%@ page import="java.sql.*" %>
<%
Connection con=null;
PreparedStatement pst=null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:1432/motivity";
String user="root";
String pwd="root";
con=DriverManager.getConnection(url,user,pwd);
int id=Integer.parseInt(request.getParameter("id"));
String name=request.getParameter("name");
long mobile=Long.parseLong(request.getParameter("phone"));
String mail=request.getParameter("mail");
String gender=request.getParameter("gender");
String blood=request.getParameter("blood");
String specialist=request.getParameter("specialist");
String date=request.getParameter("date");
String time=request.getParameter("time");
int pid=(Integer)session.getAttribute("id");
String sql="insert into appointment(aid,patient_name,phonenumber,emailid,gender,bloodgroup,specialist,date,time,pid) values(?,?,?,?,?,?,?,?,?,?)";
pst=con.prepareStatement(sql);
pst.setInt(1, id);
pst.setString(2, name);
pst.setLong(3, mobile);
pst.setString(4, mail);
pst.setString(5, gender);
pst.setString(6, blood);
pst.setString(7, specialist);
pst.setString(8, date);
pst.setString(9, time);
pst.setInt(10, pid);
int x=pst.executeUpdate();
if(x!=0)
{
	response.sendRedirect("appointment.jsp?msg=appilied");
}

%>
</body>
</html>