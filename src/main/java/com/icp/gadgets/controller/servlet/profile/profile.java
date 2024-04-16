package com.icp.gadgets.controller.servlet.profile;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.icp.gadgets.controller.servlet.DatabaseController;
import com.icp.gadgets.model.User;
import com.icp.gadgets.utils.StringUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "profileServlet", value = "/profile-servlet")
public class profile extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }
    DatabaseController dbController = new DatabaseController();

    @WebServlet(name = "ProfileServlet", value = "/profile")
    public class ProfileServlet extends HttpServlet {

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            // Retrieve user object from session or database
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            if (user == null) {
                // If user object is not in session, retrieve it from the database
                String username = (String) session.getAttribute("username"); // Assuming username is stored in session
                try {
                    user = dbController.getUserInfo(username);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                session.setAttribute("user", user); // Store user object in session for future requests
            }

            // Forward the request to profile JSP page with user object as an attribute
            request.setAttribute("user", user);
            request.getRequestDispatcher("/profile.jsp").forward(request, response);
        }
    }
    public void destroy() {
    }
}