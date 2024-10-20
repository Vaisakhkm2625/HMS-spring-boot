<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointments</title>
<style>
body {
	display: block;
	margin: 30px;
	background-color: #A9C9FF;
	background-image: linear-gradient(180deg, #A9C9FF 0%, #FFBBEC 100%);
	font-family: "century gothic", "Courier New", monospace;
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

#customers {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #4CAF50;
	color: white;
}
</style>
</head>
<body>
<a href="/Portal?username=${username}">
<button class="button">HOME</button>
</a>
<h1>Appointments</h1>
<table id="customers">
<tr>
        <th>Appointment Id</th>
        <th>Patient Id</th>
        <th>Preferred Time</th>
    </tr>
<c:forEach items="${list}" var="entry">
    <tr>
            <td>${entry.applicationId}</td>
            <td> ${entry.patientId} </td>
            <td>${entry.applicationTime}</td>
    </tr>
</c:forEach>
</table>
</body>
</html>