<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<html>
<head>
<title>Pharmacist Portal</title>
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

input[type=text], select {
	width: 50%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 50%;
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
</style>
</head>
<body>
	<a href="/home">
<img src="res/logo.png" width="35%">
</a>
<script>
function init() {
	if(!("[[${alert}]]"==="[[]]")){
		alert("[[${alert}]]");
	}
}
init();
</script>
<h2>Add Medicine</h2>

<form action="/addMedicine">
  
  <input type="text" name="name" placeholder="Name" required><br>
  <input type="text" name="price" placeholder="Price" required><br>
  <input type="submit" value="Submit">
</form>

<h2>Remove Medicine</h2>

<form action="/removeMedicine">
  
  <input type="text" name="id" placeholder="medicine id" required><br>
  <input type="submit" value="remove">

</form>
<c:forEach var="listValue" items="${list}">
<div class="gallery" id="gal">
<div class="card">
  <img src="res/medicine.jpg" alt="Avatar" style="width:100%">
  <div class="container">
  		<p>Medicine id : ${listValue.id}</p> 
    <h4><b>Name : ${listValue.name}</b></h4> 
    <p>Price : Rs.${listValue.price}</p> 
  </div>
</div>
</div>
</c:forEach>
</body>
</html>