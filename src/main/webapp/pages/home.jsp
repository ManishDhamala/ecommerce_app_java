<%--
  Created by IntelliJ IDEA.
  User: SUSHIL
  Date: 4/2/2024
  Time: 8:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" href="../styles/css/mystyle.css">
    <link rel="stylesheet" href="../styles/css/nav.styles.css">
    <script defer src="../styles/js/myscript.js"></script>
    <title>Title</title>
</head>
<body>
<!-- header section start -->
<nav class="navbar navbar-expand-lg bg-white sticky-top navbar-light p-3 shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="#"><i class="fa-solid fa-shop me-2"></i> <strong
                class="logoname">Gadget<span>.</span></strong></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>


        <div class=" collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav ms-auto ">
                <li class="nav-item">
                    <a class="nav-link mx-2  fs-5" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link mx-2  fs-5" href="#">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link mx-2  fs-5" href="#">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link mx-2   fs-5" href="#">Contact us</a>
                </li>

            </ul>
            <ul class="navbar-nav ms-auto ">
                <li class="nav-item">
                    <a class="nav-link mx-2 text-uppercase" href="#"><img  src="../assets/Icons/shopping-bag.png" alt="cart"
                                                                          style="width: 20px;height: 20px;">
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link mx-2 text-uppercase" href="#"><img  src="../assets/Icons/user.png" alt="cart"
                                                                          style="width: 20px;height: 20px;">
                    </a>
                </li>
            </ul>
        </div>
    </div>

</nav>


<!-- header section end -->

</body>
</html>
