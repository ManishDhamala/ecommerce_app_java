<%--
  Created by IntelliJ IDEA.
  User: himalpun
  Date: 28/03/2024
  Time: 5:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/mystyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/profile.styles.css">
    <script defer src="${pageContext.request.contextPath}/script/myscript.js"></script>

    <title>Title</title>
</head>
<body>
<!-- Header Start -->
<jsp:include page="header.jsp"/>

<div class="container">
    <div class="main-body">
        <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <div class="images_link">
                                <label for="file-upload" class="upload-label">
                                    <div class="image-container">
                                        <img class="mt-5" src="https://imgs.search.brave.com/J0ixr3aHGA8aitBrET8u4exc5KcrQl8PWXGrvAdsUY4/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9mcmVl/c3ZnLm9yZy9pbWcv/YWJzdHJhY3QtdXNl/ci1mbGF0LTQucG5n" style="width: 220px;height: 220px;" alt="First Image">
                                        <img class="overlay upload-icon" src="${pageContext.request.contextPath}/assets/upload.png"
                                             alt="upload"
                                             style="width: 30px;height: 30px;">
                                    </div>
                                </label>
                                <input type="file" id="file-upload" style="display: none;">
                            </div>

                            <div class=" mt-3">
                                <h4>John Doe</h4>
                                <p class="text-muted font-size-sm mb-5">Address</p>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card mb-3">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Fullname</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <input type="text" class="form-control" value="Balen Shah">
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Phone</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <input type="text" class="form-control" value="(320) 380-4539">
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Email</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <input type="email" class="form-control" value="balen@gmail.com">
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Phone</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <input type="tel" class="form-control" value="9825557888">
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Address</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <input type="text" class="form-control" value="Bay Area, San Francisco, CA">
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-12">
                                <a class="btn  btn-outline-warning text-bg-warning text-white px-3 mx-2"
                                   href="">Edit</a>
                                <a class="btn  btn-success px-3 " href="">Save</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%--main content end--%>

<%--footerstart--%>
<jsp:include page="footer.jsp"/>
<%--footerend--%>
</body>
</html>
