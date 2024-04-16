package com.icp.gadgets.controller.servlet.category;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import com.icp.gadgets.doa.CatgeoryDoa;
import com.icp.gadgets.utils.StringUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "CategoryServlet", value = "/category")
public class Category extends HttpServlet {
    private String message;
    private CatgeoryDoa categoryDAO;

    public void init() {
        categoryDAO = new CatgeoryDoa(); // Initialize your DAO
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//           response.setContentType("text/html");
//        try {
//            List<com.icp.gadgets.model.Category> categories = categoryDAO.getAllcategories();
//            request.setAttribute("categories", categories);
//            request.getRequestDispatcher("/pages/adminCategories.jsp").forward(request, response);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    }

    public void  doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        String methodName = request.getParameter("_method");

        if(methodName != null && methodName.equalsIgnoreCase("PUT")){
            doPut(request, response);
        }else if(methodName != null && methodName.equalsIgnoreCase("DELETE")){
            doDelete(request, response);
        }
        else {
            String categoryName = request.getParameter("categoryName");
            try {
                // Add category to the database
                int result = categoryDAO.addCategory(categoryName);

                if (result == 1) {
                    response.sendRedirect(request.getContextPath() + "/pages/adminCategories.jsp?" + StringUtils.SUCCESS_MESSAGE + "=Category Added Successfully");
                } else {
                    response.sendRedirect(request.getContextPath() + "/pages/adminCategories.jsp?" + StringUtils.ERROR_MESSAGE + "=Error Adding Category. Please try again.");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    public void doPut(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Get categoryId and categoryName from the request
        String categoryName = request.getParameter("categoryName");
        String categoryIdString = request.getParameter("categoryId"); // Get categoryId as a String

        try {
            // Parse categoryId to int (check for null before parsing)
            int categoryId = categoryIdString != null ? Integer.parseInt(categoryIdString) : -1;

            // Update category in the database
            int result = categoryDAO.updateCategory(categoryId, categoryName);

            if (result == 1) {
                response.sendRedirect(request.getContextPath() + "/pages/adminCategories.jsp?" + StringUtils.SUCCESS_MESSAGE + "=Category Updated Successfully");
            } else {
                response.sendRedirect(request.getContextPath() + "/pages/adminCategories.jsp?" + StringUtils.ERROR_MESSAGE + "=Error Updating Category. Please try again.");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/pages/adminCategories.jsp?" + StringUtils.ERROR_MESSAGE + "=Error Parsing Category ID");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/pages/adminCategories.jsp?" + StringUtils.ERROR_MESSAGE + "=Error Updating Category. Please try again.");
        }
    }


    public void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        try {
            // Delete category from the database
            int result = categoryDAO.deleteCategory(categoryId);

            if (result == 1) {
                response.sendRedirect(request.getContextPath() + "/pages/adminCategories.jsp?" + StringUtils.SUCCESS_MESSAGE + "=Category Deleted Successfully");
            } else if (result == 0) {
                response.sendRedirect(request.getContextPath() + "/pages/adminCategories.jsp?" + StringUtils.ERROR_MESSAGE + "=Category has products and cannot be deleted.");
            } else {
                response.sendRedirect(request.getContextPath() + "/pages/adminCategories.jsp?" + StringUtils.ERROR_MESSAGE + "=Error Deleting Category. Please try again.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/pages/adminCategories.jsp?" + StringUtils.ERROR_MESSAGE + "=Error Deleting Category. Please try again.");
        }
    }


    public void destroy() {
    }
}