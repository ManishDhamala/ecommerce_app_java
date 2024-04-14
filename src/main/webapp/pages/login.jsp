<%@ page import="com.icp.gadgets.utils.StringUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="../styles/css/login.css">
</head>
<body style="background: white">
<div class="center" >
    <div class="container" style="border-radius: 5px">
        <div class="text">
            Login Form
        </div>
        <%--jsp error show--%>
        <%
            String errorMessage = (String) request.getParameter(StringUtils.ERROR_MESSAGE);

            if (errorMessage != null && !errorMessage.isEmpty()) {
        %>
        <div class="alert alert-danger d-flex align-items-center"
             role="alert">
            <i class="fa-solid fa-circle-xmark"
               style="color: #ff0000; font-size: 2em; padding-left: 15px;"></i>
            <span style="padding-left: 5px; " class="text-danger"><%=errorMessage%></span>
        </div>
        <%
            }
        %>
        <%--jsp error show--%>
        <form action="<%=request.getContextPath()%>/login-servlet" method="post">
            <div class="data">
                <label>Username</label>
                <input type="text" name="username" required>
            </div>
            <div class="data">
                <label>Password</label>
                <input type="password" name="password" required>
            </div>
            <div class="btn">
                <div class="inner"></div>
                <button type="submit" class="" style="background: #f06412">login</button>
            </div>
            <div class="signup-link">
                Not a member? <a href="register.jsp">Register now</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
