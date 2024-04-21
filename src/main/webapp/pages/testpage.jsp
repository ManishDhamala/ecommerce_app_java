<%@ page import="com.icp.gadgets.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Details</title>
</head>
<body>
<h1>User Details</h1>
<%
    User user = (User)request.getAttribute("user");
    if(user != null) {
%>
<p>Full Name: <%= user.getFullName() %></p>
<p>Username: <%= user.getUsername() %></p>
<p>Email: <%= user.getEmail() %></p>
<p>Phone Number: <%= user.getPhoneNumber() %></p>
<p>Address: <%= user.getAddress() %></p>
<p>Date of Birth: <%= user.getDob() %></p>
<p>Gender: <%= user.getGender() %></p>
<%
} else {
%>
<p>User not found</p>
<%
    }
%>
</body>
</html>
