<%--
  Created by IntelliJ IDEA.
  User: SUSHIL
  Date: 4/3/2024
  Time: 5:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/mostSellingProduct.styles.css">
</head>
<body>

<div class="row mb-5">
    <div class="col-lg-12 text-center ">
        <h2 class="text-black fs-1 font-weight-bold mt-5">Most Selling <span class="text-warning">Product.</span></h2>
    </div>
</div>

<section class="product">
    <div class="product__photo">
        <div class="photo-container">
            <div class="photo-main">

                <img src="${pageContext.request.contextPath}/assets/headphone.jpg" alt="green apple slice">
            </div>

        </div>
    </div>
    <div class="product__info">
        <div class="title">
            <h1>Headphone</h1>

        </div>
        <div class="price">
            RS <span>999</span>
            <del>1299</del>
        </div>

        <div class="description">
            <h3>Features</h3>
            <ul>
                <li>Noise Cancellation</li>
                <li>High-Quality Audio</li>
                <li>Comfortable Fit</li>
                <li>Wireless Connectivity</li>
            </ul>
        </div>
        <button class="buy--btn">ADD TO CART</button>
    </div>
</section>


</body>
</html>
