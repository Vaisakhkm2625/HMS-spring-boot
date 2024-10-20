<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<title>Pharmacy</title>
</head>
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

</style>
<body>
<center><h1> Be Well Pharmacy</h1></center>

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
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</head>
</html>
