package com.icp.gadgets.controller.servlet.login;

import java.io.IOException;
import java.io.PrintWriter;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.icp.gadgets.controller.servlet.DatabaseController;
import com.icp.gadgets.utils.StringUtils;

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
        String username = request.getParameter(StringUtils.USERNAME) ;
        String password = request.getParameter(StringUtils.PASSWORD) ;

        int loginResult = dbController.getUserLoginInfo(username, password) ;

        if (loginResult == 1) {
            // Successful login
            response.sendRedirect(request.getContextPath()+"/index.jsp") ;
        } else if (loginResult == 0) {
            if (!dbController.isUsernameExists(username)){
                response.sendRedirect(request.getContextPath()+StringUtils.LOGIN_PAGE+"?"+StringUtils.ERROR_MESSAGE+"=Invalid Username and Password!");
            }else {
                response.sendRedirect(request.getContextPath()+StringUtils.LOGIN_PAGE+"?"+StringUtils.ERROR_MESSAGE+"=Invalid Password!");
            }

        } else {
            // code will be followed in later weeks
        }

    }


    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            doGet(request, response);
    }





}