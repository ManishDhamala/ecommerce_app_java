<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet"  href="styles/css/mystyle.css">
<script src="styles/js/myscript.js"></script>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<div class="alert alert-primary" role="alert">
  A simple primary alert—check it out!
</div>
<div class="alert alert-secondary" role="alert">
  A simple secondary alert—check it out!
</div>
<div class="alert alert-success" role="alert">
  A simple success alert—check it out!
</div>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="${pageContext.request.contextPath}/HelloServlet-servlet">Hello Testt servlet</a>
</body>
</html>