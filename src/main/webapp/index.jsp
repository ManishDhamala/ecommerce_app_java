<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"  href="styles/css/mystyle.css">
<script defer src="styles/js/myscript.js"></script>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
<div class="alert alert-primary" role="alert">
  Hello guys now start working!

</div>
</h1>
<br/>
<a href="${pageContext.request.contextPath}/HelloServlet-servlet">Hello Testt servlet</a>
</body>
</html>