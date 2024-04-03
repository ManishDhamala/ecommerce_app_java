<%--
  Created by IntelliJ IDEA.
  User: SUSHIL
  Date: 4/3/2024
  Time: 5:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/header.styles.css">
</head>
<body>
<!-- header section start -->
<nav class="navbar navbar-expand-lg bg-white sticky-top navbar-light p-3 shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp"> <strong
                class="logoname">Gadget<span>.</span></strong></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>


        <div class=" collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav ms-auto ">
                <li class="nav-item">
                    <a class="nav-link mx-2  fs-5" aria-current="page" href="${pageContext.request.contextPath}/index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link mx-2  fs-5" href="${pageContext.request.contextPath}/pages/about.jsp">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link mx-2  fs-5" href="${pageContext.request.contextPath}/pages/shop.jsp">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link mx-2   fs-5" href="${pageContext.request.contextPath}/pages/profile.jsp">Profile</a>
                </li>

            </ul>
            <ul class="navbar-nav ms-auto ">
                <li class="nav-item">
                    <a class="nav-link mx-2 text-uppercase" href="#"><img src="${pageContext.request.contextPath}/assets/Icons/shopping-bag.png"
                                                                          alt="cart"
                                                                          style="width: 20px;height: 20px;">
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link mx-2 text-uppercase" href="#"><img src="${pageContext.request.contextPath}/assets/Icons/user.png" alt="user"
                                                                          style="width: 20px;height: 20px;">
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link mx-2 text-uppercase register-btn" href="#"><span>Register<span></a>
                </li>
            </ul>
        </div>
    </div>

</nav>
<!-- header section end -->

</body>
</html>
