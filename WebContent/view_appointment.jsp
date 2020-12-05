<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<center>
<h2> Update Doctor Profile</h2>
</center>
</head>
<body bgcolor="blue">
<%@ page import="java.sql.*" %>
<a href="patient_registration.html"><h3 style="text-align:left;">&#9998new patient Reg here|</h3></a>
<a href="patient_profile.jsp" style="color:black">Update Profile|</a>
<a href="appointment.jsp" style="color:black">Appointment|</a>
<a href="view_appointment.jsp" style="color:black">view details of Application|</a>
<a href="index.html" style="color:black">Home</a>
<table border="2" align="center" width="600" height="400" cellpadding="20">
<tr>
<th>id</th>
<th>Patient_Name</th>
<th>phone</th>
<th>emailid</th>
<th>gender</th>
<th>bloodgroup</th>
<th>specialist</th>
<th>date</th>
<th>time</th>
<th>pid</th>
<th>Status</th>
<th>Doctor_name</th>
<th>Action</th>
</tr>
<%

Connection con=null;
PreparedStatement pst=null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:1432/motivity";
String user="root";
String pwd="root";
con=DriverManager.getConnection(url,user,pwd);
String specialist=(String)session.getAttribute("specialization");
pst=con.prepareStatement("select * from appointment where specialist=?");
pst.setString(1, specialist);
ResultSet resultSet=pst.executeQuery();
while(resultSet.next())
{
%>
<tr>
<td><%=resultSet.getInt(1) %></td>
<td><%=resultSet.getString(2) %>
<td><%=resultSet.getInt(3) %>
<td><%=resultSet.getString(4) %>
<td><%=resultSet.getString(5) %>
<td><%=resultSet.getString(6) %>
<td><%=resultSet.getString(7) %>
<td><%=resultSet.getString(8) %>
<td><%=resultSet.getString(9) %>
<td><%=resultSet.getString(10) %>
<td><%=resultSet.getString(11) %>
<td><%=resultSet.getString(12) %>
<%if(resultSet.getString(10).equalsIgnoreCase("Accepted")){%>
<td>Accepted</td>
<%}else{%>
<td><a href="accept.jsp?id=<%=resultSet.getInt(1) %>">Accept</a>
</tr>
<%} %>
<%} %>
</table>
</body>
</html>