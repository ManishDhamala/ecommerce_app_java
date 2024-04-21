package com.icp.gadgets.controller.servlet.cart;import java.io.*;
import java.util.ArrayList;

import com.icp.gadgets.model.Cart;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "cartServlet", value = "/cart-servlet")
public class cart extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

       try(PrintWriter out = response.getWriter()) {
           //creating array list
           ArrayList<Cart> cartList = new ArrayList<Cart>();
           int id = Integer.parseInt(request.getParameter("id"));
           Cart cart = new Cart();
              cart.setProductId(id);
              cart.setQuantity(1);

              HttpSession session = request.getSession();
              ArrayList<Cart> cart_list =(ArrayList<Cart>) session.getAttribute("cart-list");

              //if there is no session that means i have no cart items
              if(cart_list == null){
                  cartList.add(cart);
                  session.setAttribute("cart-list", cartList);
                  response.sendRedirect("pages/shop.jsp");
              }else {
                  cartList = cart_list;
                  boolean exist = false;

                  for(Cart c:cartList){
                      if(c.getProductId() == id) {
                          exist = true;
                          // If product exists, increment its quantity and redirect to shop page
                          c.setQuantity(c.getQuantity() + 1);
                          response.sendRedirect("pages/shop.jsp");

                          return;

                      }
                  }
                  if(!exist){
                      cartList.add(cart);
                      response.sendRedirect("pages/shop.jsp");
                  }
              }


        }

    }

    public void destroy() {
    }
}