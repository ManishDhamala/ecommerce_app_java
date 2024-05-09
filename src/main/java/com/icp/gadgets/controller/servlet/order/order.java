package com.icp.gadgets.controller.servlet.order;

import java.io.*;
import java.lang.reflect.Type;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.icp.gadgets.doa.Cartdoa;
import com.icp.gadgets.doa.OrderDoa;
import com.icp.gadgets.model.CartItem;
import com.icp.gadgets.utils.StringUtils;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "orderServlet", value = "/order")
public class order extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    OrderDoa orderDoa = new OrderDoa();
    Cartdoa cartdoa = new Cartdoa();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/plain");
        String orderStatus = request.getParameter("orderStatus");
        String paymentStatus = request.getParameter("paymentStatus");
        int totalAmount = Integer.parseInt(request.getParameter("totalAmount"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        // Create Order
        int orderId = orderDoa.createOrder(userId, orderStatus, paymentStatus, totalAmount);
        if(orderId > 0){
            response.getWriter().write(String.valueOf(orderId));
        }else {
            response.setStatus(500);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/plain");
        String method = request.getParameter("_method");
        if(method != null && method.equalsIgnoreCase("PUT")){
            doPut(request, response);
        }else if(method != null && method.equalsIgnoreCase("DELETE")){
            doDelete(request, response);
        }
//        else if (method != null && method.equalsIgnoreCase("CREATE_ORDER")){
//            doGet(request, response);
//        }
        else{
            Gson gson = new Gson();
            Type cartItemType = new TypeToken<List<CartItem>>(){}.getType();
            List<CartItem> cartItems = gson.fromJson(request.getParameter("cartItems"), cartItemType);
            String orderStatus = request.getParameter("orderStatus");
            String paymentStatus = request.getParameter("paymentStatus");
            int totalAmount = Integer.parseInt(request.getParameter("totalAmount"));
            int userId = Integer.parseInt(request.getParameter("userId"));
            // Create Order
            int orderId = orderDoa.createOrder(userId, orderStatus, paymentStatus, totalAmount);

            if(orderId > 0){
                for (CartItem cartItem : cartItems) {
                    int result = orderDoa.creatOrderItem(orderId, cartItem.getProductId(), cartItem.getQuantity());
                    cartdoa.deleteCartItem(cartItem.getCartItemId());
                    if(result <= 0){
                        response.setStatus(500);
                        return; // Stop further processing
                    }
                }
                response.getWriter().write(String.valueOf(orderId) );
                response.sendRedirect(request.getContextPath() + "/pages/success.jsp");
            }else {
                response.setStatus(500);
            }
        }

    }

    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String orderStatus = request.getParameter("orderStatus");
        String paymentStatus = request.getParameter("paymentStatus");
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        int totalAmount = Integer.parseInt(request.getParameter("totalAmount"));

        int result = orderDoa.updateOrder(orderId, orderStatus, paymentStatus, totalAmount);
        if(result > 0){
            response.setStatus(200);
        }else {
            response.setStatus(500);
        }
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        int orderItemId = Integer.parseInt(request.getParameter("orderItemId"));
        int result = orderDoa.deleteOrder(orderId, orderItemId);
        if(result > 0){
            response.setStatus(200);
        }else {
            response.setStatus(500);
        }
    }


    public void destroy() {
    }
}