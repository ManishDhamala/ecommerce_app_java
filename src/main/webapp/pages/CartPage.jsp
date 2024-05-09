<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icp.gadgets.doa.ProductDoa" %>
<%@ page import="com.icp.gadgets.doa.ImageDoa" %>
<%@ page import="com.icp.gadgets.utils.Helper" %>
<%@ page import="com.icp.gadgets.model.Carts" %>
<%@ page import="com.icp.gadgets.model.*" %>
<%@ page import="com.icp.gadgets.doa.Cartdoa" %><%--
  Created by IntelliJ IDEA.
  User: himalpun
  Date: 03/04/2024
  Time: 7:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart</title>
    <link rel="stylesheet" href="../styles/global.css">
    <link rel="stylesheet" href="../styles/css/myToast.css">
    <script src="../script/toast.script.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1
/crypto-js.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1
/hmac-sha256.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1
/enc-base64.min.js"></script>
<%--    <script src="../script/khalti.config.script.js"></script>--%>
    <style>
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
<%
    User user = null;
    List<CartItem> cartItems = null;
    Helper helper = new Helper();
    HttpSession isSession = request.getSession(false);
    int total = 0;
    int subTotal = 0;
    if (isSession == null || isSession.getAttribute("user") == null) {
        System.out.println("Session: " + isSession);
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
    }else{
        System.out.println("Session: " + isSession.getAttribute("user"));
        user = (User) session.getAttribute("user");
        Cartdoa cartdoa = new Cartdoa();
        cartItems = cartdoa.getCartItemByUserID(user.getId());
        for (CartItem cartItem : cartItems) {
            subTotal += cartItem.getPrice() * cartItem.getQuantity();
        }
         total = subTotal + 100;
        System.out.println("Cart Items: " + cartItems);
        System.out.println("User: " + user.getId());
        System.out.println(isSession.getAttribute("user"));
    }
    ImageDoa img = new ImageDoa();
%>

<%--header--%>
<jsp:include page="header.jsp"/>



<%--Cart Section--%>
<section class="h-auto">

    <div class="container py-5 h-auto">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col">
                <div class="card">
                    <div class="card-body p-4">

                        <div class="row">

                            <div class="col-lg-7">
                                <h5 class="mb-3"><a href="./shop.jsp" class="text-body">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" height="16"
                                         width="16">
                                        <path d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l160 160c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L109.2 288 416 288c17.7 0 32-14.3 32-32s-14.3-32-32-32l-306.7 0L214.6 118.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-160 160z"></path>
                                    </svg>
                                    Continue shopping</a></h5>
                                <hr>
                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <div>
                                        <p class="mb-1">Shopping carts
<%--                                            <span class="badge bg-warning text-dark" id="cart_counter"><%=cartItems.size()%></span>--%>
                                        </p>
<%--                                        <p class="mb-0">You have ${} items in your carts</p>--%>
                                    </div>
                                </div>
                                <%
                                    if (cartItems != null) {
                                        for (CartItem cartItem : cartItems) {
                                %>
                                <%
                                    String imgPath = img.getImgURLByProductId(cartItem.getProductId());
                                    String imgUri;
                                    if (imgPath == null) {
                                        imgUri = "../images/placeholder.png";
                                    }
                                    else {
                                        imgUri = request.getContextPath() +"/images/"+  new Helper().extractFileName(imgPath);
                                    }
//                                    System.out.println("Image Path: " + imgUri);
                                %>
                                <div class="card my-5" id="cart-item-<%=cartItem.getCartItemId()%>">
                                    <div class="card-body position-relative">
                                        <div class="d-flex justify-content-between">
                                            <div class="d-flex flex-row align-items-center">
                                                <div>
                                                    <img src="<%=imgUri%>" class="img-fluid rounded-3" alt="Shopping item"  onError="this.onerror=null;this.src='../images/placeholder.png';" style="width: 65px;">
                                                </div>
                                                <div class="ms-3">
                                                    <h5><%= cartItem.getProductName()%> @ Rs.<%=cartItem.getPrice()%></h5>
                                                </div>
                                            </div>
                                            <div class="d-flex flex-column gap-2 justify-content-end align-items-end">
                                                <div class=" d-flex align-items-center gap-2">
                                                    <button class="btn btn-warning"
                                                            id="minus_quantity_<%=cartItem.getCartItemId()%>"
                                                            <%= cartItem.getQuantity() == 1 ? "disabled" : "" %>
                                                            onclick="handleCartItemQuantityUpdate(<%=cartItem.getCartItemId()%>, <%=cartItem.getQuantity()-1%>)"
                                                    >
                                                        -
                                                    </button>
                                                    <h5 class="fw-normal mb-0" id="cart_item_quantity"><%= cartItem.getQuantity()%></h5>
                                                    <button class=" btn btn-warning"
                                                            id="add_quantity_<%=cartItem.getCartItemId()%>"
                                                            onclick="handleCartItemQuantityUpdate(<%=cartItem.getCartItemId()%>, <%=cartItem.getQuantity()+1%>)"
                                                            <%= cartItem.getQuantity() >= 5 ? "disabled" : "" %>
                                                    >
                                                        +
                                                    </button>
                                                </div>
                                                <div class=" ">
                                                    <h5 class="mb-0">Rs.<%=cartItem.getPrice() * cartItem.getQuantity()%></h5>
                                                </div>
                                                <button class=" btn btn-danger btn-sm position-absolute top-0 start-100 translate-middle "
                                                        onclick="handleCartItemDelete(<%=cartItem.getCartItemId()%>,<%=user.getId()%>)"
                                                >
                                                    <svg xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 448 512" height="16" width="16" style="color: white!important;" color="white">
                                                        <path fill="#ffffff" d="M135.2 17.7L128 32H32C14.3 32 0 46.3 0 64S14.3 96 32 96H416c17.7 0 32-14.3 32-32s-14.3-32-32-32H320l-7.2-14.3C307.4 6.8 296.3 0 284.2 0H163.8c-12.1 0-23.2 6.8-28.6 17.7zM416 128H32L53.2 467c1.6 25.3 22.6 45 47.9 45H346.9c25.3 0 46.3-19.7 47.9-45L416 128z"/>
                                                    </svg>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%
                                        }
                                    }
                                %>
