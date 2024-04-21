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

            //Checking full name validation and displaying it on register page
            if (!isValidName(fullname)) {
                // Redirect to the registration page with an error message
                request.setAttribute(StringUtils.ERROR_MESSAGE, errorMessage);
                response.sendRedirect(request.getContextPath() + StringUtils.REGISTER_PAGE + "?" + StringUtils.ERROR_MESSAGE +"="+errorMessage);
                return;
            }

            // 2. Minimum Username Length Requirement and Special Character Validation
            if (!isValidUsername(username)) {
                // Redirect to the registration page with an error message
                request.setAttribute (StringUtils.ERROR_MESSAGE, errorMessage) ;
//                request.getRequestDispatcher("/pages/register.jsp").forward(request,response);
                response.sendRedirect(request.getContextPath()+StringUtils.REGISTER_PAGE+"?"+StringUtils.ERROR_MESSAGE+"="+errorMessage);
                return;
            }

            //3.Check email validation
            if(!isValidEmail(email)){
                request.setAttribute(StringUtils.ERROR_MESSAGE, errorMessage);
                response.sendRedirect(request.getContextPath()+StringUtils.REGISTER_PAGE+"?"+StringUtils.ERROR_MESSAGE+"="+errorMessage);
                return;
            }

            //4.Check address validation
            if(!isValidAddress(address)){
                request.setAttribute(StringUtils.ERROR_MESSAGE, errorMessage);
                response.sendRedirect(request.getContextPath()+StringUtils.REGISTER_PAGE+"?"+StringUtils.ERROR_MESSAGE+"="+errorMessage);
                return;
            }

            // 5.Birthday Date Restriction
            if (dob.isAfter(LocalDate.now())) {
                // Redirect to the registration page with an error message
                request.setAttribute (StringUtils.ERROR_MESSAGE, "Date of Birth invalid") ;
                response.sendRedirect(request.getContextPath()+StringUtils.REGISTER_PAGE+"?"+StringUtils.ERROR_MESSAGE+"=Future Date of Birth can't be selected");
                return;
            }

            // 6. Password Complexity Requirement and Matching Passwords
            if (!isValidPassword(password)) {
                // Redirect to the registration page with an error message
                request.setAttribute (StringUtils.ERROR_MESSAGE, errorMessage) ;
                response.sendRedirect(request.getContextPath()+StringUtils.REGISTER_PAGE+"?"+StringUtils.ERROR_MESSAGE+"="+errorMessage);
                return;
            }
            // 7. Phone Number Format Requirement
            if (!isValidPhoneNumber(phonenumber)) {
                // Redirect to the registration page with an error message
                request.setAttribute (StringUtils.ERROR_MESSAGE, errorMessage) ;
                response.sendRedirect(request.getContextPath()+StringUtils.REGISTER_PAGE+"?"+StringUtils.ERROR_MESSAGE+"="+errorMessage);
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
            request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.SERVER_ERROR_MESSAGE) ;
            request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);

        }
    }

    String errorMessage = "";
    private boolean isValidName(String fullname) {
        // Implement name validation logic
        if (fullname.matches(".*\\d.*")) {
            // Full name contains digits
            errorMessage = "Full name can't have digits";
            return false;
        } else if (fullname.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?].*")) {
            // Full name contains special characters
            errorMessage = "Full name can't contain special characters";
            return false;
        } else {
            return true;
        }
    }

    private boolean isValidUsername(String username) {
        // Implement username validation logic
//        return username.length() > 5 && !username.matches(".*[!@#$%^&*()+\\-=\\[\\]{};':\"\\\\|,<>/?].*");
        if(username.length()<5){
            errorMessage = "Username should contain more than 5 characters";
            return false;
        } else if (username.matches(".*[!@#$%^&*()+\\-=\\[\\]{};':\"\\\\|,<>/?].*")) {
            errorMessage = "User name can't contain special characters";
            return false;
        }else {
            return true;
        }
    }

    private boolean isValidPhoneNumber(String phoneNumber) {
        // Implement phone number validation logic
//        return phoneNumber.startsWith("+") && !phoneNumber.matches(".*[!@#$%^&*_=\\[\\]{};':\"\\\\|,.<>/?].*")
//                && !phoneNumber.matches(".*[A-Z].*") && !phoneNumber.matches(".*[a-z].*");
        if(phoneNumber.matches(".*[!@#$%^&*_=\\[\\]{};':\"\\\\|,.<>/?].*")){
            errorMessage = "Phone number can't contain special characters";
            return false;
        } else if (phoneNumber.matches(".*[A-Z].*") || phoneNumber.matches(".*[a-z].*")){
            errorMessage = "Phone number can't have words";
            return false;
        }else {
            return true;
        }
    }

//    private boolean isValidPassword(String password) {
//        // Implement password validation logic
//        return password.length() > 6 && password.matches(".*\\d.*") && password.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?].*")
//                && password.matches(".*[A-Z].*");
//    }

    private boolean isValidPassword(String password) {
        // Implement password validation logic
        if (password.length() <= 6) {
            // Password is too short
            errorMessage = "Password must be at least 7 characters long.";
            return false;
        } else if (!password.matches(".*\\d.*")) {
            // Password does not contain a digit
            errorMessage = "Password must contain at least one digit.";
            return false;
        } else if (!password.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?].*")) {
            // Password does not contain a special character
            errorMessage = "Password must contain at least one special character.";
            return false;
        } else if (!password.matches(".*[A-Z].*")) {
            // Password does not contain an uppercase letter
            errorMessage = "Password must contain at least one uppercase letter.";
            return false;
        } else {
            return true;
        }
    }

    private boolean isValidEmail(String email) {
        // Implement Email validation logic
//        return !email.matches(".*[!#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,<>/?].*");
        if(email.matches(".*[!#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,<>/?].*")){
            errorMessage = "Email address can't contain special characters";
            return false;
        }else {
            return true;
        }
    }

    private boolean isValidAddress(String address) {
        // Implement address validation logic
//        return !address.matches(".*[!#$%^&*()+=\\[\\]{};':\"\\\\|,<>/?].*");
        if (address.matches(".*[!#$%^&*()+=\\[\\]{};':\"\\\\|,<>/?].*")){
            errorMessage = "Address can't contain special characters";
            return false;
        }else {
            return true;
        }
    }



}