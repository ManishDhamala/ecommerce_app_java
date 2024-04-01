<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" type="text/css" href="./styles/global.css">
</head>
<body>
<h1 class="heading"><%= "Hello World!" %>
</h1>
<br/>
<a href="${pageContext.request.contextPath}/order-servlet" class="heading">Hello Testt servlet</a>
</body>
</html>