<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Dashboard</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<style>

html {
  background: linear-gradient(to bottom, #b3e0ff 100%, #ffffff 0%);
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
 
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid black;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>
 
<center><h1>Dashboard</h1></center>
 
 
<div class="leftbox">
<canvas id="myChart1" style="width:100%;max-width:500px"></canvas>
 
<script>
var xValues = ["A+ve", "B+ve", "AB+ve", "O+ve", "A-ve", "B-ve", "AB-ve", "O-ve",];
var yValues = [55, 49, 44, 50, 15, 45, 42, 30];
var barColors = ["red", "green","blue","orange","brown", "yellow", "violet", "purple"];
 
new Chart("myChart1", {
  type: "doughnut",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    title: {
      display: true,
      text: "Blood Available"
    }
  }
});
</script>
</div>
 
 
<div class="rightbox">
 

<canvas id="myChart2" style="width:200px; max-width:500px"></canvas>
 
<script>
var xValues = ["2015", "2016", "2017", "2018", "2019", "2020","2021"];
var yValues = [90, 135, 160, 148, 200, 243, 77];
var barColors = ["red", "green","blue","orange","brown", "violet"];
 
new Chart("myChart2", {
  type: "bar",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    legend: {display: false},
    title: {
      display: true,
      text: "Number of patients"
    }
  }
});
</script>
</div>

<div>
<table>
 <tr>
    <th></th>
    <th>Total Number</th>
    <th>Now Available</th>
  </tr>
  <tr>
    <td>Number of Doctors</td>
    <td>25</td>
    <td>${noOfDoctors}</td>
  </tr>
  <tr>
    <td>Number of Beds</td>
    <td>100</td>
    <td>40</td>
  </tr>
  <tr>
    <td>Number of Staffs</td>
    <td>100</td>
    <td>90</td>
  </tr>
  <tr>
    <td>Number of Ambulance</td>
    <td>6</td>
    <td>2</td>
  </tr>
  <tr>
    <td>Number of ICU</td>
    <td>6</td>
    <td>3</td>
  </tr>

</table>
</div>
</body>
</html>