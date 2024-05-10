<%@ page import="com.icp.gadgets.model.Carts" %>
<%@ page import="com.icp.gadgets.doa.ProductDoa" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.icp.gadgets.model.CartItem" %>
<%@ page import="com.icp.gadgets.doa.Cartdoa" %>
<%@ page import="com.icp.gadgets.model.User" %><%--
  Created by IntelliJ IDEA.
  User: SUSHIL
  Date: 4/3/2024
  Time: 5:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/header.styles.css">

</head>

<body>
<%
   int cartSize = 0;
//    HttpSession session = request.getSession(false);
    if (session != null && session.getAttribute("user") != null || session.getAttribute("userId") != null){
        Cartdoa cartdoa = new Cartdoa();
        User user = (User) session.getAttribute("user");
        int userId = (int) session.getAttribute("userId");
        List<CartItem> cartItems = cartdoa.getCartItemByUserID(userId);
        cartSize = cartItems.size();

    } else {
        cartSize = 0;
    }
%>




<!-- header section start -->
<nav class="navbar navbar-expand-lg bg-white sticky-top navbar-light p-3 shadow-sm max-height-78">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp"> <strong
                class="logoname">Gadget<span>.</span></strong></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>


        <div class=" collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav ms-auto ">
                <li class="nav-item">
                    <a class="nav-link mx-2  fs-5" aria-current="page" href="${pageContext.request.contextPath}/index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link mx-2  fs-5" href="${pageContext.request.contextPath}/pages/about.jsp">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link mx-2  fs-5" href="${pageContext.request.contextPath}/pages/shop.jsp">Shop</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link mx-2   fs-5" href="${pageContext.request.contextPath}/pages/profile.jsp">Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link mx-2   fs-5" href="${pageContext.request.contextPath}/pages/myorders.jsp">My orders</a>
                </li>

            </ul>
            <ul class="navbar-nav ms-auto ">
                <li class="nav-item">
                    <a class="nav-link mx-2 text-uppercase" href="${pageContext.request.contextPath}/pages/CartPage.jsp" style="position: relative">
                        <span class="badge badge-danger" id="cart_counter" style="position: absolute; background-color: red; color: white; font-size: 12px; font-weight: 400; padding: 2px 6px; border-radius: 5px; margin-left: 10px; margin-top: -5px; top: 12px;left: 11px;"><%=cartSize%></span>

                        <img src="${pageContext.request.contextPath}/assets/Icons/shopping-bag.png" alt="carts" style="width: 20px; height: 20px;">
                    </a>
                </li>


<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link mx-2 text-uppercase" href="${pageContext.request.contextPath}/pages/Dashboard.jsp"><img src="${pageContext.request.contextPath}/assets/Icons/user.png" alt="user"--%>
<%--                                                                          style="width: 20px;height: 20px;">--%>
<%--                    </a>--%>
<%--                </li>--%>
                <li class="nav-item">
                    <%
                        if (session != null && session.getAttribute("user") != null) { %>
                    <form  action="<%=request.getContextPath()%>/logout-servlet" method="post">
                        <input class="nav-link mx-2 text-black font-weight-medium text-uppercase register-btn" type="submit" value="Logout">
                    </form>
                    <% } else { %>
                    <a class="nav-link mx-2 text-uppercase  register-btn" href="${pageContext.request.contextPath}/pages/login.jsp"><span>Login</span></a>
                    <% } %>
                </li>
            </ul>
        </div>
    </div>


</nav>
<!-- header section end -->

</body>
</html>
