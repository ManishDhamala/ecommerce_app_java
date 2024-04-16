<%@ page import="com.icp.gadgets.doa.CatgeoryDoa" %>
<%@ page import="com.icp.gadgets.model.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icp.gadgets.doa.ProductDoa" %>
<%@ page import="com.icp.gadgets.model.Product" %>
<%@ page import="com.icp.gadgets.doa.ImageDoa" %><%--
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
<%
    CatgeoryDoa categoryDoa = new CatgeoryDoa();
    List<Category> categories = categoryDoa.getAllCategories();

    ProductDoa productDoa = new ProductDoa();
    List<Product> products = productDoa.getAllProducts();

%>
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
                        <form method="post" action="${pageContext.request.contextPath}/product" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="productName" class="form-label">Product Name</label>
                                <input type="text" class="form-control" id="productName" name="productName" aria-describedby="emailHelp" required>
                            </div>
                            <div class="mb-3">
                                <label for="productPrice" class="form-label
                                ">Product Price</label>
                                <input type="text" class="form-control" id="productPrice" name="productPrice" required>
                            </div>
                            <div class="mb-3">
                                <label for="productCategory" class="form-label" >Product Category</label>
                                <select class="form-select" aria-label="Default select example" id="productCategory" name="categoryId" required>
                                    <option selected>Select Category</option>
                                    <% %>if (categories != null && !categories.isEmpty()) {
                                    <% for (Category category : categories) { %>
                                    <option value="<%= category.getCategoryId() %>"><%= category.getCategoryName() %></option>
                                    <% } %>
                                    } else {
                                    <option disabled>No categories available</option>
                                    }<% %>
                                </select>

                            </div>
                            <div class="mb-3">
                                <label for="productImage" class="form-label
                                ">Product Image</label>
                                <input type="file" class="form-control" id="productImage" name="productImage" required>
                            </div>
                            <div class="mb-3">
                                <label for="productDescription" class="form-label">Product Description</label>
                                <textarea class="form-control" id="productDescription" rows="3" required name="productDesc"></textarea>
                            </div>

                            <button type="submit" class="btn btn-primary " style="width: 100%">Add Product</button>
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
            <th scope="col">Image</th>
            <th scope="col">Name</th>
            <th scope="col">Price</th>
            <th scope="col">Description</th>
            <th scope="col">Category</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <%if (products != null && !products.isEmpty()) { %>

        <% for (Product product : products) { %>
        <%
            ImageDoa imageDoa = new ImageDoa();
            String imgUri;
            String image = imageDoa.getImgURLByProductId(product.getProductId());
            if(image != null && !image.isEmpty()){
                imgUri = request.getContextPath() +'/'+ image.substring(image.indexOf("images"));
            }else {
                imgUri = "https://st2.depositphotos.com/3904951/8925/v/450/depositphotos_89250312-stock-illustration-photo-picture-web-icon-in.jpg";
            }

        %>
        <tr>
            <th scope="row"><%= product.getProductId() %></th>
            <td><img src="<%= imgUri%>" alt="img" style="width: 50px; height: 50px; object-fit: cover"></td>
            <td><%= product.getProductName() %></td>
            <td><%= product.getProductPrice() %></td>
            <td><%= product.getProductDescription() %></td>
            <td><%= new CatgeoryDoa().getCategoryById(product.getCategoryId()) %></td>
            <td>
                <a href="${pageContext.request.contextPath}/product?productId=<%= product.getProductId() %>" class="btn btn-primary">Edit</a>
                <a href="${pageContext.request.contextPath}/product?productId=<%= product.getProductId() %>" class="btn btn-danger">Delete</a>
            </td>
        </tr>
        <% } %>
       <% } else { %>
        <tr>
            <td colspan="6">No products available</td>
        </tr>
        <% }%>

        </tbody>
    </table>
</div>
<script src="../script/myscript.js" type="module"></script>
</body>
</html>
