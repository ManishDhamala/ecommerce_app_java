package com.icp.gadgets.controller.servlet.login;

import java.io.IOException;
import java.sql.SQLException;

import com.icp.gadgets.model.User;
import com.icp.gadgets.utils.StringUtils;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.icp.gadgets.controller.servlet.DatabaseController;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "loginServlet", value = "/login-servlet")
public class login extends HttpServlet {
    private static final long serialVersionUID = 1L;


    DatabaseController dbController = new DatabaseController();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter(StringUtils.USERNAME);
        String password = request.getParameter(StringUtils.PASSWORD);

        // Retrieve user information from the database
        User user = null;
        try {
            user = dbController.getUserInfo(username);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
//        int loginResult = dbController.getUserLoginInfo(username, password);

        User userInfo = dbController.getLoginUserInfo(username, password);

        if (userInfo != null) {
            HttpSession session = request.getSession(true);
            session.setMaxInactiveInterval(30 * 60); // 30 minutes
            session.setAttribute("userId", userInfo.getId());
            session.setAttribute("user", userInfo);
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else if (user == null){
            if(!dbController.isUsernameExists(username)){
                response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE + "?" + StringUtils.ERROR_MESSAGE + "=Invalid Username and Password!");
            }
        }
        else {

            response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE + "?" + StringUtils.ERROR_MESSAGE + "=Invalid  Password!");
        }
//        if (loginResult == 1) {
//            HttpSession session = request.getSession(true);
//            session.setAttribute("user", user);
//            response.sendRedirect(request.getContextPath() + "/index.jsp");
//        } else if (loginResult == 0) {
//            if (!dbController.isUsernameExists(username)) {
//                response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE + "?" + StringUtils.ERROR_MESSAGE + "=Invalid Username and Password!");
//            } else {
//                response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE + "?" + StringUtils.ERROR_MESSAGE + "=Invalid Password!");
//            }
//        }
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doGet(request, response);
    }

}