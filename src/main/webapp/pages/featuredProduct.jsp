<%@ page import="com.icp.gadgets.model.User" %>
<%@ page import="com.icp.gadgets.doa.Cartdoa" %>
<%@ page import="com.icp.gadgets.model.CartItem" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icp.gadgets.model.Product" %>
<%@ page import="com.icp.gadgets.doa.ProductDoa" %>
<%@ page import="com.icp.gadgets.doa.ImageDoa" %>
<%@ page import="com.icp.gadgets.utils.Helper" %><%--
  Created by IntelliJ IDEA.
  User: SUSHIL
  Date: 4/3/2024
  Time: 4:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>s
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/featuredProduct.style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/shop.styles.css">
    <script src="${pageContext.request.contextPath}/script/toast.script.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/mostSellingProduct.styles.css">
    <style>
        #add_to_cart_btn:hover {
            cursor: pointer;
            color: white;
        }
        .toast-notification {
            position: fixed;
            text-decoration: none;
            z-index: 999999;
            max-width: 300px;
            background-color: #fff;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.12);
            border-radius: 4px;
            display: flex;
            padding: 10px;
            transform: translate(0, -150%);
        }
        .toast-notification .toast-notification-wrapper {
            flex: 1;
            padding-right: 10px;
            overflow: hidden;
        }
        .toast-notification .toast-notification-wrapper .toast-notification-header {
            padding: 0 0 5px 0;
            margin: 0;
            font-weight: 500;
            font-size: 14px;
            word-break: break-all;
            color: #4f525a;
        }
        .toast-notification .toast-notification-wrapper .toast-notification-content {
            font-size: 14px;
            margin: 0;
            padding: 0;
            word-break: break-all;
            color: #4f525a;
        }
        .toast-notification .toast-notification-close {
            appearance: none;
            border: none;
            background: transparent;
            cursor: pointer;
            font-size: 24px;
            line-height: 24px;
            padding-bottom: 4px;
            font-weight: bold;
            color: rgba(0, 0, 0, 0.2);
        }
        .toast-notification .toast-notification-close:hover {
            color: rgba(0, 0, 0, 0.4);
        }
        .toast-notification.toast-notification-top-center {
            transform: translate(calc(50vw - 50%), -150%);
        }
        .toast-notification.toast-notification-bottom-left, .toast-notification.toast-notification-bottom-right {
            transform: translate(0, 150%);
        }
        .toast-notification.toast-notification-bottom-center {
            transform: translate(calc(50vw - 50%), 150%);
        }
        .toast-notification.toast-notification-dark {
            background-color: #2d2e31;
        }
        .toast-notification.toast-notification-dark .toast-notification-wrapper .toast-notification-header {
            color: #edeff3;
        }
        .toast-notification.toast-notification-dark .toast-notification-wrapper .toast-notification-content {
            color: #edeff3;
        }
        .toast-notification.toast-notification-dark .toast-notification-close {
            color: rgba(255, 255, 255, 0.2);
        }
        .toast-notification.toast-notification-dark .toast-notification-close:hover {
            color: rgba(255, 255, 255, 0.4);
        }
        .toast-notification.toast-notification-success {
            background-color: #C3F3D7;
            border-left: 4px solid #51a775;
        }
        .toast-notification.toast-notification-success .toast-notification-wrapper .toast-notification-header {
            color: #51a775;
        }
        .toast-notification.toast-notification-success .toast-notification-wrapper .toast-notification-content {
            color: #51a775;
        }
        .toast-notification.toast-notification-success .toast-notification-close {
            color: rgba(0, 0, 0, 0.2);
        }
        .toast-notification.toast-notification-success .toast-notification-close:hover {
            color: rgba(0, 0, 0, 0.4);
        }
        .toast-notification.toast-notification-error {
            background-color: #f3c3c3;
            border-left: 4px solid #a75151;
        }
        .toast-notification.toast-notification-error .toast-notification-wrapper .toast-notification-header {
            color: #a75151;
        }
        .toast-notification.toast-notification-error .toast-notification-wrapper .toast-notification-content {
            color: #a75151;
        }
        .toast-notification.toast-notification-error .toast-notification-close {
            color: rgba(0, 0, 0, 0.2);
        }
        .toast-notification.toast-notification-error .toast-notification-close:hover {
            color: rgba(0, 0, 0, 0.4);
        }
        .toast-notification.toast-notification-verified {
            background-color: #d0eaff;
            border-left: 4px solid #6097b8;
        }
        .toast-notification.toast-notification-verified .toast-notification-wrapper .toast-notification-header {
            color: #6097b8;
        }
        .toast-notification.toast-notification-verified .toast-notification-wrapper .toast-notification-content {
            color: #6097b8;
        }
        .toast-notification.toast-notification-verified .toast-notification-close {
            color: rgba(0, 0, 0, 0.2);
        }
        .toast-notification.toast-notification-verified .toast-notification-close:hover {
            color: rgba(0, 0, 0, 0.4);
        }
        .toast-notification.toast-notification-dimmed {
            opacity: .3;
        }
        .toast-notification.toast-notification-dimmed:hover, .toast-notification.toast-notification-dimmed:active {
            opacity: 1;
        }
    </style>
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
    String userId = session.getAttribute("userId") == null ? null : session.getAttribute("userId").toString();
    int cartSize = 0;
    if (user != null) {
        request.setAttribute("user", user);
        Cartdoa cartdoa = new Cartdoa();
        List<CartItem> cartItems = cartdoa.getCartItemByUserID(user.getId());
        cartSize = cartItems.size();
    }
    ProductDoa pd = new ProductDoa();
    List<Product> productList = pd.getAllProducts();
    ImageDoa img = new ImageDoa();
    Product mostSoldProduct = pd.getMostSellingProduct();
    System.out.println("Most sold product: " + mostSoldProduct);
