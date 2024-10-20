<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Admin Panel</title>

<style>
body {
	background: #00416A; /* fallback for old browsers */
	background: -webkit-linear-gradient(to left, #E4E5E6, #00416A);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to left, #E4E5E6, #00416A);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}
img {
  float: right;
}
h2{
	color:#f2f2f2;
}
h1{
	color:#f2f2f2;
}
input[type=text], select {
	width: 35%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 35%;
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

#customers {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 20%;
	float: right;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
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
	margin: 4px 30px;
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
	margin: 4px 30px;
	cursor: pointer;
	background-color: #00416A;
	float: right
}
</style>

</head>
<body>
	<script>
		function init() {
			if (!("[[${alert}]]" === "[[]]")) {
				alert("[[${alert}]]");
			}
		}
		init();
	</script>
	<center><h1>Admin Portal</h1></center>
	<a href="/home"> <img src="res/logo.png" width="35%">
	</a>
<br><br><br><br><br><br>
	<div>
		<button class="button1" onclick="myFunction1()">View Doctors list</button>
		<div id="myDIV1">
		<table id="customers">
			<tr>
				<th>Doctor Id</th>
				<th>Name</th>
				<th>Department Id</th>
				<th>Salary</th>
				<th>Phone Number</th>
				<th>Qualification</th>
				<th>Designation</th>
			</tr>
			<c:forEach items="${doctorList}" var="entry1">
				<tr>
					<td>${entry1.doctorId}</td>
					<td>${entry1.name}</td>
					<td>${entry1.departmentId}</td>
					<td>${entry1.salary}</td>
					<td>${entry1.contact}</td>
					<td>${entry1.qualification}</td>
					<td>${entry1.designation}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
		<h2>Add Doctor</h2>
			<form action="/addDoctor">

		<input type="text" name="Name" placeholder="Name" required><br>
		<input type="text" name="departmentId" placeholder="Department ID" required><br>
<%-- 		    <label for="departmentId" style="color:white">Department ID</label>
<select id="departmentId" name="departmentId" required>
			<c:forEach var="listValue" items="${departmentList}">
				<option value="${listValue.ID}">${listValue.Name}</option>
			</c:forEach>
		</select><br><br> --%>
		<input type="text" name="Salary" placeholder="Salary"  required><br>
		<input type="text" name="Contact" placeholder="Contact" pattern="[1-9]{1}[0-9]{9}" title="Enter contact number" required=""><br> 
		<input type="text" name="Qualification" placeholder="Qualification" required><br>
		<input type="text" name="Designation" placeholder="Designation" required><br> <br> 
			<input type="submit" value="Submit">
	</form>
			<h2>Remove Doctor</h2>
			<form action="/removeDoctor">

		<input type="text" name="doctorId" placeholder="Doctor ID" required><br>
		<br> <input type="submit" value="Submit">
	</form>
	</div>

	<div>
		<h2>Assign Portal</h2>
		<form action="/addPortal">

			<input type="text" name="username" placeholder="username" required><br>
			<br> 
			<input type="text" name="password" placeholder="password" required><br> <br> 
				<select id="siteName" name="siteName">
				<option value="Admin.jsp">Admin</option>
				<option value="DoctorPortal.jsp">Doctor</option>
				<option value="PatientPortal.jsp">Patient</option>
				<option value="pharmacistPortal.jsp">Pharmacy</option>
			</select><br><br>
			 <input type="submit" value="Submit">
		</form>
	</div>
	<div>
	<button class="button1" onclick="myFunction2()">View Patients list</button>
		<div id="myDIV2">
		<table id="customers">
			<tr>
				<th>Patient Id</th>
				<th>Name</th>
				<th>Age</th>
				<th>Address</th>
				<th>Phone Number</th>
				<th>Gender</th>
			</tr>
			<c:forEach items="${patientList}" var="entry2">
				<tr>
					<td>${entry2.iD}</td>
					<td>${entry2.name}</td>
					<td>${entry2.age}</td>
					<td>${entry2.address}</td>
					<td>${entry2.contact}</td>
					<td>${entry2.gender}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
		<h2>Add Patient</h2>

		<form action="/addPatient">

			<input type="text" name="Name" placeholder="Name" required><br>
			<input type="text" name="Age" placeholder="Age" required><br>
			<input type="text" name="Address" placeholder="Address" required><br>
			<input type="text" name="Contact" placeholder="Contact" pattern="[1-9]{1}[0-9]{9}" required=""><br> 
			<input type="text" name="Gender" placeholder="Gender" required><br>
			<input type="submit" value="Submit">
		</form>
	</div>
	<div>
	<button class="button1" onclick="myFunction3()">View Staff list</button>
		<div id="myDIV3">
		<table id="customers">
			<tr>
				<th>Staff Id</th>
				<th>Department Id</th>
				<th>Name</th>
				<th>Gender</th>
				<th>Address</th>
				<th>Phone Number</th>
				<th>Salary</th>
				<th>Designation</th>
				
			</tr>
			<c:forEach items="${staffList}" var="entry3">
				<tr>
					<td>${entry3.staffId}</td>
					<td>${entry3.departmentId}</td>
					<td>${entry3.name}</td>
					<td>${entry3.gender}</td>
					<td>${entry3.address}</td>
					<td>${entry3.contact}</td>
					<td>${entry3.salary}</td>
					<td>${entry3.designation}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
		<h2>Add Staff</h2>

		<form action="/addStaff">

<%-- 			 <label for="departmentId" style="color:white">Department</label>
<select id="departmentId" name="departmentId" required>
			<c:forEach var="listValue" items="${departmentList}">
				<option value="${listValue.ID}">${listValue.Name}</option>
			</c:forEach>
		</select><br><br> --%>
		<input type="text" name="departmentId" placeholder="departmentId" required><br>
			<input type="text" name="name" placeholder="Name" required><br>
			<input type="text" name="gender" placeholder="Gender" required><br>
			<input type="text" name="address" placeholder="Address" required><br>
			<input type="text" name="contact" placeholder="Contact"
				pattern="[1-9]{1}[0-9]{9}" required=""><br> <input
				type="text" name="salary" placeholder="Salary" required><br>
			<input type="text" name="designation" placeholder="Designation"
				required><br> <br> <input type="submit"
				value="Submit">
		</form>

		<h2>Remove Staff</h2>

		<form action="/removeStaff">

			<input type="text" name="staffId" placeholder="staff ID" required><br>
			<br> <input type="submit" value="Submit">
		</form>

	</div>
	<h2>View Billing Details</h2>

	<form action="/getBillingDetailsWithPatientId">
		
		<label for="patientId" style="color:white">Patient ID</label>
<select id="patientId" name="patientId" required>
			<c:forEach var="listValue" items="${patientList}">
				<option value="${listValue.iD}">${listValue.iD} - ${listValue.name}</option>
			</c:forEach>
		</select><br><br>
		<br> <input type="submit" value="Submit">
	</form>

	<button class="button1" onclick="myFunction4()">View Billing
		details : ${patientName}</button>
	<div id="myDIV4">
		<table id="customers">
			<tr>
				<th>Bill Id</th>
				<th>Patient Id</th>
				<th>Bill Amount</th>
				<th>Bill Date</th>
			</tr>
			<c:forEach items="${billList}" var="entry">
				<tr>
					<td>${entry.billId}</td>
					<td>${entry.patientId}</td>
					<td>${entry.billAmount}</td>
					<td>${entry.billDate}</td>
				</tr>
			</c:forEach>
		</table>
	</div>


	<script>
		function myFunction1() {
			var x = document.getElementById("myDIV1");
			if (x.style.display === "none") {
				x.style.display = "block";
			} else {
				x.style.display = "none";
			}
		}
		function myFunction2() {
			var x = document.getElementById("myDIV2");
			if (x.style.display === "none") {
				x.style.display = "block";
			} else {
				x.style.display = "none";
			}
		}
		function myFunction3() {
			var x = document.getElementById("myDIV3");
			if (x.style.display === "none") {
				x.style.display = "block";
			} else {
				x.style.display = "none";
			}
		}
		function myFunction4() {
			var x = document.getElementById("myDIV4");
			if (x.style.display === "none") {
				x.style.display = "block";
			} else {
				x.style.display = "none";
			}
		}
	</script>
</body>
</html>