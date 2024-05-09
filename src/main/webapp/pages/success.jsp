<%--
  Created by IntelliJ IDEA.
  User: himalpun
  Date: 09/05/2024
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Success</title>
    <link rel="stylesheet" href="../styles/global.css">
</head>
<body>

<div class="" style="height: 100vh; display: flex; align-items: center; justify-content: center">
    <div class="card" style="width: 18rem;">
        <div class="card-body">
            <h5 class="card-title
            text-center">Order Success</h5>
            <p class="card-text text-center">Your order has been placed successfully.</p>
            <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary">Go back to Home</a>
        </div>
    </div>
</div>
</body>
</html>
