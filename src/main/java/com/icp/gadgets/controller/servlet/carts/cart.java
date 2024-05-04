package com.icp.gadgets.controller.servlet.carts;

import java.io.*;

import com.icp.gadgets.doa.Cartdoa;
import com.icp.gadgets.utils.StringUtils;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "cartServlet", value = "/cart")
public class cart extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }
    Cartdoa cartdoa = new Cartdoa();

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

       int userId = Integer.parseInt(request.getParameter("userId"));
       int productId = Integer.parseInt(request.getParameter("productId"));
       int quantity = Integer.parseInt(request.getParameter("quantity"));

       // Add to cart
         int cartId = cartdoa.addToCart(userId);
         if(cartId > 0){
             // Add to cart item
             int result = cartdoa.addToCartItem(cartId, productId, quantity);
             if(result > 0){
                 response.sendRedirect(request.getContextPath()+ "/pages/shop.jsp?"+ StringUtils.SUCCESS_MESSAGE+"=Item added to cart successfully");
             }else {
                 response.sendRedirect(request.getContextPath()+"/pages/shop.jsp?"+ StringUtils.ERROR_MESSAGE+"=Failed to add to cart");
             }
            }else {
                response.sendRedirect(request.getContextPath()+ "/pages/shop.jsp?"+StringUtils.ERROR_MESSAGE+"=Something went wrong!" );
         }
    }
    public void destroy() {
    }
}