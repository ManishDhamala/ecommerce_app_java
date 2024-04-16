package com.icp.gadgets.controller.servlet.register;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import com.icp.gadgets.controller.servlet.DatabaseController;
import com.icp.gadgets.utils.StringUtils;
import com.icp.gadgets.model.User;



@WebServlet(name = "registerServlet", value = "/register-servlet")
public class register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    DatabaseController dbController = new DatabaseController();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter printOut = response.getWriter();
        response.setContentType("text/html");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        response.setContentType("text/html");
        PrintWriter printOut = response.getWriter();

        String fullname = request.getParameter(StringUtils.FULL_NAME);
        String username = request.getParameter(StringUtils.USERNAME);
        String email  = request.getParameter(StringUtils.EMAIL);
        String phonenumber  = request.getParameter(StringUtils.PHONE_NUMBER);
        String address  = request.getParameter(StringUtils.ADDRESS);
        LocalDate dob = LocalDate.parse(request.getParameter(StringUtils.DOB));
        String password  = request.getParameter(StringUtils.PASSWORD);
        String gender  = request.getParameter(StringUtils.GENDER);


        try {

            // 1. Name Format Validation
            if (!isValidName(fullname)) {
                // Redirect to the registration page with an error message
                request.setAttribute (StringUtils.ERROR_MESSAGE, "Name invalid") ;
                response.sendRedirect(request.getContextPath()+StringUtils.REGISTER_PAGE+"?"+StringUtils.ERROR_MESSAGE+"=Invalid Full name");
                return;
            }

            // 2. Minimum Username Length Requirement and Special Character Validation
            if (!isValidUsername(username)) {
                // Redirect to the registration page with an error message
                request.setAttribute (StringUtils.ERROR_MESSAGE, "Username invalid") ;
//                request.getRequestDispatcher("/pages/register.jsp").forward(request,response);
                response.sendRedirect(request.getContextPath()+"/pages/register.jsp"+"?"+StringUtils.ERROR_MESSAGE+"=Invalid Username");
                return;
            }

            //3.Check email validation
            if(!isValidEmail(email)){
                request.setAttribute(StringUtils.ERROR_MESSAGE, "Email invalid");
                response.sendRedirect(request.getContextPath()+StringUtils.REGISTER_PAGE+"?"+StringUtils.ERROR_MESSAGE+"=Invalid Email");
                return;
            }

            //4.Check address validation
            if(!isValidAddress(address)){
                request.setAttribute(StringUtils.ERROR_MESSAGE, "Address invalid");
                response.sendRedirect(request.getContextPath()+StringUtils.REGISTER_PAGE+"?"+StringUtils.ERROR_MESSAGE+"=Invalid Address");
                return;
            }

            // 5.Birthday Date Restriction
            if (dob.isAfter(LocalDate.now())) {
                // Redirect to the registration page with an error message
                request.setAttribute (StringUtils.ERROR_MESSAGE, "Date of Birth invalid") ;
                response.sendRedirect(request.getContextPath()+StringUtils.REGISTER_PAGE+"?"+StringUtils.ERROR_MESSAGE+"=Invalid Date of Birth");
                return;
            }

            // 6. Password Complexity Requirement and Matching Passwords
            if (!isValidPassword(password)) {
                // Redirect to the registration page with an error message
                request.setAttribute (StringUtils.ERROR_MESSAGE, "Password invalid") ;
                response.sendRedirect(request.getContextPath()+StringUtils.REGISTER_PAGE+"?"+StringUtils.ERROR_MESSAGE+"=Invalid Password");
                return;
            }
            // 7. Phone Number Format Requirement
            if (!isValidPhoneNumber(phonenumber)) {
                // Redirect to the registration page with an error message
                request.setAttribute (StringUtils.ERROR_MESSAGE, "Phone Number invalid") ;
                response.sendRedirect(request.getContextPath()+StringUtils.REGISTER_PAGE+"?"+StringUtils.ERROR_MESSAGE+"=Invalid Phone Number");
                return;
            }




//         Checking already exists data in database
            if (dbController.isUsernameExists(username)) {
                // Redirect to the registration page with an error message
                request.setAttribute (StringUtils.ERROR_MESSAGE, "Username already in use") ;
                response.sendRedirect(request.getContextPath()+StringUtils.REGISTER_PAGE+"?"+StringUtils.ERROR_MESSAGE+"=Username is already registered! Please Login to continue");
                return;
            }

            if ( dbController.isEmailExists(email)) {
                // Redirect to the registration page with an error message
                request.setAttribute (StringUtils.ERROR_MESSAGE, "Email already in use") ;
                response.sendRedirect(request.getContextPath()+StringUtils.REGISTER_PAGE+"?"+StringUtils.ERROR_MESSAGE+"=Email already exists");
                return;
            }

            if (dbController.isPhoneNumberExists(phonenumber)) {
                // Redirect to the registration page with an error message
                request.setAttribute (StringUtils.ERROR_MESSAGE, "Phone Number already in use") ;
                response.sendRedirect(request.getContextPath()+StringUtils.REGISTER_PAGE+"?"+StringUtils.ERROR_MESSAGE+"=Phone Number already exists");
                return;
            }


            User user = new User(fullname,username,email,phonenumber,address,dob,password,gender);
            int result = dbController.addUser(user);

            if (result == 1) {
                request.setAttribute(StringUtils.SUCCESS_MESSAGE,StringUtils.SUCCESS_REGISTER_MESSAGE);
                response.sendRedirect(request.getContextPath()+StringUtils.LOGIN_PAGE);
            }else if(result == 0) {
                // Redirect to the same register page with form data mistake
                request.setAttribute (StringUtils.ERROR_MESSAGE, StringUtils.REGISTER_ERROR_MESSAGE) ;
                request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
            } else {
                // Redirect to the same register page with server error
                request. setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.SERVER_ERROR_MESSAGE) ;
                request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
            }

        }catch(Exception ex){
            request. setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.SERVER_ERROR_MESSAGE) ;
            request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);

        }
    }


    // Helper methods for validations
    private boolean isValidName(String fullname) {
        // Implement name validation logic
        return !fullname.matches(".*\\d.*") && !fullname.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?].*");
    }

    private boolean isValidUsername(String username) {
        // Implement username validation logic
        return username.length() > 5 && !username.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?].*");
    }

    private boolean isValidPhoneNumber(String phoneNumber) {
        // Implement phone number validation logic
        return phoneNumber.startsWith("+") && !phoneNumber.matches(".*[!@#$%^&*_=\\[\\]{};':\"\\\\|,.<>/?].*")
                && !phoneNumber.matches(".*[A-Z].*") && !phoneNumber.matches(".*[a-z].*");
    }

    private boolean isValidPassword(String password) {
        // Implement password validation logic
        return password.length() > 6 && password.matches(".*\\d.*") && password.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?].*")
                && password.matches(".*[A-Z].*");
    }

    private boolean isValidEmail(String email) {
        // Implement Email validation logic
        return !email.matches(".*[!#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,<>/?].*");
    }

    private boolean isValidAddress(String address) {
        // Implement address validation logic
        return !address.matches(".*[!#$%^&*()+\\-=\\[\\]{};':\"\\\\|,<>/?].*");
    }



}