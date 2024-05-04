package com.icp.gadgets.controller.servlet.order;

import java.io.*;

import com.icp.gadgets.doa.OrderDoa;
import com.icp.gadgets.utils.StringUtils;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "orderServlet", value = "/order-servlet")
public class order extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    OrderDoa orderDoa = new OrderDoa();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        String orderStatus = request.getParameter("orderStatus");
        String paymentStatus = request.getParameter("paymentStatus");
        int totalAmount = Integer.parseInt(request.getParameter("totalAmount"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        // Create Order
        int orderId = orderDoa.createOrder(userId, orderStatus, paymentStatus, totalAmount);
        if(orderId > 0){
            int result = orderDoa.creatOrderItem(orderId, productId, quantity);
            if(result > 0){
                response.sendRedirect(request.getContextPath() + "/pages/CartPage.jsp?" + StringUtils.SUCCESS_MESSAGE + "=Order Received Successfully");
            }else{
                response.sendRedirect(request.getContextPath() + "/pages/CartPage.jsp?" + StringUtils.SUCCESS_MESSAGE + "=Failed to Create Order Item");
            }
        }else {
            response.sendRedirect(request.getContextPath() + "/pages/CartPage.jsp?" + StringUtils.SUCCESS_MESSAGE + "=Failed to Create Order");
        }
    }

    public void destroy() {
    }
}