package com.icp.gadgets.utils;

public class StringUtils {

    //Start SQL Queries
    public static final String INSERT_USER = "INSERT INTO users "
            + "(name, email, phonenumber, username, dob, password, gender, address, role)"
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'USER') ";

    public static final String GET_USER_BY_USERNAME = "SELECT * FROM users WHERE username = ?";
    public static final String GET_LOGIN_USER_INFO = "SELECT * FROM users WHERE username = ? AND password = ?";
    // End SQL Queries

    public static final String FULL_NAME = "fullname";
    public static final String USERNAME= "username";
    public static final String EMAIL = "email";
    public static final String PHONE_NUMBER = "phonenumber";
    public static final String ADDRESS = "address";
    public static final String DOB = "dob";
    public static final String PASSWORD = "password";
    public static final String  GENDER = "gender";



    // Start messages
    public static final String SUCCESS_REGISTER_MESSAGE = "Successfully Registered!";
    public static final String REGISTER_ERROR_MESSAGE = "Please correct the form data.";
    public static final String SERVER_ERROR_MESSAGE = "An unexpected server error occurred.";
    public static final String SUCCESS_MESSAGE = "successMessage";
    public static final String ERROR_MESSAGE = "errorMessage";
    public static final String UPDATED_SUCCESSFULLY ="Your profile has been successfully updated!";
    public static final String UPDATED_MESSAGE ="updateMsg";

    // End messages

    // Start JSP Route
    public static final String LOGIN_PAGE = "/pages/login.jsp";
    public static final String REGISTER_PAGE = "/pages/register.jsp";
    public static final String PROFILE_PAGE = "/pages/profile.jsp";

    // End JSP Route

    // Start Servlet Route
    public static final String REGISTER_SERVLET = "/register-servlet";
    // End Servlet Route


}
