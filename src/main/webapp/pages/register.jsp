<%@ page import="com.icp.gadgets.utils.StringUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/register.css">
    <script src="../script/toast.script.js"></script>
    <style>
        .toast-notification {
            position: fixed;
            text-decoration: none;
            z-index: 999999;
            max-width: 300px;
            background-color: #fff;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.12);
            border-radius: 4px;
            display: flex;
            padding: 10px;
            transform: translate(0, -150%);
        }
        .toast-notification .toast-notification-wrapper {
            flex: 1;
            padding-right: 10px;
            overflow: hidden;
        }
        .toast-notification .toast-notification-wrapper .toast-notification-header {
            padding: 0 0 5px 0;
            margin: 0;
            font-weight: 500;
            font-size: 14px;
            word-break: break-all;
            color: #4f525a;
        }
        .toast-notification .toast-notification-wrapper .toast-notification-content {
            font-size: 14px;
            margin: 0;
            padding: 0;
            word-break: break-all;
            color: #4f525a;
        }
        .toast-notification .toast-notification-close {
            appearance: none;
            border: none;
            background: transparent;
            cursor: pointer;
            font-size: 24px;
            line-height: 24px;
            padding-bottom: 4px;
            font-weight: bold;
            color: rgba(0, 0, 0, 0.2);
        }
        .toast-notification .toast-notification-close:hover {
            color: rgba(0, 0, 0, 0.4);
        }
        .toast-notification.toast-notification-top-center {
            transform: translate(calc(50vw - 50%), -150%);
        }
        .toast-notification.toast-notification-bottom-left, .toast-notification.toast-notification-bottom-right {
            transform: translate(0, 150%);
        }
        .toast-notification.toast-notification-bottom-center {
            transform: translate(calc(50vw - 50%), 150%);
        }
        .toast-notification.toast-notification-dark {
            background-color: #2d2e31;
        }
        .toast-notification.toast-notification-dark .toast-notification-wrapper .toast-notification-header {
            color: #edeff3;
        }
        .toast-notification.toast-notification-dark .toast-notification-wrapper .toast-notification-content {
            color: #edeff3;
        }
        .toast-notification.toast-notification-dark .toast-notification-close {
            color: rgba(255, 255, 255, 0.2);
        }
        .toast-notification.toast-notification-dark .toast-notification-close:hover {
            color: rgba(255, 255, 255, 0.4);
        }
        .toast-notification.toast-notification-success {
            background-color: #C3F3D7;
            border-left: 4px solid #51a775;
        }
        .toast-notification.toast-notification-success .toast-notification-wrapper .toast-notification-header {
            color: #51a775;
        }
        .toast-notification.toast-notification-success .toast-notification-wrapper .toast-notification-content {
            color: #51a775;
        }
        .toast-notification.toast-notification-success .toast-notification-close {
            color: rgba(0, 0, 0, 0.2);
        }
        .toast-notification.toast-notification-success .toast-notification-close:hover {
            color: rgba(0, 0, 0, 0.4);
        }
        .toast-notification.toast-notification-error {
            background-color: #f3c3c3;
            border-left: 4px solid #a75151;
        }
        .toast-notification.toast-notification-error .toast-notification-wrapper .toast-notification-header {
            color: #a75151;
        }
        .toast-notification.toast-notification-error .toast-notification-wrapper .toast-notification-content {
            color: #a75151;
        }
        .toast-notification.toast-notification-error .toast-notification-close {
            color: rgba(0, 0, 0, 0.2);
        }
        .toast-notification.toast-notification-error .toast-notification-close:hover {
            color: rgba(0, 0, 0, 0.4);
        }
        .toast-notification.toast-notification-verified {
            background-color: #d0eaff;
            border-left: 4px solid #6097b8;
        }
        .toast-notification.toast-notification-verified .toast-notification-wrapper .toast-notification-header {
            color: #6097b8;
        }
        .toast-notification.toast-notification-verified .toast-notification-wrapper .toast-notification-content {
            color: #6097b8;
        }
        .toast-notification.toast-notification-verified .toast-notification-close {
            color: rgba(0, 0, 0, 0.2);
        }
        .toast-notification.toast-notification-verified .toast-notification-close:hover {
            color: rgba(0, 0, 0, 0.4);
        }
        .toast-notification.toast-notification-dimmed {
            opacity: .3;
        }
        .toast-notification.toast-notification-dimmed:hover, .toast-notification.toast-notification-dimmed:active {
            opacity: 1;
        }
    </style>
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
            <script>
                const toasts = new Toasts({
                    width: 300,
                    timing: 'ease',
                    duration: '.5s',
                    dimOld: false,
                    position: 'top-right' // top-left | top-center | top-right | bottom-left | bottom-center | bottom-right
                });
                toasts.push({
                    title:"Error",
                    content:"<%=errorMessage%>",
                    style:'error'
                })
            </script>
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
