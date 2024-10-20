<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>

<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>


<style>
body {
	display: block;
	margin: 0px;
	background-color: #A9C9FF;
	background-image: linear-gradient(180deg, #A9C9FF 0%, #FFBBEC 100%);
	font-family: "century gothic", "Courier New", monospace;
}

/*********************************/
.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

#main {
  transition: margin-left .5s;
  padding: 16px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

/********************************/
* {
	box-sizing: border-box;
}


.rowbox{
	padding-left:10%;
	padding-right:10%;
}

/* Float four columns side by side */
.column {
	float: left;
	width: 33%;
	padding: 0 10px;
}

/* Remove extra left and right margins, due to padding */
.row {
	margin: 10px;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Responsive columns */
@media screen and (max-width: 600px) {
	.column {
		width: 100%;
		display: block;
		margin-bottom: 20px;
	}
}

/* Style the counter cards */
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	padding: 16px;
	text-align: center;
	background-color: #f1f1f1;
}

/********************************/

.h {
  text-decoration: none;
}
.h:hover {
  border: 1px solid #777;
box-shadow: 0 10px 30px 0 rgb(0 0 0 / 20%);
 transition-duration: 0.5s;
/*transform: rotate(10deg);*/
 transform: scale(1.02,1.02);
transform-origin: 20% ;

}

/************************#551A8B******/

a{
  color: #9966CC;
  background-color: transparent;
  text-decoration: none;
}
/*a:visited {
  color: blue;
  background-color: transparent;
  text-decoration: none;
}*/
a:hover {
  color: red;
  background-color: transparent;
  text-decoration: underline;
}
a:active {
  color: yellow;
  background-color: transparent;
  text-decoration: underline;
}

/********************************/

</style>


</head>


<body>

<div class="sidenav" id="mySidenav">
<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

  <a href='login?siteName=PatientPortal.jsp'>Patient Portal</a>
  <a href='login?siteName=DoctorPortal.jsp'>Doctor Portal</a>
  <a href='login?siteName=Admin.jsp'>Admin Portal</a>
  <a href='login?siteName=pharmacistPortal.jsp'>Pharmacist Portal</a>

</div>

	<div  id="main" >
	<a href="/home">
<img src="res/logo.png" width="35%">
</a>

<br>
		<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>

		<div class="rowbox">
			<div class="row">
				<div class="column">
					<a href="dashboard" ><div class="card h ">
						<h3>Dashboard</h3>
						<img src="res/dashboard.png" width="30%">
						
					</div></a>
				</div>

				<div class="column">
					<a href="fetchDoctor" ><div class="card h">
						<h3>Doctors</h3>
						<img src="res/sthethescope.png" width="30%">
					</div></a>
				</div>

				<div class="column">
					<a href="pharmacy" ><div class="card h">
						<h3>Pharmacy</h3>
						<img src="res/pharmacy.png" width="30%">
					</div></a>
				</div>
			</div>
			<div class="row">
				<div class="column">
					<a href="BloodBank" ><div class="card h">
						<h3>Blood Bank</h3>
						<img src="res/bbank.png" width="30%">
					</div></a>
				</div>

				<div class="column">
					<a href="quickhelp" ><div class="card h">
						<h3>Quick Help</h3>
						<img src="res/fasthelp.png" width="30%">
					</div></a>
				</div>

				<div class="column">
					<a href="covidPortal" ><div class="card h">
						<h3>Covid Portal</h3>
						<img src="res/covid.png" width="30%">
					</div></a>
				</div>
			</div>
		</div>
	</div>

	<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "300px";
  document.getElementById("main").style.marginLeft = "300px";
  document.getElementById("main").style.backgroundColor = "rgba(0,0,0,0.4)";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
  document.getElementById("main").style.backgroundColor = "rgba(0,0,0,0)";
}
</script>


</body>
</html>