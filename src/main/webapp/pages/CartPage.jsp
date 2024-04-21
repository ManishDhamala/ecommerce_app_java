<%@ page import="com.icp.gadgets.model.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.icp.gadgets.model.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icp.gadgets.doa.ProductDoa" %>
<%@ page import="com.icp.gadgets.model.Product" %>
<%@ page import="com.icp.gadgets.doa.ImageDoa" %><%--
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
</head>
<body>
<%--<%--%>
<%--    Boolean removed = (Boolean) request.getAttribute("removed");--%>
<%--    if (removed != null && removed) {--%>
<%--%>--%>
<%--<div class="alert alert-success" role="alert">--%>
<%--    Item removed from cart successfully!--%>
<%--</div>--%>
<%--<%--%>
<%--    }--%>
<%--%>--%>
<%--<%--%>
<%--    String removed = request.getParameter("removed");--%>
<%--    if (removed != null && removed.equals("true")) {--%>
<%--%>--%>
<%--<div class=" alert alert-success" role="alert">--%>
<%--    Item removed from cart successfully!--%>
<%--</div>--%>
<%--<%--%>
<%--    }--%>
<%--%>--%>

<%
    User user = (User) session.getAttribute("user");


    ArrayList<Cart>  cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if (cart_list != null) {
        ProductDoa pDao = new ProductDoa();
        cartProduct =   pDao.getCartProducts(cart_list);
        request.setAttribute("cart_List", cart_list);
        double total = pDao.getTotalCartPrice(cart_list);
        request.setAttribute("total", total);
    }
    ProductDoa pd = new ProductDoa();
    List<Product> productList = pd.getAllProducts();

    ImageDoa img = new ImageDoa();

%>

<%--header--%>
<jsp:include page="header.jsp"/>


<%--Cart Section--%>
<section class="h-100 h-custom">

    <div class="container py-5 h-100">
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
                                        <p class="mb-1">Shopping cart</p>
                                        <p class="mb-0">You have ${cart_List.size()} items in your cart</p>
                                    </div>
                                </div>
                                <%
                                    if (cart_list != null) {
                                        for (Cart cart : cartProduct) {
                                %>
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between">
                                            <div class="d-flex flex-row align-items-center">
                                                <div>
                                                    <img src="<%= img.getImgURLByProductId(cart.getProductId()) %>" class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                                                </div>
                                                <div class="ms-3">
                                                    <h5><%= cart.getProductName()%></h5>
                                                    <p class="small mb-0"><%= cart.getProductDescription()%></p>
                                                </div>
                                            </div>
                                            <div class="d-flex flex-row align-items-center">
                                                <div style="width: 50px;">
                                                    <h5 class="fw-normal mb-0"><%= cart.getQuantity()%></h5>
                                                </div>
                                                <div style="width: 80px;">
                                                    <h5 class="mb-0"><%= cart.getProductPrice() %></h5>
                                                </div>
                                                <a href="../RemoveFromCart-servlet?id=<%=cart.getProductId() %>" style="color: #cecece;">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" height="16" width="16">
                                                        <path d="M135.2 17.7L128 32H32C14.3 32 0 46.3 0 64S14.3 96 32 96H416c17.7 0 32-14.3 32-32s-14.3-32-32-32H320l-7.2-14.3C307.4 6.8 296.3 0 284.2 0H163.8c-12.1 0-23.2 6.8-28.6 17.7zM416 128H32L53.2 467c1.6 25.3 22.6 45 47.9 45H346.9c25.3 0 46.3-19.7 47.9-45L416 128z"/>
                                                    </svg>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%
                                        }
                                    }
                                %>








                            </div>
                            <div class="col-lg-5">

                                <div class="card text-white rounded-3" style="background: orange">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center mb-4">
                                            <h5 class="mb-0">Card details</h5>
                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-6.webp"
                                                 class="img-fluid rounded-3" style="width: 45px;" alt="Avatar">
                                        </div>

                                        <p class="small mb-2">Card type</p>
                                        <a href="#!" type="submit" class="text-white"><i
                                                class="fab fa-cc-mastercard fa-2x me-2"></i></a>
                                        <a href="#!" type="submit" class="text-white"><i
                                                class="fab fa-cc-visa fa-2x me-2"></i></a>
                                        <a href="#!" type="submit" class="text-white"><i
                                                class="fab fa-cc-amex fa-2x me-2"></i></a>
                                        <a href="#!" type="submit" class="text-white"><i
                                                class="fab fa-cc-paypal fa-2x"></i></a>

                                        <form class="mt-4">
                                            <div class="form-outline form-white mb-4">
                                                <input type="text" id="typeName" class="form-control form-control-lg" size="17"
                                                       placeholder="Cardholder's Name" value="<%= user.getFullName() %>"/>
                                                <label class="form-label" for="typeName" readonly="">Cardholder's Name</label>
                                            </div>


                                            <div class="form-outline form-white mb-4">
                                                <input type="text"  class="form-control form-control-lg"
                                                       siez="17"
                                                       placeholder="1234 5678 9012 3457" minlength="19" maxlength="19"/>
                                                <label class="form-label" for="typeText">Card Number</label>
                                            </div>

                                            <div class="row mb-4">
                                                <div class="col-md-6">
                                                    <div class="form-outline form-white">
                                                        <input type="text" id="typeExp"
                                                               class="form-control form-control-lg"
                                                               placeholder="MM/YYYY" size="7" id="exp" minlength="7"
                                                               maxlength="7"/>
                                                        <label class="form-label" for="typeExp">Expiration</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-outline form-white">
                                                        <input type="password" id="typeText"
                                                               class="form-control form-control-lg"
                                                               placeholder="&#9679;&#9679;&#9679;" size="1"
                                                               minlength="3" maxlength="3"/>
                                                        <label class="form-label" for="typeText">Cvv</label>
                                                    </div>
                                                </div>
                                            </div>

                                        </form>

                                        <hr class="my-4">

                                        <div class="d-flex justify-content-between">
                                            <p class="mb-2">Subtotal</p>
                                            <p class="mb-2">NPR ${total}</p>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <p class="mb-2">Tax</p>
                                            <p class="mb-2">13%</p>
                                        </div>

                                        <div class="d-flex justify-content-between">
                                            <p class="mb-2">Shipping</p>
                                            <p class="mb-2">NPR 1500</p>
                                        </div>


                                        <div class="d-flex justify-content-between mb-4">
                                            <p class="mb-2">Total</p>
                                            <p class="mb-2">NPR ${(total + 13/100 * total)+1500}</p>
                                        </div>


                                        <button type="button" class="btn btn-info btn-block btn-lg"
                                                style="background: #1a1d20; color: whitesmoke; width: 100% " >
                                            <div class=" " style="text-align: center">
                                                <span>Checkout <svg xmlns="http://www.w3.org/2000/svg"
                                                                    viewBox="0 0 448 512" width="16" height="16" fill="white"><path
                                                        d="M438.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-160-160c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L338.8 224 32 224c-17.7 0-32 14.3-32 32s14.3 32 32 32l306.7 0L233.4 393.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l160-160z"/></svg></span>
                                            </div>
                                        </button>

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

<%--footer--%>
<jsp:include page="footer.jsp"/>
</body>
</html>
