package com.icp.gadgets.controller.servlet.logout;

import java.io.*;
import java.time.LocalDate;

import com.icp.gadgets.model.User;
import com.icp.gadgets.utils.StringUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "logoutServlet", value = "/logout-servlet")
public class logout extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // Invalidate user session
        }
        response.sendRedirect(request.getContextPath() + "/index.jsp"); // Redirect to log
    }


    public void destroy() {
    }
}