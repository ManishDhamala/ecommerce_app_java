<%--
  Created by IntelliJ IDEA.
  User: SUSHIL
  Date: 4/3/2024
  Time: 5:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/carousel.styles.css">
</head>
<body>
<%--carousel--%>
<div id="hero-carousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#hero-carousel" data-bs-slide-to="0" class="active" aria-current="true"
                aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#hero-carousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#hero-carousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>

    <div class="carousel-inner">
        <div class="carousel-item active c-item">
            <img src="${pageContext.request.contextPath}/assets/headphonemain.jpg" class="d-block w-100 c-img" alt="Slide 1">
            <div class="carousel-caption top-0 mt-4">
                <p class="mt-5 fs-3 text-uppercase">Tech Tailored to Your Lifestyle</p>
                <h1 class="display-1 fw-bolder text-capitalize">Gadget Galore</h1>
                <button class="btn btn-orange px-4 py-2 fs-5 mt-5 ">Show now
                </button>
            </div>
        </div>
        <div class="carousel-item c-item">
            <img src="${pageContext.request.contextPath}/assets/watch.jpg" class="d-block w-100 c-img" alt="Slide 2">
            <div class="carousel-caption top-0 mt-4">
                <p class="text-uppercase fs-3 mt-5">Where Innovation Meets Convenience!</p>
                <p class="display-1 fw-bolder text-capitalize">Tech Haven</p>
                <button class="btn btn-orange px-4 py-2 fs-5 mt-5 bold" data-bs-toggle="modal"
                        data-bs-target="#booking-modal">Show now
                </button>
            </div>
        </div>
        <div class="carousel-item c-item">
            <img src="${pageContext.request.contextPath}/assets/joystick.jpg" class="d-block w-100 c-img" alt="Slide 3">
            <div class="carousel-caption top-0 mt-4">
                <p class="text-uppercase fs-3 mt-5">Transforming Your World, One Gadget at a Time!</p>
                <p class="display-1 fw-bolder text-capitalize">Digital Oasis</p>
                <button class="btn btn-orange px-4 py-2 fs-5 mt-5" data-bs-toggle="modal"
                        data-bs-target="#booking-modal">Show now
                </button>
            </div>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#hero-carousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#hero-carousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>
<%--carousel end--%>

</body>
</html>
