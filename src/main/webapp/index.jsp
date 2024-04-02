<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"  href="styles/css/mystyle.css">
<script defer src="styles/js/myjs.js"></script>
    <title>JSP - Hello World</title>
</head>
<body>

 <h1>Welcome to Java Guys</h1>

 <h2>Bootstrap configured!!!</h2>

<div class="alert alert-primary" role="alert">
  A simple primary alert—check it out!
</div>
<div class="alert alert-secondary" role="alert">
  A simple secondary alert—check it out!
</div>
<div class="alert alert-success" role="alert">
  A simple success alert—check it out!
</div>
 <h2>Sushil</h2>
<h2>Java Guys</h2>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="${pageContext.request.contextPath}/register-servlet">Hello Testt servlet</a>
</body>
</html>