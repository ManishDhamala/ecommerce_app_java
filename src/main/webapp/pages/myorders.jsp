<%@ page import="com.icp.gadgets.model.User" %>
<%@ page import="com.icp.gadgets.doa.Cartdoa" %>
<%@ page import="com.icp.gadgets.model.CartItem" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icp.gadgets.model.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.icp.gadgets.doa.OrderDoa" %>
<%@ page import="com.icp.gadgets.doa.UserDoa" %>
<%@ page import="com.icp.gadgets.model.Product" %>
<%@ page import="com.icp.gadgets.doa.ProductDoa" %><%--
  Created by IntelliJ IDEA.
  User: himalpun
  Date: 10/05/2024
  Time: 9:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Orders</title>
    <link rel="stylesheet" href="../styles/global.css">
    <link rel="stylesheet" href="../styles/css/header.styles.css">
    <script src="../script/myscript.js"></script>
</head>
<body>

<%
    User user = (User) session.getAttribute("user");
    String userId = session.getAttribute("userId") == null ? null : session.getAttribute("userId").toString();
    int cartSize = 0;
//    String orderId = request.getParameter("orderId");
//    List<Order> orderItems = new ArrayList<>();
    List<Order> orders = new ArrayList<>();
    if (user != null) {
        request.setAttribute("user", user);
        Cartdoa cartdoa = new Cartdoa();
        List<CartItem> cartItems = cartdoa.getCartItemByUserID(user.getId());
        cartSize = cartItems.size();
        OrderDoa orderDoa = new OrderDoa();
        orders = orderDoa.getOrderByUserId(user.getId());
//        if(orderId != null && !orderId.isEmpty()){
//            orderItems = orderDoa.getAllOderItems(Integer.parseInt(orderId));
//        }
//        orderItems = orderDoa.getAllOderItems(Integer.parseInt(orderId));
    }
%>
<jsp:include page="header.jsp"/>

<div style="height: 70vh" class=" mx-5">
    <div class="container-fluid pt-5" >
        <h1>My orders !</h1>
        <p>Here you can see all your orders</p>

        <%
            if (orders.isEmpty()){
        %>

        <div class="alert alert-warning" role="alert">
            You have not placed any orders yet.
        </div>

        <%
            } else {
        %>
        <div class="row">
            <div class="col-md-12" >
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Order Date</th>
                        <th>Order Status</th>
                        <th>Order Total</th>
                        <th>Order Details</th>
                    </tr>
                    </thead>
                    <tbody>
                   <%
                       for (Order order:orders){
                   %>
                    <tr>
                        <td><%=order.getOrder_id()%></td>
                        <td><%=order.getOrder_date()%></td>
                        <td><%=order.getOrder_status()%></td>
                        <td>Rs.<%=order.getOrder_total()%></td>
                        <td>
                            <button
                                    type="button" class="btn btn-light btn-lg" data-bs-toggle="modal"
                                    data-bs-order-id="<%=order.getOrder_id()%>"
                                    data-bs-user-id="<%=order.getUser_id()%>"
                                     data-bs-target="#exampleModal" style="background: coral">
                                <i class="fas fa-info me-2"></i> View Details
                            </button>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header border-bottom-0">
                <button  type="button"  class="btn-close" data-bs-dismiss="modal"  aria-label="Close"></button>
            </div>
            <div class="modal-body text-start p-4">
                <h5 class="modal-title text-uppercase mb-5" id="exampleModalLabel">Order ID: <%= request.getParameter("orderId") %></h5>
                <div id="modal-content">

                </div>
<%--                <%--%>
<%--                    if(request.getParameter("orderId") != null && !request.getParameter("orderId").isEmpty()){--%>
<%--                        System.out.println("Order ID"+request.getParameter("orderId"));--%>
<%--                        OrderDoa orderDoa = new OrderDoa();--%>
<%--                        List<Order> orderItems = orderDoa.getAllOderItems(Integer.parseInt(request.getParameter("orderId")));--%>
<%--                    %>--%>
<%--                    <%--%>
<%--                        if(orderItems != null && !orderItems.isEmpty()){--%>
<%--                        for (Order order:orderItems){--%>
<%--                            System.out.println("Order ID"+order.getOrder_id());--%>
<%--                    %>--%>
<%--                    <%--%>
<%--                        UserDoa userDoa = new UserDoa();--%>
<%--                        User userr = userDoa.getUserById(order.getUser_id());--%>
<%--                        List<Order> orderItems1 = orderDoa.getAllOderItems(order.getOrder_id());--%>
<%--                        System.out.println("Order ID"+order.getOrder_id() + "User ID"+order.getUser_id());--%>
<%--                    %>--%>
<%--                                <h5 class="modal-title text-uppercase mb-5" id="exampleModalLabel"><%=userr.getFullName()%></h5>--%>
<%--                                <h4 class="mb-5">Thanks for your order</h4>--%>
<%--                                <p class="mb-0">Payment summary</p>--%>
<%--                                <hr class="mt-2 mb-4"--%>
<%--                                    style="height: 0; background-color: transparent; opacity: .75; border-top: 2px dashed #9e9e9e;">--%>

<%--                            <%--%>
<%--                                for (Order order1:orderItems1){--%>
<%--                                    ProductDoa productDoa = new ProductDoa();--%>
<%--                                    Product product = productDoa.getProductById(order1.getProduct_id());--%>
<%--                            %>--%>
<%--                                <div class="d-flex justify-content-between">--%>
<%--                                    <p class="small mb-0"><%=product.getProductName()%> (Qty: <%=order1.getQuantity()%>)</p>--%>
<%--                                    <p class="small mb-0">Rs.<%=product.getProductPrice()%></p>--%>
<%--                                </div>--%>
<%--                            <%--%>
<%--                                }--%>
<%--                            %>--%>

<%--                            <div class="d-flex justify-content-between">--%>
<%--                                <p class="small mb-0">Shipping</p>--%>
<%--                                <p class="small mb-0">Rs.100</p>--%>
<%--                        </div>--%>

<%--                                <div class="d-flex justify-content-between">--%>
<%--                                    <p class="fw-bold">Total</p>--%>
<%--                                    <p class="fw-bold"><%=order.getOrder_total()%></p>--%>
<%--                                </div>--%>

<%--                    <%--%>
<%--                        }--%>
<%--                    }--%>
<%--                    }--%>

<%--                    %>--%>
            </div>
            <div class="modal-footer d-flex justify-content-center border-top-0 py-4">
                <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg mb-1" style="background-color: #35558a;">
                    Track your order
                </button>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>

<script>
    var myModal = document.getElementById('exampleModal')
    myModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var orderId = button.getAttribute('data-bs-order-id')
        var modalTitle = myModal.querySelector('.modal-title')
        var userId = button.getAttribute('data-bs-user-id')
        modalTitle.textContent = 'Order ID: ' + orderId

        let xhr = new XMLHttpRequest();
        xhr.open("GET", "${pageContext.request.contextPath}/orderItem?orderId="+orderId+'&userId='+userId, true);
        xhr.onreadystatechange = function() {
            console.log(xhr);
            if (xhr.readyState == 4 && xhr.status == 200) {
                document.getElementById('modal-content').innerHTML = xhr.responseText;
            }
        }
        xhr.send();
    })

</script>

</body>
</html>
