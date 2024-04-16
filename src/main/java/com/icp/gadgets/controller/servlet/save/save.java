package com.icp.gadgets.controller.servlet.save;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;

import com.icp.gadgets.controller.servlet.DatabaseController;
import com.icp.gadgets.model.User;
import com.icp.gadgets.utils.StringUtils;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "saveServlet", value = "/save-servlet")
public class save extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }
    DatabaseController dbController = new DatabaseController();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        // Retrieve form parameters
        String firstName = request.getParameter(StringUtils.FULL_NAME);
        String email = request.getParameter(StringUtils.EMAIL);
        String phoneNumber = request.getParameter(StringUtils.PHONE_NUMBER);
        String dobParameter = request.getParameter(StringUtils.DOB);

        LocalDate dob = null;
        if (dobParameter != null && !dobParameter.isEmpty()) {
            dob = LocalDate.parse(dobParameter);
        } else {
            dob = LocalDate.now();
        }
        String address = request.getParameter(StringUtils.ADDRESS);


        String username = getUsernameFromSession(request);
        boolean updated;
        try {
            updated = updateUserInfo(firstName, email, phoneNumber, dob, address, username);
            if (updated) {
                User updatedUser = dbController.getUserInfo(username);
                HttpSession session = request.getSession();
                session.setAttribute("user", updatedUser);
                request.setAttribute(StringUtils.UPDATED_MESSAGE, StringUtils.UPDATED_SUCCESSFULLY);
                RequestDispatcher dispatcher = request.getRequestDispatcher(StringUtils.PROFILE_PAGE);
                dispatcher.forward(request, response);
               System.out.println("User information updated successfully"+updatedUser.getAddress());
                return;
            } else {
                out.println("<h2>Error updating user information</h2>");
            }
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        doGet(request, response);
    }

    public void destroy() {
    }
    private String getUsernameFromSession(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        return user.getUsername();
    }
    private boolean updateUserInfo(String fullname, String email, String phonenumber, LocalDate dob, String address ,String username
                                   ) throws ClassNotFoundException {
        DatabaseController dbController = new DatabaseController();
        System.out.println(fullname+email+phonenumber+dob+address+username);
        try (Connection con = dbController.getConnection()) {

            // Prepare SQL statement
            String sql = "UPDATE users SET name=?, email=?, phonenumber=?, dob=?, address=? WHERE username=?";
            PreparedStatement statement = con.prepareStatement(sql);

            // Set parameters
            statement.setString(1, fullname);
            statement.setString(2, email);
            statement.setString(3, phonenumber);
            statement.setObject(4, dob != null ? java.sql.Date.valueOf(dob) : null);
            statement.setString(5, address);
            statement.setString(6, username);
            System.out.println("User information updated successfully"+address);

            // Execute update
            int rowsUpdated = statement.executeUpdate();

            // Close resources
            statement.close();
            con.close();
            // Check if update was successful
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}