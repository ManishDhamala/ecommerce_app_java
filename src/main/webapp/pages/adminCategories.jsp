<%@ page import="com.icp.gadgets.utils.StringUtils" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icp.gadgets.doa.CatgeoryDoa" %>
<%@ page import="com.icp.gadgets.model.Category" %>
<%@ page import="java.util.ArrayList" %><%--
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
  <link rel="stylesheet" href="../styles/css/toast.styles.css">

</head>
<body>

<jsp:include page="adminheader.jsp"/>

<% 
  CatgeoryDoa categoryDoa = new CatgeoryDoa();
    List<Category> categories = categoryDoa.getAllCategories();
%>
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
    <%
      int i = 1;
      for (Category category : categories) {
    %>
    <tr>
        <th scope="row"><%= i %></th>
        <td><%= category.getCategoryName() %></td>
        <td>
          <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editCategory" data-bs-categoryId=<%=category.getCategoryId() %> data-bs-categoryName=<%= category.getCategoryName()%> >Edit</button>
          <button type="button" class=" btn btn-outline-danger" onclick="deleteCategory(<%= category.getCategoryId() %>)">Delete</button>
        </td>
    </tr>
    <%
        i++;
      }
    %>
    </tbody>
  </table>
</div>
<div id="toast"></div>

<!-- Edit Modal -->

<div class="modal fade" id="editCategory" tabindex="-1" aria-labelledby="editCategory" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="editCategoryLabel">Edit Category</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body
        ">
            <form action="${pageContext.request.contextPath}/category" method="post">
            <div class="mb-3">
                <label for="categoryName" class="form-label
                ">Category Name</label>
                <input type="text" class="form-control" id="editCategoryName" name="categoryName">
            </div>
            <input type="hidden" name="categoryId" id="categoryId">
              <input type="hidden" name="_method" value="PUT"> <!-- Use a hidden field for the _method parameter -->
            <button type="button" class="btn btn-primary" onclick="updateCategory()">Update Category</button>
        </form>
        </div>
    </div>
    </div>
</div>


<script>
  var editCategoryModal = document.getElementById('editCategory');
  editCategoryModal.addEventListener('show.bs.modal', function (event) {
    let button = event.relatedTarget;
    let categoryId = button.getAttribute('data-bs-categoryId');
    let categoryName = button.getAttribute('data-bs-categoryName');
    let modalTitle = editCategoryModal.querySelector('.modal-title');
    let categoryNameInput = editCategoryModal.querySelector('#editCategoryName');
    let categoryIdInput = editCategoryModal.querySelector('#categoryId');

    modalTitle.textContent = 'Edit Category';
    categoryNameInput.value = categoryName;
    categoryIdInput.value = categoryId;
  });

  function updateCategory(){
    let categoryName = document.getElementById('editCategoryName').value;
    let categoryId = document.getElementById('categoryId').value;
    let xhr = new XMLHttpRequest();
    xhr.open('POST', '${pageContext.request.contextPath}/category', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function() {
      if (xhr.readyState === 4 && xhr.status === 200) {
        window.location.href = xhr.responseURL
      }
    };
    xhr.send('categoryName=' + categoryName + '&categoryId=' + categoryId +'&_method=PUT');

  }

  function deleteCategory(categoryId) {
    let xhr = new XMLHttpRequest();
    xhr.open('POST', '${pageContext.request.contextPath}/category', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function() {
      if (xhr.readyState === 4 && xhr.status === 200) {
        window.location.href = xhr.responseURL
      }
    };
    xhr.send('categoryId=' + categoryId + '&_method=DELETE');
  }
</script>


<script>
  function showAndRemoveToast() {
    let toast = document.getElementById("toast");
    console.log("showAndRemoveToast function is being called");

    <% String errorMessage = (String) request.getParameter(StringUtils.ERROR_MESSAGE);
       String successMessage = (String) request.getParameter(StringUtils.SUCCESS_MESSAGE);
       if (errorMessage != null) {
    %>
    toast.innerText = '<%= errorMessage %>';
    <% } else if (successMessage != null) { %>
    toast.innerText = '<%= successMessage %>';
    <% } %>

    // Set toast to be visible
    toast.style.visibility = "visible";

    // After 3 seconds, remove the toast from the DOM
    setTimeout(function() {
      toast.style.visibility = "hidden";
    }, 3000);
  }

  // Call the showAndRemoveToast function when the page loads
  <% if (errorMessage != null || successMessage != null) { %>
    showAndRemoveToast();
    <% } %>
</script>
<script src="../script/myscript.js" ></script>
<script src="../script/toast.js"></script>
</body>
</html>
