<%@ page import="com.icp.gadgets.doa.OrderDoa" %>
<%@ page import="com.icp.gadgets.model.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icp.gadgets.doa.UserDoa" %>
<%@ page import="com.icp.gadgets.model.User" %>
<%@ page import="java.util.Objects" %>
<%@ page import="com.icp.gadgets.utils.StringUtils" %><%--
  Created by IntelliJ IDEA.
  User: sachin
  Date: 13/04/2024
  Time: 2:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Order</title>
    <link rel="stylesheet"  href="../styles/global.css">
    <link rel="stylesheet" href="../styles/global.css">
    <link rel="stylesheet" href="../styles/css/carousel.styles.css">
    <link rel="stylesheet" href="../styles/css/header.styles.css">
    <script src="../script/toast.script.js"></script>
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
<body>
<jsp:include page="adminheader.jsp"/>
<%
    HttpSession isSession = request.getSession(false);
    if (isSession == null || isSession.getAttribute("user") == null || !isSession.getAttribute("userRole").equals("ADMIN")) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
    }
    OrderDoa orderDoa = new OrderDoa();
    List<Order> orders = orderDoa.getAllOrders();
    UserDoa userDoa = new UserDoa();

%>
<%
    String successMessage = (String) request.getParameter(StringUtils.SUCCESS_MESSAGE);

    if (successMessage != null && !successMessage.isEmpty()) {
%>
<script>
    const toasts = new Toasts({
        width: 300,
        timing: 'ease',
        duration: '.5s',
        dimOld: false,
        position: 'top-right' // top-left | top-center | top-right | bottom-left | bottom-center | bottom-right
    });
    toasts.push({
        title:"Success",
        content:"<%=successMessage%>",
        style:'success'
    })
</script>
<%--        <div class="alert alert-danger" role="alert">--%>
<%--            <i class="fa-solid fa-circle-xmark"  style="color: #ff0000; font-size: 2em; padding-left: 15px;"></i>--%>
<%--            <span style="padding-left: 5px; color: #ff0000;"><%=errorMessage%></span>--%>
<%--        </div>--%>
<%
    }
%>
<div class="max-w-container-fluid mx-5 mt-5">
    <div class="d-flex justify-content-between align-items-center ">
        <div>
            <h2>Orders</h2>
            <p>Manage your stores orders</p>
        </div>
    </div>

    <table class="table ">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Customer Name</th>
            <th scope="col">Quantity</th>
            <th scope="col">Total Price</th>
            <th scope="col">Payment Status</th>
            <th scope="col">Payment Mode</th>
            <th scope="col">Order Status</th>
            <th scope="col">Order Date</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>

        <%
            for (Order order : orders) {
        %>
        <%
            List<Order> orderItem = orderDoa.getAllOderItems(order.getOrder_id());
            User user = userDoa.getUserById(order.getUser_id());
            %>
        <tr>
            <th scope="row"><%= order.getOrder_id() %></th>
            <td><%=user.getFullName() %></td>
            <td><%=
                orderItem.stream().mapToInt(Order::getQuantity).sum()
            %></td>
            <td>Rs.<%=order.getOrder_total() %></td>
            <td><%=order.getPayment_status() %></td>
            <td><%=Objects.equals(order.getPayment_status(), "PAID") ? "Online" : "COD"  %></td>
            <td><%=order.getOrder_status() %></td>
            <td><%=order.getOrder_date() %></td>
            <td>
                <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editOrder" data-bs-orderStatus="<%=order.getOrder_status()%>" data-bs-paymentStatus="<%=order.getPayment_status()%>" data-bs-orderId="<%=order.getOrder_id()%>" >Edit</button>
                <button type="button" class=" btn btn-outline-danger" onclick="handleDelete(<%=order.getOrder_id()%>, <%=order.getOrder_item_id()%>)">Delete</button>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <div class="modal fade" id="editOrder" tabindex="-1" aria-labelledby="editOrder" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="editCategoryLabel">Edit Order Status</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/order" method="post">
                        <div class="mb-3">
                            <label for="EditorderStatus" class="form-label">Order Status</label>
                            <select class="form-select" id="EditorderStatus" name="orderStatus">
                                <option value="PENDING">PENDING</option>
                                <option value="DELIVERED">DELIVERED</option>
                                <option value="REFUNDED">REFUNDED</option>
                            </select>

                            <label for="EditpaymentStatus" class="form-label">Payment Status</label>
                            <select class="form-select" id="EditpaymentStatus" name="paymentStatus">
                                <option value="UNPAID">UNPAID</option>
                                <option value="PAID">PAID</option>
                                <option value="REFUND">REFUND</option>
                            </select>
                        </div>
                        <input type="hidden" name="orderId" id="orderId">
                        <input type="hidden" name="_method" value="PUT">
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    const editOrderModal = document.getElementById('editOrder');
    editOrderModal.addEventListener('show.bs.modal', function (event) {
        const button = event.relatedTarget;
        const orderStatus = button.getAttribute('data-bs-orderStatus');
        const paymentStatus = button.getAttribute('data-bs-paymentStatus');
        const orderId = button.getAttribute('data-bs-orderId');
        const modalOrderStatus = editOrderModal.querySelector('#EditorderStatus');
        const modalPaymentStatus = editOrderModal.querySelector('#EditpaymentStatus');
        const modalOrderId = editOrderModal.querySelector('#orderId');
        modalOrderStatus.value = orderStatus
        modalPaymentStatus.value = paymentStatus
        modalOrderId.value = orderId
    })

    const handleDelete = (orderId,orderItemId) => {

        const confirmDelete = confirm('Are you sure you want to delete this order?');
        if (confirmDelete) {
           let xhr = new XMLHttpRequest();
              xhr.open('POST', `${pageContext.request.contextPath}/order`, true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.send('orderId=' + orderId + '&orderItemId='+orderItemId+ '&_method=DELETE');
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    window.location.href = xhr.responseURL
                }
            }
        }
    }


</script>
<script src="../script/myscript.js" ></script>
</body>
</html>
