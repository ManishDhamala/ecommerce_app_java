<%--
  Created by IntelliJ IDEA.
  User: sachin
  Date: 13/04/2024
  Time: 2:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dashboard Page</title>
  <link rel="stylesheet"  href="../styles/global.css">
  <link rel="stylesheet" href="../styles/global.css">
  <link rel="stylesheet" href="../styles/css/carousel.styles.css">
  <link rel="stylesheet" href="../styles/css/header.styles.css">
  <link rel="stylesheet" href="../styles/css/admin.dashboard.styles.css">
</head>
<body>
<jsp:include page="adminheader.jsp"/>
<div class="row mt-5  mb-5 mx-5 ">
  <div class="col">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Total Orders</h5>
        <p class="card-text">
            <span class="value">100</span>
        </p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Total Users</h5>
        <p class="card-text">
          <span class="value">100</span>
          </p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Total Products</h5>
        <p class="card-text">
            <span class="value">100</span>
        </p>
      </div>
    </div>
  </div>
</div>
<div class="simple-bar-chart">
  <div class="item" style="--clr: #5EB344; --val: 80">
    <div class="label">Sunday</div>
    <div class="value">80%</div>
  </div>

  <div class="item" style="--clr: #FCB72A; --val: 50">
    <div class="label">Monday</div>
    <div class="value">50%</div>
  </div>

  <div class="item" style="--clr: #F8821A; --val: 100">
    <div class="label">Tuesday</div>
    <div class="value">100%</div>
  </div>

  <div class="item" style="--clr: #E0393E; --val: 15">
    <div class="label">Wednesday</div>
    <div class="value">15%</div>
  </div>

  <div class="item" style="--clr: #963D97; --val: 1">
    <div class="label">Thursday</div>
    <div class="value">1%</div>
  </div>

  <div class="item" style="--clr: #069CDB; --val: 90">
    <div class="label">Friday</div>
    <div class="value">90%</div>
  </div>

  <div class="item" style="--clr: #F39C12; --val: 40">
    <div class="label">Saturday</div>
    <div class="value">40%</div>
  </div>
</div>
</body>
</html>
