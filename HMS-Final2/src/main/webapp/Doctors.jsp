<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<title>Our Doctors</title>
<style>


body {
 background: linear-gradient(to top, #ccccff 0%, #ffffff 100%);
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

/* On mouse-over, add a deeper shadow */
.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

/* Add some padding inside the card container */
.container {
  padding: 2px 16px;
}
 form {
        text-align: right;
    }
</style>
</head>
<body>

<h1 style="font-size:60px;">Our Doctors</h1>

<%-- <form action="/findDoctorbyDepartmentId">
		    <label for="departmentId">Department</label>
<select id="departmentId" name="departmentId" required>
			<c:forEach var="listValue" items="${departmentList}">
				<option value="${listValue.ID}">${listValue.Name}</option>
			</c:forEach>
		</select>
</form> --%>
<c:forEach var="listValue" items="${doctorList}">
<div class="gallery" id="gal">
<div class="card">
  <img src="res/avt.png" alt="Avatar" style="width:100%">
  <div class="container">
    <h4><b>Dr. ${listValue.name}</b></h4> 
    <p>${listValue.designation}</p> 
  </div>
</div>
</div>
</c:forEach>







</body>
</html>