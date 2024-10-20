<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<style>
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

.button1 {
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
	background-color: #1affff;
}
</style>
</head>
<body>
	<a href="/Portal?username=${username}">
		<button class="button">HOME</button>
	</a>

	<table id="customers">
		<tr>
			<th>Prescription Number</th>
			<th>Doctor Id</th>
			<th>Medicine Id</th>
			<th>Date</th>
			<th>Quantity</th>
		</tr>
		<c:forEach items="${list}" var="entry">
			<tr>
				<td>${entry.iD}</td>
				<td>${entry.docID}</td>
				<td>${entry.medID}</td>
				<td>${entry.prescriptiondate}</td>
				<td>${entry.quantity}</td>

			</tr>
		</c:forEach>
	</table>
	<table id="customers">
		<tr>
			<th>Medicine Name</th>
			<th>Medicine Price</th>
		</tr>
		<c:forEach items="${med}" var="entry">
			<tr>

				<td>${entry.name}</td>
				<td>${entry.price}</td>
			</tr>
		</c:forEach>
	</table>
	<table id="customers">
		<tr>
			<th>Total Bill</th>
		</tr>
		<tr>
			<td>${total}</td>
		</tr>
	</table>

	<button class="button1" onclick="myFunction()">Generate Your Bill</button>
	<div id="myDIV">
		<table id="customers">
			<tr>
				<th>Bill Id</th>
				<th>Patient Id</th>
				<th>Bill Amount</th>
			</tr>
			<c:forEach items="${billList}" var="entry">
				<tr>
					<td>${entry.billId}</td>
					<td>${entry.patientId}</td>
					<td>${entry.billAmount}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<a href="/getMedicinesByPatientId?name=${username}">
<button class="button">View all prescription details</button>
</a>
	<script>
		function myFunction() {
			var x = document.getElementById("myDIV");
			if (x.style.display === "none") {
				x.style.display = "block";
			} else {
				x.style.display = "none";
			}
		}
	</script>
</body>
</html>