%>
<div class="container shadow my-5 ">
    <div class="row ">
        <div class="col-lg-12 text-center mb-4">
            <h2 class="text-black fs-1 font-weight-bold mt-5">Featured <span class="text-warning">Product.</span></h2>
        </div>
    </div>
    <div class="row">
        <%
            if (!productList.isEmpty()) {
                // Limit rendering to first 4 products
                int count = 0;
                for (Product product : productList) {
                    if (count >= 4) break; // Exit loop after 4 products
                    count++;
        %>
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
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1"> <!-- Adjusted column size for 4 products -->
            <div class="card product-item border-0 mb-4">
                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0 " style="cursor:pointer;">
                    <img class="img-fluid " style="width: 100%;height: 40vh; object-fit: cover"  src="<%= imgUri %>" alt=<%=product.getProductName()%>
                            onError="this.onerror=null;this.src='../images/placeholder.png';"
                    >
                </div>
                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                    <h6 class="text-truncate mb-3"><%= product.getProductName() %></h6>
                    <div class="d-flex justify-content-center">
                        <h6>Rs. <%= product.getProductPrice() %></h6>
                    </div>
                </div>
                <div class="card-footer bg-light border">
                    <div class="row">
                        <div class="col-6">
                            <a href="${pageContext.request.contextPath}/pages/SingleProduct.jsp?productId=<%=product.getProductId()%>" class="btn d-flex align-items-center px-2  py-1  gap-2 " id="" style="background:#ffc107;">
                                <img src="${pageContext.request.contextPath}/assets/Icons/eye.png" alt="carts" style="width: 20px;height: 20px; ">
                                View Detail
                            </a>
                        </div>

                        <div class="col-6">
                            <button onclick="handleAddToCart(
                                <%= userId %>,
                                <%= product.getProductId() %>,
                                    1
                                    )"  class="btn d-flex align-items-center px-2 py-1  gap-1 " id="add_to_cart_btn" style="background:#ffc107;">
                                <img src="${pageContext.request.contextPath}/assets/Icons/shopping-bag.png" alt="carts" style="width: 20px;height: 20px;">
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
    <div class="row">
        <div class="d-flex align-items-center justify-content-end mb-3">
            <a href="${pageContext.request.contextPath}/pages/shop.jsp" class="btn btn-warning btn-lg">See more<span> . . .</span> </a>
        </div>
    </div>
        </div>


<div class="row mb-5">
    <div class="col-lg-12 text-center ">
        <h2 class="text-black fs-1 font-weight-bold mt-5">Most Selling <span class="text-warning">Product.</span></h2>
    </div>
</div>

<section class="product">
    <div class="product__photo">
        <div class="photo-container">
            <div class="photo-main" style="padding: 5px; top: -4rem">
                <%
                    String imgPath = img.getImgURLByProductId(mostSoldProduct.getProductId());
                    String imgUri;
                    if (imgPath == null) {
                        imgUri = "../images/placeholder.png";
                    }
                    else {
                        imgUri = request.getContextPath() +"/images/"+  new Helper().extractFileName(imgPath);
                    }
                %>

                <img src="<%=imgUri%>" alt="green apple slice" style="top: -4rem; padding: 2px">
            </div>

        </div>
    </div>
    <div class="product__info">
        <div class="title">
            <h1>
                <%= mostSoldProduct.getProductName() %>
            </h1>

        </div>
        <div class="price">
            RS <%= mostSoldProduct.getProductPrice() %>
        </div>

        <div class="description">
            <h3>Features</h3>

                <p>
                    <%= mostSoldProduct.getProductDescription() %>
                </p>

        </div>
        <button class="buy--btn"
                onclick="handleAddToCart(
                    <%= userId %>,
                    <%= mostSoldProduct.getProductId() %>,
                    1
                    )"
        >ADD TO CART</button>
    </div>
</section>

<script>
    const toasts = new Toasts({
        width: 300,
        timing: 'ease',
        duration: '.5s',
        dimOld: false,
        position: 'top-right' // top-left | top-center | top-right | bottom-left | bottom-center | bottom-right
    });
    function handleAddToCart(userId, productId, quantity) {
        let xhr = new XMLHttpRequest();
        xhr.open("POST", '${pageContext.request.contextPath}/cart', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    fetchUpdatedCartSize(userId);
                    toasts.push({
                        title: 'Success',
                        content: 'Product added to cart',
                        style: 'success'
                    });
                } else if (xhr.status === 404) {
                    window.location.href = '${pageContext.request.contextPath}/pages/login.jsp';
                }else {
                    toasts.push({
                        title: 'Error',
                        content: 'Failed to add product to cart',
                        style: 'error'
                    });
                }
            }
        };
        xhr.send('userId=' + userId + '&productId=' + productId + '&quantity=' + quantity);
    }

    function fetchUpdatedCartSize(userId){
        let xhr = new XMLHttpRequest();
        xhr.open("GET", '${pageContext.request.contextPath}/cart?userId=' + userId, true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    document.getElementById("cart_counter").innerText = xhr.response;
                }
            }
        };
        xhr.send();
    }
</script>
</body>
</html>
