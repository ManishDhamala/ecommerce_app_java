<%--
  Created by IntelliJ IDEA.
  User: himalpun
  Date: 13/04/2024
  Time: 4:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Category</title>
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
      <h2>Categories</h2>
      <p>Manage your store categories</p>
    </div>
    <!-- Button trigger modal -->
    <div>
      <button type="button" class="btn btn-primary py-3" data-bs-toggle="modal" data-bs-target="#addProduct">
        Add new Category
      </button>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="addProduct" tabindex="-1" aria-labelledby="addProduct" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="addProductLabel">Add new Category</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form action="${pageContext.request.contextPath}/category" method="post">
                <div class="mb-3">
                    <label for="categoryName" class="form-label
                    ">Category Name</label>
                    <input type="text" class="form-control" id="categoryName" name="categoryName">
                </div>
              <button type="submit" class="btn btn-primary">Add Category</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <table class="table ">
    <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Name</th>
      <th scope="col">Actions</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>
        <div class="">
          <button type="button" class="btn btn-outline-secondary">
            Edit
          </button>
          <button type="button" class="btn btn-outline-danger">
            Delete
          </button>
        </div>
      </td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>
        <div class="">
          <button type="button" class="btn btn-outline-secondary">
            Edit
          </button>
          <button type="button" class="btn btn-outline-danger">
            Delete
          </button>
        </div>
      </td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td >Larry the Bird</td>
      <td>
        <div class="">
          <button type="button" class="btn btn-outline-secondary">
            Edit
          </button>
          <button type="button" class="btn btn-outline-danger">
            Delete
          </button>
        </div>
      </td>
    </tr>
    </tbody>
  </table>
</div>
<script src="../script/myscript.js" ></script>
</body>
</html>
