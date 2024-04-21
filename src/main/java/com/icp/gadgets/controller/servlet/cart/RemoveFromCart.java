package com.icp.gadgets.controller.servlet.cart;

import java.io.*;
import java.util.ArrayList;

import com.icp.gadgets.model.Cart;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "RemoveFromCartServlet", value = "/RemoveFromCart-servlet")
public class RemoveFromCart extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        try (PrintWriter out = response.getWriter()) {

            String id = request.getParameter("id");
            if (id != null) {
                ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
                if (cart_list != null) {
                    for (Cart c : cart_list) {
                        if (c.getProductId() == Integer.parseInt(id)) {
                            cart_list.remove(cart_list.indexOf(c));
                            System.out.println("Removed");
                            break;
                        }
                    }
                    response.sendRedirect("pages/CartPage.jsp?removed=true");

                }
            } else {
                response.sendRedirect("pages/CartPage.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public void destroy() {
    }
}