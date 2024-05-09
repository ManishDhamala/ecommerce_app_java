<%@ page import="com.icp.gadgets.model.User" %>
<%@ page import="com.icp.gadgets.doa.ProductDoa" %>
<%@ page import="com.mysql.cj.xdevapi.DbDoc" %>
<%@ page import="com.icp.gadgets.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icp.gadgets.model.Image" %>
<%@ page import="com.icp.gadgets.doa.ImageDoa" %>
<%@ page import="com.icp.gadgets.utils.Helper" %>
<%@ page import="com.icp.gadgets.utils.StringUtils" %>
<%@ page import="com.icp.gadgets.doa.Cartdoa" %>
<%@ page import="com.icp.gadgets.model.CartItem" %>
<%@ page import="static jdk.javadoc.internal.doclets.formats.html.markup.HtmlStyle.title" %><%--
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
<%--    <meta http-equiv="refresh" content="10">--%>
    <link rel="stylesheet" href="../styles/global.css">
    <link rel="stylesheet" href="../styles/css/shop.styles.css">
    <link rel="stylesheet" href="../styles/css/toast.styles.css">
    <script src="../script/toast.script.js"></script>
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
<body class=" relative">
<script src="../script/toast.script.js"></script>
<%
    User user = (User) session.getAttribute("user");
    String userId = session.getAttribute("userId") == null ? null : session.getAttribute("userId").toString();
    int cartSize = 0;
    if (user != null) {
        request.setAttribute("user", user);
        Cartdoa cartdoa = new Cartdoa();
        List<CartItem> cartItems = cartdoa.getCartItemByUserID(user.getId());
        cartSize = cartItems.size();
        System.out.println("cart size: " + cartSize);
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
                                    <h6>Rs. <%= product.getProductPrice() %></h6>
<%--                                    <h6 class="text-muted--%>
<%--                                    ml-2">--%>
<%--                                        <del>$<%= product.getProductPrice() %></del>--%>
<%--                                    </h6>--%>
                                </div>
                            </div>
                            <div class="card-footer bg-light border">
                                <div class="row">
                                    <div class="col-6">
                                        <a href="#" class="btn d-flex align-items-center px-2  py-1  gap-2 " id="" style="background:#ffc107;">
                                            <img src="../assets/Icons/eye.png" alt="carts" style="width: 20px;height: 20px; ">
                                            View Detail
                                        </a>
                                    </div>

                                        <div class="col-6">
                                            <button onclick="handleAddToCart(
                                                <%= userId %>,
                                                <%= product.getProductId() %>,
                                                1
                                            )"  class="btn d-flex align-items-center px-2 py-1  gap-1 " id="add_to_cart_btn" style="background:#ffc107;">
                                                <img src="../assets/Icons/shopping-bag.png" alt="carts" style="width: 20px;height: 20px;">
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

<!-- Footer Start -->
<jsp:include page="footer.jsp"/>
<!-- Footer End -->

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
<script src="../script/myscript.js"></script>
</body>
</html>