<%--                                    assert user != null;%>--%>

                            </div>
                            <div class="col-lg-5">

                                <div class="card text-white rounded-3" style="background: orange">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center mb-4">
                                            <h5 class="mb-0">Order Details</h5>
                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-6.webp"
                                                 class="img-fluid rounded-3" style="width: 45px;" alt="Avatar">
                                        </div>
                                        <p class=" mb-2">Shipping Details</p>
                                        <form class="mt-4">
                                            <div class="form-outline form-white mb-4">
                                                <label class="form-label" for="customer_name" readonly="">Name</label>
                                                <input type="text" id="customer_name" class="form-control form-control-lg" size="17"
                                                       placeholder="Enter your name" value="<%=user != null ? user.getFullName() : ""%>"/>

                                            </div>
                                            <div class="form-outline form-white mb-4">
                                                <label class="form-label" for="customer_address" >Shipping Address</label>
                                                <input type="text" id="customer_address"  class="form-control form-control-lg"
                                                       siez="17"
                                                       placeholder="Lamachour, Pokhara" minlength="19" maxlength="19" value="<%=user != null ? user.getAddress() : ""%>"/>

                                            </div>

                                            <div class="form-outline form-white mb-4">
                                                <label class="form-label"  for="customer_phone">Phone Number</label>
                                                <input type="text" id="customer_phone" class="form-control form-control-lg"
                                                       siez="17"
                                                       placeholder="9806543522" minlength="19" maxlength="19" value="<%=user != null ? user.getPhoneNumber() : ""%>"/>
                                            </div>
                                        </form>
                                        <hr class="my-4">
                                        <div class="d-flex justify-content-between">
                                            <p class="mb-2">Subtotal</p>
                                            <p class="mb-2">Rs. <%=subTotal%> </p>
                                        </div>

                                        <div class="d-flex justify-content-between">
                                            <p class="mb-2">Shipping</p>
                                            <p class="mb-2">Rs. 100</p>
                                        </div>


                                        <div class="d-flex justify-content-between mb-4">
                                            <p class="mb-2">Total</p>
                                            <p class="mb-2">Rs. <%=total%></p>
                                        </div>
                                        <% if (user != null && !cartItems.isEmpty()) {%>
                                        <div class=" d-flex gap-2">

                                            <button type="button" class="btn  btn-lg "
                                                    style="background: #60BB45; color: whitesmoke; width: 100% "
                                                    id="pay_with_khalti"
                                                    onclick="handlePayWithKhalti()"
                                            >
                                                <div class=" " style="text-align: center">
                                                <span>Pay with Esewa <svg xmlns="http://www.w3.org/2000/svg"
                                                                  viewBox="0 0 448 512" width="16" height="16" fill="white"><path
                                                        d="M438.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-160-160c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L338.8 224 32 224c-17.7 0-32 14.3-32 32s14.3 32 32 32l306.7 0L233.4 393.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l160-160z"></path></svg></span>
                                                </div>
                                            </button>
                                            <button type="button" class="btn btn-lg"
                                                    style="background: #1a1d20; color: whitesmoke; width: 100% "
                                                    onclick="handleCheckout(<%=user.getId()%>, <%=total%>)"

                                            >
                                                <div class=" " style="text-align: center">
                                                <span>COD <svg xmlns="http://www.w3.org/2000/svg"
                                                                    viewBox="0 0 448 512" width="16" height="16" fill="white"><path
                                                        d="M438.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-160-160c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L338.8 224 32 224c-17.7 0-32 14.3-32 32s14.3 32 32 32l306.7 0L233.4 393.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l160-160z"></path></svg></span>
                                                </div>
                                            </button>
                                        </div>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class=" overlay bg-black position-absolute opacity-70" style="height: 100%; width: 100%; z-index: 2000; opacity: 30%; visibility: hidden" id="add_to_cart_overlay"></div>
<div class="position-absolute top-50 start-50 translate-middle rounded-5 overflow-hidden"  style="z-index: 2050; visibility: hidden" id="add_to_cart_loading">
    <img src="../assets/add_to_cart.gif" width="145" height="150" alt="loading"/>
</div>


<%--<div class=" overlay bg-black position-absolute opacity-70" style="height: 100%; width: 100%; z-index: 2000; opacity: 30%; visibility: hidden" id="checkout_overlay"></div>--%>
<div class="position-absolute top-50 start-50 translate-middle rounded-5 overflow-hidden"  style="z-index: 2050; visibility: hidden" id="khalti_img">
    <img src="../assets/khalti.png" width="438" height="235" alt="loading"/>
</div>

<%--footer--%>
<jsp:include page="footer.jsp"/>


<script>

    const toasts = new Toasts({
        width: 300,
        timing: 'ease',
        duration: '.5s',
        dimOld: false,
        position: 'top-right' // top-left | top-center | top-right | bottom-left | bottom-center | bottom-right
    });

    function  handleCartItemQuantityUpdate(cartItemId, quantity){
        //show loading overlay and loading gif
        document.getElementById('add_to_cart_overlay').style.visibility = 'visible';
        document.getElementById('add_to_cart_loading').style.visibility = 'visible';
        let xhr = new XMLHttpRequest();
        xhr.open("POST",'${pageContext.request.contextPath}/cart',true)
        xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded')
        xhr.onreadystatechange = function(){
            if(xhr.readyState === 4 && xhr.status === 200){
                setTimeout(function(){
                    document.getElementById('add_to_cart_overlay').style.visibility = 'hidden';
                    document.getElementById('add_to_cart_loading').style.visibility = 'hidden';
                    location.reload();
                }, 1000);
            }else if(xhr.status === 500){
                toasts.push({
                    title: 'Error!',
                    content: 'Cart item update failed',
                    style: 'error'
                });
            }
        }
        xhr.send('cartItemId='+cartItemId+'&quantity='+quantity+'&_method=PUT')
    }

    function handleCartItemDelete(cartItemId,userId){
        console.log("Cart Item ID: " + cartItemId)
        let xhr = new XMLHttpRequest();
        xhr.open("POST",'${pageContext.request.contextPath}/cart',true)
        xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded')
        console.log(xhr.responseXML)
        console.log(xhr)
        xhr.onreadystatechange = function(){
            if(xhr.readyState === 4 && xhr.status === 200){
                fetchUpdatedCartSize(userId);
                toasts.push({
                    title: 'Success!',
                    content: 'Cart item deleted successfully',
                    style: 'success'
                });

                //Re-render the page after successful delete without reload
                let cartItem = document.getElementById('cart-item-'+cartItemId);
                cartItem.remove();
            }else if(xhr.readyState === 4 && xhr.status === 500){
                toasts.push({
                    title: 'Error!',
                    content: 'Cart item delete failed',
                    style: 'error'
                });

            }
        }
        xhr.send('cartItemId='+cartItemId+'&_method=DELETE')
    }

    function fetchUpdatedCartSize(userId){
        let xhr = new XMLHttpRequest();
        xhr.open("GET", '${pageContext.request.contextPath}/cart?userId=' + userId, true);
        console.log(xhr)
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    document.getElementById("cart_counter").innerText = xhr.response;

                }
            }
        };
        xhr.send();
    }

    function handleCheckout( userId, totalAmt){
        document.getElementById('add_to_cart_overlay').style.visibility = 'visible';
        document.getElementById('add_to_cart_loading').style.visibility = 'visible';
        let cartItems = []
        <%
            if (cartItems != null) {
                for (CartItem cartItem : cartItems) {
        %>
        cartItems.push({
            productId: <%=cartItem.getProductId()%>,
            quantity: <%=cartItem.getQuantity()%>,
            price: <%=cartItem.getPrice()%>,
            cartItemId: <%=cartItem.getCartItemId()%>
        })
        <%
            }
        }
        %>
        let xhr = new XMLHttpRequest();
        xhr.open("POST",'${pageContext.request.contextPath}/order',true)
        xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded')
        xhr.onreadystatechange = function(){
            if(xhr.readyState === 4 && xhr.status === 200){
                toasts.push({
                    title: 'Success!',
                    content: 'Order placed successfully',
                    style: 'success'
                });
                setTimeout(function(){
                    document.getElementById('add_to_cart_overlay').style.visibility = 'hidden';
                    document.getElementById('add_to_cart_loading').style.visibility = 'hidden';
                    window.location.href = xhr.responseURL;
                }, 1500);
            }else if(xhr.status === 500){
                toasts.push({
                    title: 'Error!',
                    content: 'Order placement failed',
                    style: 'error'
                });
            }
        }
        xhr.send('userId='+userId+'&totalAmount='+totalAmt+'&orderStatus=PENDING' +'&paymentStatus=UNPAID' + '&cartItems='+JSON.stringify(cartItems));
    }


    function convertIntoPaisa(amount){
        return amount * 100;
    }



    function handlePayWithKhalti() {
        let cartItems = []
        let total = 0;

        <% if (cartItems != null) {
               for (CartItem cartItem : cartItems) { %>
        cartItems.push({
            productId: <%=cartItem.getProductId()%>,
            quantity: <%=cartItem.getQuantity()%>,
            price: <%=cartItem.getPrice()%>,
            cartItemId: <%=cartItem.getCartItemId()%>
        })
        total += <%=cartItem.getPrice()%> * <%=cartItem.getQuantity()%>
        <%     }
             }
        %>

        //First create order in the backend
        let xhr = new XMLHttpRequest();
        xhr.open("POST", '${pageContext.request.contextPath}/order', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var secret = "8gBm/:&EnhH.1/q";
                let formData = new FormData();

                function generateTransactionUUID() {
                    var currentTime = new Date();
                    var formattedTime = currentTime.toISOString().slice(2, 10).replace(/-/g, '') + '-' + currentTime.getHours() +
                        currentTime.getMinutes() + currentTime.getSeconds();
                    return formattedTime;
                }

                function generateSignature(total_amount, transaction_uuid, product_code, secret) {
                    var hash = CryptoJS.HmacSHA256(
                        "total_amount=" + total_amount + ',' + "transaction_uuid=" + transaction_uuid + ',' + "product_code=" + product_code,
                        secret);
                    var hashInBase64 = CryptoJS.enc.Base64.stringify(hash);
                    console.log(hashInBase64)
                    return hashInBase64;
                }
                var transaction_uuid = generateTransactionUUID();
                formData.append('total_amount', (total + 100).toString());
                formData.append('transaction_uuid', transaction_uuid);
                formData.append('product_code', 'EPAYTEST');
                formData.append('success_url', 'http://localhost:8080${pageContext.request.contextPath}/pages/success.jsp');
                formData.append('failure_url', 'http://localhost:8080${pageContext.request.contextPath}/pages/CartPage.jsp?errorMessage=Translation Failed');
                <%--formData.append('signature', '<%=helper.getAPiSecret("total_amount=" + (total + 100) + ',' + "transaction_uuid=" + "ab14a8f2b02c3" + ',' + "product_code=EPAYTEST")%>');--%>
                formData.append('signature', generateSignature((total + 100).toString(), transaction_uuid, 'EPAYTEST', secret));
                formData.append('product_delivery_charge', '100');
                formData.append('product_service_charge', '0');
                formData.append('service_charge', '0');
                formData.append('signed_field_names', 'total_amount,transaction_uuid,product_code');
                formData.append('tax_amount', '0');
                formData.append('amount', total.toString())

                var path = 'https://rc-epay.esewa.com.np/api/epay/main/v2/form'
                var form = document.createElement("form");
                form.setAttribute("method", "post");
                form.setAttribute("action", path);

                for (var key of formData.keys()) {
                    var hiddenField = document.createElement("input");
                    hiddenField.setAttribute("type", "hidden");
                    hiddenField.setAttribute("name", key);
                    hiddenField.setAttribute("value", formData.get(key));
                    form.appendChild(hiddenField);
                }
                document.body.appendChild(form);
                form.submit();
            } else if (xhr.status === 500) {
                toasts.push({
                    title: 'Error!',
                    content: 'Payment failed',
                    style: 'error'
                });
            }
        }
        <%
        if(user != null){
        %>
        xhr.send('userId=<%=user.getId()%>&totalAmount=' + (total+100) + '&orderStatus=PENDING' + '&paymentStatus=PAID' + '&cartItems=' + JSON.stringify(cartItems));
        <% } %>
    }
</script>

<script src="../script/myscript.js"></script>
</body>
</html>