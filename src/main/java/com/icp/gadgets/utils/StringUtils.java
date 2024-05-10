package com.icp.gadgets.utils;

public class StringUtils {

    //Start SQL Queries
    public static final String INSERT_USER = "INSERT INTO users "
            + "(name, email, phonenumber, username, dob, password, gender, address, role)"
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'USER') ";

    public static final String GET_USER_BY_USERNAME = "SELECT * FROM users WHERE username = ?";
    public static final String GET_USER_BY_ID = "SELECT * FROM users WHERE user_id = ?";
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

public static final  String GET_RECOMENDED_PRODUCT = "SELECT * FROM products WHERE product_id != ? AND product_id NOT IN (SELECT product_id FROM products WHERE product_id = ?) LIMIT 4;";
    public static final String INSERT_PRODUCT = "INSERT INTO products (name, price, `desc`, category_id) VALUES (?, ?, ?, ?)";

    public static final String UPDATE_PRODUCT = "UPDATE products SET name = ?, price = ?, `desc` = ?, category_id = ? WHERE product_id = ?";
    public static final String IMAGE_INSERT = "INSERT INTO images (imgUrl, product_id) VALUES (?, ?)";

    public static final String GET_IMAGE_BY_PRODUCT_ID = "SELECT imgUrl FROM images WHERE product_id = ?";
    public static final String REMOVE_IMAGE_BY_PRODUCT_ID = "DELETE FROM images WHERE product_id = ?";

    public static final String HAS_IMAGE = "SELECT COUNT(*) AS image_count FROM images WHERE product_id = ?";

    public static final String GET_PRODUCTS = "SELECT * FROM products";

    public static final String GET_PRODUCT_BY_ID = "SELECT * FROM products WHERE product_id = ?";

    public static final String DELETE_PRODUCT = "DELETE FROM products WHERE product_id = ?";

    public static final String DELETE_ASSOCIATED_IMAGE = "DELETE FROM images WHERE product_id = ?";

    public static final String GET_ALL_USERS = "SELECT * FROM users";

    public static final String GET_USERS_COUNT = "SELECT COUNT(*) AS user_count FROM users";

    public static final String GET_PRODUCTS_COUNT = "SELECT COUNT(*) AS product_count FROM products";

    public static final String GET_ORDERS_COUNT = "SELECT COUNT(*) AS order_count FROM orders";

    public static final String GET_WEEKLY_SALES = "SELECT \n" +
            "    calendar.day_of_week,\n" +
            "    COALESCE(SUM(oi.quantity * p.price), 0) AS daily_sales,\n" +
            "    COALESCE(SUM(oi.quantity * p.price) / weekly_total_sales * 100, 0) AS sales_percentage\n" +
            "FROM \n" +
            "    (\n" +
            "        SELECT 1 AS day_of_week UNION ALL\n" +
            "        SELECT 2 UNION ALL\n" +
            "        SELECT 3 UNION ALL\n" +
            "        SELECT 4 UNION ALL\n" +
            "        SELECT 5 UNION ALL\n" +
            "        SELECT 6 UNION ALL\n" +
            "        SELECT 7\n" +
            "    ) calendar\n" +
            "LEFT JOIN \n" +
            "    orders o ON DAYOFWEEK(o.created_at) = calendar.day_of_week\n" +
            "LEFT JOIN \n" +
            "    orderItems oi ON o.order_id = oi.order_id\n" +
            "LEFT JOIN \n" +
            "    products p ON oi.product_id = p.product_id\n" +
            "LEFT JOIN (\n" +
            "    SELECT \n" +
            "        YEARWEEK(o.created_at) AS week,\n" +
            "        SUM(oi.quantity * p.price) AS weekly_total_sales\n" +
            "    FROM \n" +
            "        orders o\n" +
            "    JOIN \n" +
            "        orderItems oi ON o.order_id = oi.order_id\n" +
            "    JOIN \n" +
            "        products p ON oi.product_id = p.product_id\n" +
            "    WHERE \n" +
            "        o.orderStatus = 'DELIVERED' \n" +
            "        AND o.paymentStatus = 'PAID' \n" +
            "        AND YEARWEEK(o.created_at) = YEARWEEK(CURDATE())\n" +
            "    GROUP BY \n" +
            "        YEARWEEK(o.created_at)\n" +
            ") AS weekly_sales ON YEARWEEK(o.created_at) = weekly_sales.week\n" +
            "WHERE \n" +
            "    (o.orderStatus = 'DELIVERED' OR o.order_id IS NULL) \n" +
            "    AND (o.paymentStatus = 'PAID' OR o.order_id IS NULL) \n" +
            "    AND (YEARWEEK(o.created_at) = YEARWEEK(CURDATE()) OR o.order_id IS NULL)\n" +
            "GROUP BY \n" +
            "    calendar.day_of_week\n" +
            "ORDER BY \n" +
            "    calendar.day_of_week;\n";

    public static final String GET_PRODUCT_ITEM = "SELECT * FROM products WHERE product_id = ?";
    public static final String GET_PRODUCT_PRICE = "SELECT price FROM products WHERE product_id = ?";

    public static final String GET_PRODUCT_BY_CATEGORY = "SELECT * FROM products WHERE category_id = ?";

    public static final String GET_PRODUCT_BY_PRICE = "SELECT * FROM products WHERE price BETWEEN ? AND ?";

    public static final String GET_PRODUCT_BY_NAME = "SELECT * FROM products WHERE name LIKE ?";

    public static final String GET_MOST_ONE_MOST_SELLING_PRODUCT = "SELECT p.product_id, p.name, p.price, p.`desc`, p.category_id, SUM(oi.quantity) AS total_quantity\n" +
            "FROM products p\n" +
            "JOIN orderItems oi ON p.product_id = oi.product_id\n" +
            "GROUP BY p.product_id\n" +
            "ORDER BY total_quantity DESC\n" +
            "LIMIT 1";

    public static final String GET_PRODUCT_BY_CATEGORY_AND_PRICE = "SELECT * FROM products WHERE category_id = ? AND price BETWEEN ? AND ?";

    public static final String GET_MAX_PRICE = "SELECT MAX(price) AS max_price FROM products";
    public static final String GET_MIN_PRICE = "SELECT MIN(price) AS min_price FROM products";

    public static final String GET_PRODUCTS_BY_FILTER = "SELECT * FROM products WHERE price BETWEEN ? AND ? AND category_id = ? AND name LIKE ?";

    public static  final  String CREATE_ORDER = "INSERT INTO orders (user_id, orderStatus, paymentStatus, total) VALUES (?, ?, ?, ?)";
    public static  final  String CREATE_ORDER_ITEM = "INSERT INTO orderItems (order_id, product_id, quantity) VALUES (?, ?, ?)";

    public static final String INSERT_INTO_CART ="INSERT INTO cart(user_id) VALUES (?)";

    public static final String INSERT_INTO_CART_ITEM = "INSERT INTO cartItem(cart_id, product_id, quantity) VALUES (?, ?, ?)";

    public static final String GET_CART_ITEMS = "SELECT * FROM cartItem WHERE cart_id = ?";


    public static final String SELECT_CART_ITEM_BY_USER_ID = "SELECT c.cart_id, ci.cart_item_id, ci.quantity, p.product_id, p.name,p.price\n" +
            "FROM cart c\n" +
            "JOIN cartItem ci ON c.cart_id = ci.cart_id\n" +
            "JOIN products p ON ci.product_id = p.product_id\n" +
            "WHERE c.user_id = (?) ";

    public static final String UPDATE_CART_ITEM_QUANTITY = "UPDATE cartItem SET quantity = ? WHERE cart_item_id = ?";

    public static final String DELETE_CART_ITEM = "DELETE FROM cartItem WHERE cart_item_id = ?";

    public static final String CHECK_PRODUCT_IN_CART = "SELECT * FROM cartItem WHERE cart_id = ? AND product_id = ?";

    public static final String SELECT_CART_COUNT = "SELECT COUNT(*) AS count FROM cart WHERE user_id = ?";

    public static final String DELETE_ORDER_ITEM  = "DELETE FROM orderItems WHERE order_id = ?";
    public static final String DELETE_ORDER = "DELETE FROM orders WHERE order_id = ?";
    public static final String UPDATE_ORDER = "UPDATE orders SET orderStatus = ?, paymentStatus = ? WHERE order_id = ?";

    public static final String GET_ORDERS = "SELECT * FROM orders";
    public static final String GET_ORDER_ITEMS = "SELECT * FROM orderItems WHERE order_id = ?";

    public static final String GET_ORDER_BY_USER_ID = "SELECT * FROM orders WHERE user_id = ?";

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
