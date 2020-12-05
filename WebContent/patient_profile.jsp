<%@ page import="java.sql.*" %>
<html>
<body bgcolor="green">
<Center><h1>Patient Profile Details</h1></Center>
<a href="patient_registration.html"><h3 style="text-align:left;">&#9998New Patient Register Here|</h3></a>
<a href="patient_profile.jsp">Update Profile|</a>
<a href="appointment.jsp">Appointment|</a>
<a href="view_appointment.jsp">View AppointMent Details|</a>
<a href="appointment_status.jsp">Status of Appointment</a>
<a href="index.html">Home</a>
<table border="2" align="center" width="600" height="400" cellpadding="20">
<tr>
<th>id</th>
<th>Name</th>
<th>bloodgroup</th>
<th>phone</th>
<th>emailid</th>
<th>password</th>
<th>gender</th>
<th>Action</th>
</tr>
<%
Connection connection=null;
PreparedStatement pst=null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:1432/motivity";
String user="root";
String pwd="root";
connection=DriverManager.getConnection(url,user,pwd);
String mail=(String)session.getAttribute("setmail");
String password=(String)session.getAttribute("setpwd");
int id=(Integer)session.getAttribute("id");
String sql="select * from patient where id=?";
pst=connection.prepareStatement(sql);
pst.setInt(1, id);
ResultSet set=pst.executeQuery();
while(set.next())
{
%>
<tr>
<td><%=set.getInt(1) %> </td>
<td><%= set.getString(2) %></td>
<td> <%= set.getString(3) %></td>
<td><%=set.getInt(4) %> </td>
<td> <%= set.getString(5) %></td>
<td> <%= set.getString(6) %></td>
<td> <%= set.getString(7) %></td>
<td><a href="update_patient_profile.jsp?id=<%=set.getInt(1)%>">Update</a></td>
</tr>
<%} %>
</table>
</body>
</html>