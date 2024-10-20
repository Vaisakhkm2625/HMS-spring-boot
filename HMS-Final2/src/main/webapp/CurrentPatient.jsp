<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Current Patient</title>
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
<style>
body {
	display: block;
	margin: 0px;
	background-color: #A9C9FF;
	background-image: linear-gradient(180deg, #A9C9FF 0%, #FFBBEC 100%);
	font-family: "century gothic", "Courier New", monospace;
}

input[type=text], select {
	width: 40%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 40%;
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

div {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}

.button {
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 50px;
	cursor: pointer;
	background-color: #008CBA;
	float: right
}
</style>


</head>


<body>
<a href="/Portal?username=${username}">
	<button class="button">HOME</button>
	</a>
	<br>
	<form action="currentPatient">
		<label for="appointmentId">Appointment Id</label> 
		<select id="appointmentId" name="appointmentId" required="currently no appointments">
			<c:forEach items="${list}" var="entry">
				<option value="${entry.applicationId}">${entry.applicationId}</option>
			</c:forEach>
		</select> <input type="submit" value="Submit">
	</form>
	<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
</body>
</html>
