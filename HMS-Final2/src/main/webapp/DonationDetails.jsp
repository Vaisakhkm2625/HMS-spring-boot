<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Donate Now</title>
<style>
body {
	display: block;
	margin: 30px;
	background-color: #A9C9FF;
	background-image: linear-gradient(180deg, #A9C9FF 0%, #FFBBEC 100%);
	font-family: "century gothic", "Courier New", monospace;
}

input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
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
<script>
		function init() {
			if (!("[[${alert}]]" === "[[]]")) {
				alert("[[${alert}]]");
			}
		}
		init();
	</script>
<a href="/home">
<button class="button">HOME</button>
</a>

<h2>Donor Details</h2>
<div>
<form action="/addDonorDetails">
  
  <input type="text" name="Name" placeholder="Name" required><br>
  <input type="text" name="Gender" placeholder="Gender" required><br>
  <input type="text" name="Age" placeholder="Age" required><br>
  <label for="BloodGroup">Blood Group</label>
   <select name="Blood_group" id="blood group" required>
    <option value="O+ve">O+ve</option>
    <option value="A+ve">A+ve</option>
    <option value="B+ve">B+ve</option>
    <option value="AB+ve">AB+ve</option>
    <option value="AB-ve">AB-ve</option>
    <option value="A-ve">A-ve</option>
    <option value="B-ve">B-ve</option>
    <option value="O-ve">O-ve</option>
  </select><br>
  <input type="text" name="Contact" placeholder="Contact" pattern="[1-9]{1}[0-9]{9}" required><br>
  <input type="text" name="Address" placeholder="Address" required><br><br>
  <input type="submit" value="Submit">
</form>
</div>
</body>
</html>