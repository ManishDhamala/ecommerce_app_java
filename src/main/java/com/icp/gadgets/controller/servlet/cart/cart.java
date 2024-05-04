package com.icp.gadgets.controller.servlet.cart;import java.io.*;
import java.util.ArrayList;

import com.icp.gadgets.model.Carts;
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
           ArrayList<Carts> cartsList = new ArrayList<Carts>();
           int id = Integer.parseInt(request.getParameter("id"));
           Carts carts = new Carts();
              carts.setProductId(id);
              carts.setQuantity(1);

              HttpSession session = request.getSession();
              ArrayList<Carts> carts_list =(ArrayList<Carts>) session.getAttribute("cart-list");

              //if there is no session that means i have no cart items
              if(carts_list == null){
                  cartsList.add(carts);
                  session.setAttribute("cart-list", cartsList);
                  response.sendRedirect("pages/shop.jsp");
              }else {
                  cartsList = carts_list;
                  boolean exist = false;

                  for(Carts c: cartsList){
                      if(c.getProductId() == id) {
                          exist = true;
                          // If product exists, increment its quantity and redirect to shop page
                          c.setQuantity(c.getQuantity() + 1);
                          response.sendRedirect("pages/shop.jsp");

                          return;

                      }
                  }
                  if(!exist){
                      cartsList.add(carts);
                      response.sendRedirect("pages/shop.jsp");
                  }
              }


        }

    }

    public void destroy() {
    }
}