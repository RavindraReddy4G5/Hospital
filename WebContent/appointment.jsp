<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="blue">
<Center><h1>Welcome to Appointment page Details</h1></Center>
<a href="patient_registration.html"><h3 style="text-align:left;">&#9998new patient Reg here|</h3></a>
<a href="patient_profile.jsp">Update Profile|</a>
<a href="appointment.jsp">Appointment</a>
<a href="view_appointment.jsp">view details of Application</a>
<a href="index.html">Home</a>
<form action="apply_appointment.jsp">
<table align="center">
<tr>
<td>Aid</td>
<td>:</td>
<td> <input type="number" name="id" placeholder="Enter your id"></td>
</tr>
<tr>
<td>Name </td>
<td>:</td>
<td> <input type="text" name="name" placeholder="Enter your name"></td>
</tr>
<tr>
<td>phoneNumber</td>
<td>:</td>
<td> <input type="number" name="phone" placeholder="Enter your phone number"></td>
</tr>
<tr>
<td>Mail id</td>
<td>:</td>
<td><input type="text" name="mail" placeholder="Enter your mail id"/></td>
</tr>
<tr>
<td>Gender</td>
<td>:</td>
<td><input type="radio"  name="gender" value="male" required>male
<input type="radio"  name="gender" value="female" required>female</td>
</tr>
<tr>
<td>Bloodgroup</td>
<td>:</td>
<td><select name="blood"  placeholder="select your bloodgroup ">
<option>--select from list---</option>
<option value="A+">A+</option>
<option value="B+">B+</option>
<option value="O+">O+</option>
<option value="AB+">AB+</option>
<option value="O-">O-</option>
<option value="AB-">AB-</option>
</select>
</td>
</tr>
<tr>
<td>specialist</td>
<td>:</td>
<td><select name="specialist"  placeholder="select your specialist ">
<option>--select from list---</option>
<option value="cardiaologist">Cardiaologist</option>
<option value="neurologist">Neurologist</option>
<option value="gatro-enterologist">Gatro-enterologist</option>
<option value="nephrologist">Nephrologist</option>
<option value="rheuamatologist">Rheuamatologist</option>
<option value="oncologist">Oncologist</option>
<option value="pulmonologist">Pulmonologist</option>
<option value="gynocologist">Gynocologist</option>
<option value="opthomologist">Opthomologist</option></select>
</td>
</tr>
<tr>
<td>Date</td>
<td>:</td>
<td> <input type="date" name="date" ></td>
</tr>
<tr>
<td>Time</td>
<td>:</td>
<td><input type="text" name="time" /></td>
</tr>
<td><input type="submit" name="Register"/></td>
</tr>
</table>
</form>
</body>
</html>