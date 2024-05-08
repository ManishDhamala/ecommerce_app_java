package com.icp.gadgets.controller.servlet.carts;

import java.io.*;
import java.util.List;

import com.icp.gadgets.doa.Cartdoa;
import com.icp.gadgets.model.CartItem;
import com.icp.gadgets.utils.StringUtils;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "cartServlet", value = "/cart")
public class cart extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }
    Cartdoa cartdoa = new Cartdoa();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/plain");
        int userId = Integer.parseInt(request.getParameter("userId"));
        List<CartItem> cartItems = cartdoa.getCartItemByUserID(userId);
        int cartSize = cartItems.size();
        response.getWriter().write(String.valueOf(cartSize));
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
       response.setContentType("text/html");

       String method = request.getParameter("_method");
         if(method != null && method.equalsIgnoreCase("PUT")){
              doPut(request, response);
         }else if(method != null && method.equalsIgnoreCase("DELETE")){
             doDelete(request, response);
         }
         else{
             int userId = Integer.parseInt(request.getParameter("userId"));
             int productId = Integer.parseInt(request.getParameter("productId"));
             int quantity = Integer.parseInt(request.getParameter("quantity"));

             // Add to cart
             int cartId = cartdoa.addToCart(userId);
             if(cartId > 0){
                 // Add to cart item
                 int result = cartdoa.addToCartItem(cartId, productId, quantity);
                 if(result > 0){
                     response.sendRedirect(request.getContextPath()+ "/pages/shop.jsp?" + StringUtils.SUCCESS_MESSAGE + "=Product added to cart successfully");
                 }else {
                     response.sendRedirect(request.getContextPath()+"/pages/shop.jsp?" + StringUtils.ERROR_MESSAGE + "=Failed to add product to cart");
                 }
             }else {
                 response.sendRedirect(request.getContextPath()+ "/pages/shop.jsp?"+StringUtils.ERROR_MESSAGE+"=Something went wrong!" );
             }
         }
    }

    public  void  doPut(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        int result = cartdoa.updateCartItemQuantity(quantity, cartItemId);
        if(result > 0){
            response.sendRedirect(request.getContextPath()+"/pages/cart.jsp?"+StringUtils.SUCCESS_MESSAGE+"=Cart item updated successfully");
        }else {
            response.sendRedirect(request.getContextPath()+"/pages/cart.jsp?"+StringUtils.ERROR_MESSAGE+"=Failed to update cart item");
        }
    }

    public  void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));

        int result = cartdoa.deleteCartItem(cartItemId);
        if(result > 0){
            response.sendRedirect(request.getContextPath()+"/pages/CartPage.jsp?"+StringUtils.SUCCESS_MESSAGE+"=Cart item deleted successfully");
        }else {
            response.sendRedirect(request.getContextPath()+"/pages/CartPage.jsp?"+StringUtils.ERROR_MESSAGE+"=Failed to delete cart item");
        }
    }
    public void destroy() {
    }
}