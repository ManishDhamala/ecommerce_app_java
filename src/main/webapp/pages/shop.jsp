<%@ page import="com.icp.gadgets.model.User" %>
<%@ page import="com.icp.gadgets.doa.ProductDoa" %>
<%@ page import="com.mysql.cj.xdevapi.DbDoc" %>
<%@ page import="com.icp.gadgets.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icp.gadgets.model.Image" %>
<%@ page import="com.icp.gadgets.doa.ImageDoa" %>
<%@ page import="com.icp.gadgets.utils.Helper" %>
<%@ page import="com.icp.gadgets.utils.StringUtils" %><%--
  Created by IntelliJ IDEA.
  User: himalpun
  Date: 02/04/2024
  Time: 8:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shop</title>
    <link rel="stylesheet" href="../styles/global.css">
    <link rel="stylesheet" href="../styles/css/shop.styles.css">
    <link rel="stylesheet" href="../styles/css/toast.styles.css">
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
    String userId = session.getAttribute("userId") == null ? null : session.getAttribute("userId").toString();
    if (user != null) {
        request.setAttribute("user", user);
    }

    ProductDoa pd = new ProductDoa();
    List<Product> productList = pd.getAllProducts();

    ImageDoa img = new ImageDoa();


%>
<!-- Header Start -->
<jsp:include page="header.jsp"/>
<%--header end--%>
<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Our Shop</h1>
        <div class="d-inline-flex">
            <p class="m-0 "><a href="../index.jsp" class="text-primary">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Shop</p>
        </div>
    </div>
</div>
<!-- Page Header End -->

<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <!-- Shop Sidebar Start -->
        <div class="col-lg-3 col-md-12">
            <!-- Price Start -->
            <div class="border-bottom mb-4 pb-4">
                <h5 class="font-weight-semi-bold mb-4">Filter by price</h5>
                <form>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" checked id="price-all">
                        <label class="custom-control-label" for="price-all">All Price</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-1">
                        <label class="custom-control-label" for="price-1">$0 - $100</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-2">
                        <label class="custom-control-label" for="price-2">$100 - $200</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-3">
                        <label class="custom-control-label" for="price-3">$200 - $300</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-4">
                        <label class="custom-control-label" for="price-4">$300 - $400</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                        <input type="checkbox" class="custom-control-input" id="price-5">
                        <label class="custom-control-label" for="price-5">$400 - $500</label>
                    </div>
                </form>
            </div>
            <!-- Price End -->
            <!-- Color Start -->
            <div class="border-bottom mb-4 pb-4">
                <h5 class="font-weight-semi-bold mb-4">Filter by color</h5>
                <form>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" checked id="color-all">
                        <label class="custom-control-label" for="price-all">All Color</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="color-1">
                        <label class="custom-control-label" for="color-1">Black</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="color-2">
                        <label class="custom-control-label" for="color-2">White</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="color-3">
                        <label class="custom-control-label" for="color-3">Red</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="color-4">
                        <label class="custom-control-label" for="color-4">Blue</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                        <input type="checkbox" class="custom-control-input" id="color-5">
                        <label class="custom-control-label" for="color-5">Green</label>
                    </div>
                </form>
            </div>
            <!-- Color End -->
            <!-- Size Start -->
            <div class="mb-5">
                <h5 class="font-weight-semi-bold mb-4">Filter by size</h5>
                <form>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" checked id="size-all">
                        <label class="custom-control-label" for="size-all">All Size</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="size-1">
                        <label class="custom-control-label" for="size-1">XS</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="size-2">
                        <label class="custom-control-label" for="size-2">S</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="size-3">
                        <label class="custom-control-label" for="size-3">M</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="size-4">
                        <label class="custom-control-label" for="size-4">L</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                        <input type="checkbox" class="custom-control-input" id="size-5">
                        <label class="custom-control-label" for="size-5">XL</label>
                    </div>
                </form>
            </div>
            <!-- Size End -->
        </div>
        <!-- Shop Sidebar End -->
        <!-- Shop Product Start -->
        <div class="col-lg-9 col-md-12">
            <div class="row pb-3">
                <div class="col-12 pb-1">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <form action="">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search by name">
                                <div class="input-group-append">
                                        <span class="input-group-text bg-transparent text-primary">
                                            <img src="${pageContext.request.contextPath}/assets/Icons/search.png"
                                                 alt="search"
                                                 style="width: 20px;height: 20px">
                                        </span>
                                </div>
                            </div>
                        </form>
                        <div class="dropdown ml-4">
                            <button class="btn border dropdown-toggle" type="button" id="triggerId"
                                    data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                Sort by
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                <a class="dropdown-item" href="#">Latest</a>
                                <a class="dropdown-item" href="#">Popularity</a>
                                <a class="dropdown-item" href="#">Best Rating</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <%
                    if (!productList.isEmpty()) {
                    %>
                    <% for (Product product : productList) { %>
                    <%
                        String imgPath = img.getImgURLByProductId(product.getProductId());
                        String imgUri;
                        if (imgPath == null) {
                            imgUri = "../images/placeholder.png";
                        }
                        else {
                            imgUri = request.getContextPath() +"/images/"+  new Helper().extractFileName(imgPath);
                        }
                    %>
                    <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                        <div class="card product-item border-0 mb-4">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0 " style="cursor:pointer;">
                                <img class="img-fluid " style="width: 100%;height: 40vh; object-fit: cover"  src="<%= imgUri %>" alt=<%=product.getProductName()%>
                                     onError="this.onerror=null;this.src='../images/placeholder.png';"
                                >
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3"><%= product.getProductName() %></h6>
                                <div class="d-flex justify-content-center">
                                    <h6>$<%= product.getProductPrice() %></h6>
                                    <h6 class="text-muted
                                    ml-2">
                                        <del>$<%= product.getProductPrice() %></del>
                                    </h6>
                                </div>
                            </div>
                            <div class="card-footer bg-light border">
                                <div class="row">
                                    <div class="col-6">
                                        <a href="#" class="btn btn-sm text-dark p-0 d-flex align-items-center">
                                            <img src="../assets/Icons/eye.png" alt="carts" style="width: 20px;height: 20px">
                                            View Detail
                                        </a>
                                    </div>

                                        <div class="col-6">
                                            <button onclick="handleAddToCart(
                                                <%= userId %>,
                                                <%= product.getProductId() %>,
                                                1
                                            )"  class="btn btn-sm
                                            text-dark p-0 d-flex align-items-center justify-content-end">
                                                <img src="../assets/Icons/shopping-bag.png" alt="carts" style="width: 20px;height: 20px">
                                                Add To Cart
                                            </button>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <% } %>
                    <% } else { %>
                    <div class="col-12">
                        <p>No products available</p>
                    </div>
                    <% }%>
                </div>
                </div>
            </div>
        <!-- Shop Product End -->
    </div>
</div>
<div id="toast"></div>

<!-- Footer Start -->
<jsp:include page="footer.jsp"/>
<%--footer end--%>

<script>
    function  handleAddToCart(userId, productId, quantity){
        let  xhr = new XMLHttpRequest();
        xhr.open("POST",'${pageContext.request.contextPath}/cart',true)
        xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded')
        xhr.onreadystatechange = function (){
            if(xhr.readyState === 4 && xhr.status === 200){
                window.location.href = xhr.responseURL
            }
        }
        xhr.send('userId='+userId+'&productId='+productId+'&quantity='+quantity)
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


<script src="../script/myscript.js">
</script>
</body>
</html>
