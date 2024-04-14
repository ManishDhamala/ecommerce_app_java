<%--
  Created by IntelliJ IDEA.
  User: abhiskar
  Date: 13/04/2024
  Time: 2:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Product</title>
    <link rel="stylesheet"  href="../styles/global.css">
    <link rel="stylesheet" href="../styles/global.css">
    <link rel="stylesheet" href="../styles/css/carousel.styles.css">
    <link rel="stylesheet" href="../styles/css/header.styles.css">
</head>
<body>
<jsp:include page="adminheader.jsp"/>
<div class="max-w-container-fluid mx-5 mt-5">

    <div class="d-flex justify-content-between align-items-center ">
        <div>
            <h2>Products</h2>
            <p>Manage your store products</p>
        </div>
        <!-- Button trigger modal -->
        <div>
            <button type="button" class="btn btn-primary py-3" data-bs-toggle="modal" data-bs-target="#addProduct">
                Add new Products
            </button>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="addProduct" tabindex="-1" aria-labelledby="addProduct" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="addProductLabel">Modal title</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <table class="table ">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Image</th>
            <th scope="col">Name</th>
            <th scope="col">Price</th>
            <th scope="col">Category</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row">1</th>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
        </tr>
        <tr>
            <th scope="row">2</th>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
        </tr>
        <tr>
            <th scope="row">3</th>
            <td colspan="2">Larry the Bird</td>
            <td>@twitter</td>
        </tr>
        </tbody>
    </table>
</div>
<script src="../script/myscript.js" type="module"></script>
</body>
</html>
