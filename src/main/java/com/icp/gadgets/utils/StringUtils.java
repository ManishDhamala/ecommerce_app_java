package com.icp.gadgets.utils;

public class StringUtils {

    //Start SQL Queries
    public static final String INSERT_USER = "INSERT INTO users "
            + "(name, email, phonenumber, username, dob, password, gender, address, role)"
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'USER') ";

    public static final String GET_USER_BY_USERNAME = "SELECT * FROM users WHERE username = ?";
    public static final String GET_LOGIN_USER_INFO = "SELECT * FROM users WHERE username = ? AND password = ?";

    public  static  final String INSET_CATEGORY = "INSERT INTO categories (name) VALUES (?)";
    public  static final String GET_CATEGORIES = "SELECT * FROM categories";
    public  static final String DELETE_CATEGORY = "DELETE FROM categories WHERE category_id = ?";
    public static final String GET_CATEGORY_BY_ID = "SELECT name FROM categories WHERE category_id = ?";
    public static final String UPDATE_CATEGORY = "UPDATE categories SET name = ? WHERE category_id = ?";
    public static final String CHECK_PRODUCTS_IN_CATEGORY =
            "SELECT COUNT(*) AS product_count " +
                    "FROM products " +
                    "WHERE category_id = ?";

    public static final String INSERT_PRODUCT = "INSERT INTO products (name, price, `desc`, category_id) VALUES (?, ?, ?, ?)";

    public static final String UPDATE_PRODUCT = "UPDATE products SET name = ?, price = ?, `desc` = ?, category_id = ? WHERE product_id = ?";
    public static final String IMAGE_INSERT = "INSERT INTO images (imgUrl, product_id) VALUES (?, ?)";

    public static final String GET_IMAGE_BY_PRODUCT_ID = "SELECT imgUrl FROM images WHERE product_id = ?";
    public static final String REMOVE_IMAGE_BY_PRODUCT_ID = "DELETE FROM images WHERE product_id = ?";

    public static final String HAS_IMAGE = "SELECT COUNT(*) AS image_count FROM images WHERE product_id = ?";

    public static final String GET_PRODUCTS = "SELECT * FROM products";

    public static final String GET_PRODUCT_BY_ID = "SELECT * FROM products WHERE product_id = ?";

    public static final String DELETE_PRODUCT = "DELETE FROM products WHERE product_id = ?";


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

    public static final String CHECK_USERNAME_EXISTS = "SELECT * FROM users WHERE username = ?";
    public static final String CHECK_PASSWORD_MATCH = "SELECT * FROM users WHERE password = ?";

}
