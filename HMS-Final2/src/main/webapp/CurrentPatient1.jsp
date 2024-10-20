<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<title>Current Patient</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<style>

html {
 
   height: 100%;
}

body {
    height: 100%;
    margin: 0;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background: linear-gradient(to bottom, #6699ff 0%, #ffffff 100%);
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

.leftbox {
                float:left;
                width:50%;
                height:280px;
            }
.rightbox{
                float:right;
                width:50%;
                height:280px;
            }
 





div.gallery {
margin: 5px;
border: 1px solid #ccc;
float: left;
width: 180px;
}



div.gallery:hover {
border: 1px solid #777;
}



div.gallery img {
width: 100%;
height: auto;
}



div.desc {
padding: 15px;
text-align: center;
}



.card {
/* Add shadows to create the "card" effect */
box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
transition: 0.3s;
}

table, th, td {
  border: 1px solid black;
}
</style>
</head>
<body>
 
<center><h1>${patient.name}</h1></center>
 <div class="leftbox">


<div class="gallery" id="gal">
<div class="card">
<img src="res/patient.jfif" alt="Avatar" style="width:100%">
<div class="container">
.............................
<h4><b>Patient id : ${patient.iD}</b></h4>
<h4><b>Patient name : ${patient.name}</b></h4>
<h4><b>Patient Age : ${patient.age}</b></h4>
<h4><b>Gender : ${patient.gender}</b></h4>
...............................
</div>
</div>
</div>

</div>
<div class="rightbox">



<form action="/addPrescription">
  <label for="patientid">patient id</label><br>
  <input type="text" id="patientid" name="patientID" value="${patient.iD}" required><br>
  <label for="Doctorid">Doctor id</label><br>
  <input type="text" id="Doctorid" name="docID" value="${appointment.doctorId}" required><br>

<label for="appointmentId">Appointment Id</label><br>
  <input type="text" id="appointmentId" name="appointmentId" value="${appointment.applicationId}" required><br>

  <label for="Medicineid">Medicine ID</label><br>
  <select id="Medicine" name="medID" required>
			<c:forEach items="${list}" var="entry">
				<option value="${entry.id}">${entry.id}</option>
			</c:forEach>
		</select> <br><br>
  <label for="Medicineqty">Medicine Quantity</label><br>
  <input type="text" id="Medicineqty" name="quantity" required><br><br>
  <input type="submit" value="Submit">
</form> 

<a href="/currentAppointmentt?doctorId=${appointment.doctorId}&appointmentId=${appointment.applicationId}">
<button>Finish</button>
</a>
<div>
<table id="customers">
<tr>
        <th>Medicine Id</th>
        <th>Medicine Name</th>
    </tr>
<c:forEach items="${list}" var="entry">
    <tr>
            <td>${entry.id}</td>
            <td> ${entry.name} </td>
    </tr>
</c:forEach>
</table>
</div>
</div>


</body>
</html>