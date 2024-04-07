<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="../styles/css/login.css">
</head>
<body>
<div class="center">
    <div class="container">
        <div class="text">
            Login Form
        </div>
        <form action="#">
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
                <button type="submit">login</button>
            </div>
            <div class="signup-link">
                Not a member? <a href="register.jsp">Register now</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
