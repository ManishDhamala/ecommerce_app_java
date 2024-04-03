<%--
  Created by IntelliJ IDEA.
  User: SUSHIL
  Date: 4/3/2024
  Time: 4:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/featuredProduct.style.css">

</head>
<body>
<div class="container shadow my-5 ">
    <div class="row ">
        <div class="col-lg-12 text-center mb-4">
            <h2 class="text-black fs-1 font-weight-bold mt-5">Featured <span class="text-warning">Product.</span></h2>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-3 col-md-6 col-sm-12 pb-4">
            <div class="card product-item border-0 mb-4 shadow">
                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                    <img class="img-fluid w-100" src="${pageContext.request.contextPath}/assets/mouse.jpeg" alt="">
                </div>
                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                    <h5 class="text-truncate mb-3">Mouse</h5>
                    <div class="d-flex justify-content-center">
                        <h6>$123.00</h6>
                        <h6 class="text-muted ml-2">
                            <del>$123.00</del>
                        </h6>
                    </div>
                </div>
                <div class="card-footer d-flex justify-content-between bg-light border">
                    <a href="#" class="btn btn-sm text-dark p-0 d-flex gap-1 align-items-center">
                        <img src="${pageContext.request.contextPath}/assets/Icons/eye.png" alt="cart" style="width: 20px;height: 20px">View Detail
                    </a>
                    <a href="#" class="btn btn-sm text-dark p-0 d-flex gap-1 align-items-center">
                        <img src="${pageContext.request.contextPath}/assets/Icons/shopping-bag.png" alt="cart" style="width: 20px;height: 20px">Add To
                        Cart
                    </a>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-4">
            <div class="card product-item border-0 mb-4 shadow">
                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                    <img class="img-fluid w-100" src="${pageContext.request.contextPath}/assets/headphone.jpg" alt="">
                </div>
                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                    <h5 class="text-truncate mb-3">Headphone</h5>
                    <div class="d-flex justify-content-center">
                        <h6>$123.00</h6>
                        <h6 class="text-muted ml-2">
                            <del>$123.00</del>
                        </h6>
                    </div>
                </div>
                <div class="card-footer d-flex justify-content-between bg-light border">
                    <a href="#" class="btn btn-sm text-dark p-0 d-flex gap-1 align-items-center">
                        <img src="${pageContext.request.contextPath}/assets/Icons/eye.png" alt="cart" style="width: 20px;height: 20px">View Detail
                    </a>
                    <a href="#" class="btn btn-sm text-dark p-0 d-flex gap-1 align-items-center">
                        <img src="${pageContext.request.contextPath}/assets/Icons/shopping-bag.png" alt="cart" style="width: 20px;height: 20px">Add To
                        Cart
                    </a>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-4">
            <div class="card product-item border-0 mb-4 shadow">
                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                    <img class="img-fluid w-100" src="${pageContext.request.contextPath}/assets/product-1.jpg" alt="">
                </div>
                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                    <h5 class="text-truncate mb-3">Colorful Stylish Shirt</h5>
                    <div class="d-flex justify-content-center">
                        <h6>$123.00</h6>
                        <h6 class="text-muted ml-2">
                            <del>$123.00</del>
                        </h6>
                    </div>
                </div>
                <div class="card-footer d-flex justify-content-between bg-light border">
                    <a href="#" class="btn btn-sm text-dark p-0 d-flex gap-1 align-items-center">
                        <img src="${pageContext.request.contextPath}/assets/Icons/eye.png" alt="cart" style="width: 20px;height: 20px">View Detail
                    </a>
                    <a href="#" class="btn btn-sm text-dark p-0 d-flex gap-1 align-items-center">
                        <img src="${pageContext.request.contextPath}/assets/Icons/shopping-bag.png" alt="cart" style="width: 20px;height: 20px">Add To
                        Cart
                    </a>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-4">
            <div class="card product-item border-0 mb-4 shadow">
                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                    <img class="img-fluid w-100" src="${pageContext.request.contextPath}/assets/product-1.jpg" alt="">
                </div>
                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                    <h5 class="text-truncate mb-3">Colorful Stylish Shirt</h5>
                    <div class="d-flex justify-content-center">
                        <h6>$123.00</h6>
                        <h6 class="text-muted ml-2">
                            <del>$123.00</del>
                        </h6>
                    </div>
                </div>
                <div class="card-footer d-flex justify-content-between bg-light border">
                    <a href="#" class="btn btn-sm text-dark p-0 d-flex gap-1 align-items-center">
                        <img src="${pageContext.request.contextPath}/assets/Icons/eye.png" alt="cart" style="width: 20px;height: 20px">View Detail
                    </a>
                    <a href="#" class="btn btn-sm text-dark p-0 d-flex gap-1 align-items-center">
                        <img src="${pageContext.request.contextPath}/assets/Icons/shopping-bag.png" alt="cart" style="width: 20px;height: 20px">Add To
                        Cart
                    </a>
                </div>
            </div>
            <div class="row">
                <div class="d-flex align-items-center justify-content-end mb-3">
                    <a href="${pageContext.request.contextPath}/pages/shop.jsp" class="btn btn-warning btn-lg">See more<span> . . .</span> </a>
                </div>
            </div>
        </div>


    </div>
</div>


</body>
</html>
