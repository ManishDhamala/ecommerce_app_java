<%@ page import="com.icp.gadgets.doa.CatgeoryDoa" %>
<%@ page import="com.icp.gadgets.model.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icp.gadgets.doa.ProductDoa" %>
<%@ page import="com.icp.gadgets.model.Product" %>
<%@ page import="com.icp.gadgets.doa.ImageDoa" %>
<%@ page import="com.icp.gadgets.utils.StringUtils" %><%--
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
    <link rel="stylesheet" href="../styles/css/toast.styles.css">
</head>
<body>
<jsp:include page="adminheader.jsp"/>
<%
    HttpSession isSession = request.getSession(false);
    if (isSession == null || isSession.getAttribute("user") == null || !isSession.getAttribute("userRole").equals("ADMIN")) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
    }
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
            <td><img src=<%=imgUri%> alt="img" style="width: 50px; height: 50px; object-fit: cover"></td>
            <td><%= product.getProductName() %></td>
            <td><%= product.getProductPrice() %></td>
            <td><%= product.getProductDescription() %></td>
            <td><%= new CatgeoryDoa().getCategoryById(product.getCategoryId()) %></td>
            <td>
                <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editProduct" data-bs-productId=<%=product.getProductId() %>
                        data-bs-productDesc=<%= product.getProductDescription()%> data-bs-productCategory=<%= product.getCategoryId()%>
                        data-bs-productPrice=<%=product.getProductPrice()%>
<%--                        data-bs-productImgName=<%=imgName%>--%>
                        data-bs-ImageExist=<%=
                        image != null && !image.isEmpty()
                            %>
                        data-bs-productName=<%= product.getProductName()%>  >Edit</button>
                <button type="button" class=" btn btn-outline-danger" onclick="deleteProduct(<%= product.getProductId() %>)">Delete</button>
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

<div id="toast"></div>

<!-- Modal -->

<div class="modal fade" id="editProduct" tabindex="-1" aria-labelledby="editProduct" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="editProductLabel"></h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body
            ">
                <form>
                    <div class="mb-3">
                        <label for="productName" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="editproductName" name="productName" aria-describedby="emailHelp" required>
                    </div>
                    <div class="mb-3">
                        <label for="productPrice" class="form-label
                        ">Product Price</label>
                        <input type="text" class="form-control" id="editproductPrice" name="productPrice" required>
                    </div>
                    <div class="mb-3">
                        <label for="productCategory" class="form-label" >Product Category</label>
                        <select class="form-select" aria-label="Default select example" id="editproductCategory" name="categoryId" required>
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
                        <input type="file" class="form-control" id="editproductImage" name="productImage" >
                        <input name="productId" id="editproductId" hidden="hidden">
<%--                        <input name="oldImgName" id="editOldImgName" hidden="hidden">--%>
                        <p id="editImageExist" class="mt-2">
                        </p>
                    </div>
                    <div class="mb-3">
                        <label for="productDescription" class="form-label">Product Description</label>

                        <textarea class="form-control" id="editproductDescription" rows="3" required name="productDesc"></textarea>
                    </div>
                    <button type="button" onclick="updateProduct()" class="btn btn-primary " style="width: 100%">Edit Product</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    let editProductModal = document.getElementById('editProduct');
    editProductModal.addEventListener('show.bs.modal', function (event) {
        let button = event.relatedTarget;
        let productId = button.getAttribute('data-bs-productId');
        let productDesc = button.getAttribute('data-bs-productDesc');
        let productCategory = button.getAttribute('data-bs-productCategory');
        let productPrice = button.getAttribute('data-bs-productPrice');
        // let oldImgName = button.getAttribute('data-bs-productImgName');
        let productName = button.getAttribute('data-bs-productName');
        let imageExist = button.getAttribute('data-bs-ImageExist');

        let modalTitle = editProductModal.querySelector('.modal-title');
        let productNameInput = editProductModal.querySelector('#editproductName');
        let productPriceInput = editProductModal.querySelector('#editproductPrice');
        let productCategoryInput = editProductModal.querySelector('#editproductCategory');
        // let productOldImageName = editProductModal.querySelector('#editOldImgName');
        let productDescriptionInput = editProductModal.querySelector('#editproductDescription');
        let imageExistInput = editProductModal.querySelector('#editImageExist');
        let productIdInput = editProductModal.querySelector('#editproductId');

        modalTitle.innerText = `Edit Product`;
        productNameInput.value = productName;
        productPriceInput.value = productPrice;
        productCategoryInput.value = productCategory;
        // productOldImageName.value = oldImgName;
        productDescriptionInput.value = productDesc;
        productIdInput.value = productId;
        if(imageExist === 'true'){
            imageExistInput.innerText = 'Image already exist';
        }else {
            imageExistInput.innerText = 'No image exist';
        }
    });

    function updateProduct() {
        let productName = document.getElementById('editproductName').value;
        let productPrice = document.getElementById('editproductPrice').value;
        let productCategoryId = document.getElementById('editproductCategory').value;
        let productImage = document.getElementById('editproductImage').files[0]; // Get the File object
        let productDescription = document.getElementById('editproductDescription').value;
        let productId = document.getElementById('editproductId').value;
        // let productOldImageName = document.getElementById('editOldImgName').value;

        let formData = new FormData();
        formData.append('productName', productName);
        formData.append('productPrice', productPrice);
        formData.append('categoryId', productCategoryId);
        formData.append('productImage', productImage);
        formData.append('productDesc', productDescription);
        formData.append('productId', productId);
        formData.append('_method', 'PUT');
        // formData.append('oldImgName', productOldImageName);

        for (const value of formData.values()) {
            console.log(value);
        }
        let xhr = new XMLHttpRequest();
        xhr.open('POST', '${pageContext.request.contextPath}/product', true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                window.location.href = xhr.responseURL;
            }
        };
        xhr.send(formData);
    }

    function  deleteProduct(productId) {
        let xhr = new XMLHttpRequest();
        xhr.open('POST','${pageContext.request.contextPath}/product', true);
        xhr.setRequestHeader('content-type', 'application/x-www-form-urlencoded')
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                window.location.href = xhr.responseURL;
            }
        };
        xhr.send('productId=' + productId + '&_method=DELETE');
    }

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
<script src="../script/myscript.js" type="module"></script>
</body>
</html>
