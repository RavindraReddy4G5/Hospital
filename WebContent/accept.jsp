<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
Connection connection=null;
PreparedStatement pst=null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:1432/motivity";
String user="root";
String pwd="root";
connection=DriverManager.getConnection(url,user,pwd);
int id=Integer.parseInt(request.getParameter("id"));
String name=(String)session.getAttribute("name");
String sql="update appointment set status=?,doctor_name=? where aid=?";
pst=connection.prepareStatement(sql);
pst.setString(1, "Accepted");
pst.setString(2, name);
pst.setInt(3, id);
int x=pst.executeUpdate();
if(x!=0)
response.sendRedirect("view_appointment.jsp?msg=accepted");
%>
</body>
</html>