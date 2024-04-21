<%@ page import="java.util.List" %>
<%@ page import="com.icp.gadgets.model.User" %>
<%@ page import="com.icp.gadgets.doa.UserDoa" %><%--
  Created by IntelliJ IDEA.
  User: himalpun
  Date: 13/04/2024
  Time: 2:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Orders</title>
    <link rel="stylesheet"  href="../styles/global.css">
    <link rel="stylesheet" href="../styles/global.css">
    <link rel="stylesheet" href="../styles/css/carousel.styles.css">
    <link rel="stylesheet" href="../styles/css/header.styles.css">
</head>
<body>
<jsp:include page="adminheader.jsp"/>
<%
    UserDoa users = new UserDoa();
    List<User> userList = users.getAllUsers();
%>
<div class="max-w-container-fluid mx-5 mt-5">
    <div class="d-flex justify-content-between align-items-center ">
        <div>
            <h2>Users</h2>
            <p>
                All users in the system
            </p>
        </div>
        <!-- Button trigger modal -->
        <%--    <div>--%>
        <%--        <button type="button" class="btn btn-primary py-3" data-bs-toggle="modal" data-bs-target="#addProduct">--%>
        <%--            Add new Products--%>
        <%--        </button>--%>
        <%--    </div>--%>
    </div>
    <table class="table ">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Phone Number</th>
            <th scope="col">username</th>
            <th scope="col">Date of birth</th>
            <th scope="col">Gender</th>
            <th scope="col">Address</th>
            <th scope="col">Role</th>
        </tr>
        </thead>
        <tbody>


        <%
            int i = 1;
            for (User user : userList) {
        %>
        <tr>
            <th scope="row"><%=i%></th>
            <td><%=user.getFullName()%></td>
            <td><%=user.getEmail()%></td>
            <td><%=user.getPhoneNumber()%></td>
            <td><%=user.getUsername()%></td>
            <td><%=user.getDob()%></td>
            <td><%=user.getGender()%></td>
            <td><%=user.getAddress()%></td>
            <td><%=user.getRole()%></td>
        </tr>
        <%
                i++;
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>
