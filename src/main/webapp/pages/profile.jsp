<%@ page import="com.icp.gadgets.model.User" %>
<%@ page import="com.icp.gadgets.utils.StringUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/profile.styles.css">
    <script defer src="${pageContext.request.contextPath}/script/myscript.js"></script>


    <title>User Profile</title>
</head>
<body>
<%
//here if session is not active then it will redirect user to
// login page and if session is active then it will show the user profile.
    HttpSession isSession = request.getSession(false);
    if (isSession == null || isSession.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
    } else {
        User user = (User) isSession.getAttribute("user");
    }
%>

<!-- Header Start -->
<jsp:include page="header.jsp"/>
<%--<%--%>
<%--    String updateMessage = (String) request.getAttribute(StringUtils.UPDATED_MESSAGE);--%>

<%--    if (updateMessage != null && !updateMessage.isEmpty()) {--%>
<%--%>--%>
<%--<div class="alert alert-success d-flex align-items-center" role="alert"--%>
<%--     style="background-color: #28a745; border-radius: 10px; padding: 15px; width: 25%;">--%>
<%--    <i class="fa-solid fa-check-circle"--%>
<%--       style="color: #FFFFFF; font-size: 2em; margin-right: 10px;"></i> <span--%>
<%--        style="font-size: 1.2em; color: #FFFFFF;"><%=updateMessage%></span>--%>
<%--</div>--%>
<%--<%--%>
<%--    }--%>
<%--%>--%>


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
                                        <img class="mt-5"
                                             src="https://imgs.search.brave.com/J0ixr3aHGA8aitBrET8u4exc5KcrQl8PWXGrvAdsUY4/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9mcmVl/c3ZnLm9yZy9pbWcv/YWJzdHJhY3QtdXNl/ci1mbGF0LTQucG5n"
                                             style="width: 220px;height: 220px;" alt="First Image">
                                        <img class="overlay upload-icon"
                                             src="${pageContext.request.contextPath}/assets/upload.png"
                                             alt="upload"
                                             style="width: 30px;height: 30px;">
                                    </div>
                                </label>
                                <input type="file" id="file-upload" style="display: none;">
                            </div>

                            <div class=" mt-3">
                                <h4>${user.fullName}</h4>
                                <p class="text-muted font-size-sm mb-5">${user.address}</p>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card mb-3">
                    <div class="card-body">
                        <form action="<%=request.getContextPath()%>/save-servlet" method="post">

                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Fullname</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="text" class="form-control" value="${user.fullName}" name="fullname" readonly>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Username</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="text" class="form-control" value="${user.username}" name="username" readonly>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Email</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="email" class="form-control" value="${user.email}" name="email"  readonly>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Phone</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="tel" class="form-control" value="${user.phoneNumber}" name="phonenumber" readonly>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Date of Birth</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="tel" class="form-control" value="${user.dob}" name="dob" readonly>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Address</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="text" class="form-control" value="${user.address}" name="address" readonly>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-12 text-center">
                                    <div class="btn-group" role="group" aria-label="User actions">
                                        <button type="button" class="btn rounded-3 btn-outline-warning text-bg-warning text-white px-3 mx-2 gap-5 "
                                                href="" id="editButton" onclick="toggleEditMode()">Edit</button>
                                        <button  type="button" class="btn btn-danger rounded-3  text-white px-3 mx-2 " id="cancelButton" style="display: none;" onclick="cancelEdit()">Cancel</button>
                                        <button type="submit" class="btn btn-success px-3" id="saveButton">Save</button>
                                    </div>
                                </div>
                            </div>
                        </form>
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
<script>
    function toggleEditMode() {
        var inputs = document.getElementsByTagName("input");
        var editButton = document.getElementById("editButton");
        var cancelButton = document.getElementById("cancelButton");
        var saveButton = document.getElementById("saveButton");

        for (var i = 0; i < inputs.length; i++) {
            inputs[i].readOnly = !inputs[i].readOnly;
        }

        editButton.style.display = "none";
        cancelButton.style.display = "inline-block";
        saveButton.style.display = "inline-block";
    }

    function cancelEdit() {
        var inputs = document.getElementsByTagName("input");
        var editButton = document.getElementById("editButton");
        var cancelButton = document.getElementById("cancelButton");
        var saveButton = document.getElementById("saveButton");

        for (var i = 0; i < inputs.length; i++) {
            inputs[i].readOnly = true;
        }

        editButton.style.display = "inline-block";
        cancelButton.style.display = "none";
        saveButton.style.display = "inline-block";
    }


</script>
</body>
</html>
