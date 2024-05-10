<%@ page import="com.icp.gadgets.doa.TransactionalDoa" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icp.gadgets.model.SalesData" %>
<%@ page import="com.icp.gadgets.utils.Helper" %>
<%@ page import="java.sql.SQLException" %><%--
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
<%

    HttpSession isSession = request.getSession(false);
    if (isSession == null || isSession.getAttribute("user") == null || !isSession.getAttribute("userRole").equals("ADMIN")) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
    }

  TransactionalDoa transactionalDoa = new TransactionalDoa();
  Helper helper = new Helper();
  int totalUsers = transactionalDoa.getTotalUsers();
  int getTotalProducts = transactionalDoa.getTotalProducts();
  int totalOrders = transactionalDoa.getTotalOrders();
    List<SalesData> salesData = null;
    try {
        salesData = transactionalDoa.getWeeklySales();
    } catch (SQLException e) {
        throw new RuntimeException(e);
    } catch (ClassNotFoundException e) {
        throw new RuntimeException(e);
    }
%>
<div class="row mt-5  mb-5 mx-5 ">
  <div class="col">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Total Orders</h5>
        <p class="card-text">
            <span class="value">
                <%= totalOrders %>
            </span>
        </p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Total Users</h5>
        <p class="card-text">
          <span class="value">
            <%= totalUsers %>
          </span>
          </p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Total Products</h5>
        <p class="card-text">
            <span class="value">
                <%= getTotalProducts %>
            </span>
        </p>
      </div>
    </div>
  </div>
</div>
<div class="simple-bar-chart" style="min-height: 70vh; max-height: 75vh">
    <%
        for (SalesData salesDatum : salesData) {
    %>
  <%
    String dayName = helper.getDayName(salesDatum.getDayOfWeek());
    String color = helper.getColorAccordingToDay(salesDatum.getDayOfWeek());
  %>
    <div class="item" style="--clr: <%=color%>; --val: <%= salesDatum.getSalesPercentage() %>">
        <div class="label"><%= dayName%></div>
        <div class="value">Rs.<%= salesDatum.getDailySales() %>0</div>
    </div>
    <%
        }
    %>

</div>
</body>
</html>
