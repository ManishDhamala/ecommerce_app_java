<%@ page import="com.icp.gadgets.utils.StringUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/register.css">
</head>
<body>


<div class="container">
    <div class="title">Registration</div>
    <div class="content">

        <%--jsp error show--%>
        <%
            String errorMessage = (String) request.getParameter(StringUtils.ERROR_MESSAGE);

            if (errorMessage != null && !errorMessage.isEmpty()) {
        %>
            <div class="alert alert-danger" role="alert">
                <i class="fa-solid fa-circle-xmark"  style="color: #ff0000; font-size: 2em; padding-left: 15px;"></i>
                <span style="padding-left: 5px; color: #ff0000;"><%=errorMessage%></span>
            </div>
        <%
            }
        %>
            <%--jsp error show--%>
        <form action="<%=request.getContextPath()%>/register-servlet"  method="post">
            <div class="user-details">
                <div class="input-box">
                    <span class="details">Full Name</span>
                    <input type="text" name="fullname" placeholder="Enter your full name" required>
                </div>
                <div class="input-box">
                    <span class="details">Username</span>
                    <input type="text" name="username" placeholder="Enter your username" required>
                </div>
                <div class="input-box">
                    <span class="details">Email</span>
                    <input type="text" name="email" placeholder="Enter your email" required>
                </div>
                <div class="input-box">
                    <span class="details">Phone Number</span>
                    <input type="text" name="phonenumber" placeholder="Enter your number" required>
                </div>
                <div class="input-box">
                    <span class="details">Address</span>
                    <input type="text" name="address" placeholder="Enter your addreess" required>
                </div>
                <div class="input-box">
                    <span class="details">Date of Birth</span>
                    <input type="date" name="dob" required>
                </div>
                <div class="input-box">
                    <span class="details">Password</span>
                    <input type="password" name="password" placeholder="Enter your password" required>
                </div>
            </div>
            <div class="gender-details">
                <input type="radio" name="gender" id="dot-1" value="MALE" required>
                <input type="radio" name="gender" id="dot-2" value="FEMALE" required>
                <input type="radio" name="gender" id="dot-3" value="OTHER" required>
                <span class="gender-title">Gender</span>
                <div class="category">
                    <label for="dot-1">
                        <span class="dot one"></span>
                        <span class="gender">Male</span>
                    </label>
                    <label for="dot-2">
                        <span class="dot two"></span>
                        <span class="gender">Female</span>
                    </label>
                    <label for="dot-3">
                        <span class="dot three"></span>
                        <span class="gender">Other</span>
                    </label>
                </div>
            </div>
            <div class="button">
                <input type="submit" value="Register">
            </div>
            <div class="signup-link">
                Already a member? <a href="login.jsp">Login now</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>
