package com.icp.gadgets.controller.servlet.order;

import java.io.*;
import java.util.List;

import com.icp.gadgets.doa.OrderDoa;
import com.icp.gadgets.doa.ProductDoa;
import com.icp.gadgets.doa.UserDoa;
import com.icp.gadgets.model.Order;
import com.icp.gadgets.model.Product;
import com.icp.gadgets.model.User;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "orderItemServlet", value = "/orderItem")
public class orderItem extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        String orderId = request.getParameter("orderId");
        String userId = request.getParameter("userId");

        OrderDoa orderDoa = new OrderDoa();
        List<Order> orders = orderDoa.getAllOderItems(Integer.parseInt(orderId));
        if (!orders.isEmpty()) {
            UserDoa userDoa = new UserDoa();
            ProductDoa productDoa = new ProductDoa();
            User user = userDoa.getUserById(Integer.parseInt(userId));
            response.getWriter().println(" <h5 class=\"modal-title text-uppercase mb-5\" id=\"exampleModalLabel\">" + user.getFullName() + "</h5>");
            response.getWriter().println("<h4 class=\"mb-5\">Thanks for your order</h4>");
            response.getWriter().println("  <p class=\"mb-0\">Payment summary</p>");
            response.getWriter().println("  <hr class=\"mt-2 mb-4\"\n" +
                    "                                    style=\"height: 0; background-color: transparent; opacity: .75; border-top: 2px dashed #9e9e9e;\">");
            for (Order order : orders) {
                Product product = productDoa.getProductById(order.getProduct_id());
                response.getWriter().println("  <div class=\"d-flex justify-content-between\">");
                response.getWriter().println("  <p class=\"small mb-0\"> " + product.getProductName()+  " Qty: ("  + order.getQuantity()+ ") </p>");
                response.getWriter().println("  <p class=\"small mb-0\"> Rs." + product.getProductPrice() + "</p>");
                response.getWriter().println("  </div>");
            }
            response.getWriter().println("  <div class=\"d-flex justify-content-between\">");
            response.getWriter().println("  <p class=\"small mb-0\">Shipping</p>");
            response.getWriter().println("  <p class=\"small mb-0\">100</p>");
            response.getWriter().println("  </div>");

            response.getWriter().println("  <div class=\"d-flex justify-content-between\">");
            response.getWriter().println("  <p class=\"small mb-0\">Total</p>");
            response.getWriter().println("  <p class=\"small mb-0\">Rs." +
                    (orders.stream().mapToInt(order -> productDoa.getProductById(order.getProduct_id()).getProductPrice() * order.getQuantity()).sum() + 100)
                    + "</p>");
            response.getWriter().println("  </div>");

        }
    }

    public void destroy() {
    }
}