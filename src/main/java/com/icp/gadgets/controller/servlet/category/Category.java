package com.icp.gadgets.controller.servlet.category;

import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "CategoryServlet", value = "/category")
public class Category extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void  doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        String category = request.getParameter("categoryName");

        try{
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<h1>" + category + "</h1>");
            out.println("</body></html>");
        }catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void destroy() {
    }
}