package com.icp.gadgets.controller.servlet.cart;

import java.io.*;
import java.util.ArrayList;

import com.icp.gadgets.model.Carts;
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
                ArrayList<Carts> carts_list = (ArrayList<Carts>) request.getSession().getAttribute("cart-list");
                if (carts_list != null) {
                    for (Carts c : carts_list) {
                        if (c.getProductId() == Integer.parseInt(id)) {
                            carts_list.remove(carts_list.indexOf(c));
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