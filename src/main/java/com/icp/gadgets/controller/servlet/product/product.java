package com.icp.gadgets.controller.servlet.product;

import java.io.*;
import java.util.List;
import java.util.UUID;

import com.google.gson.Gson;
import com.icp.gadgets.doa.ImageDoa;
import com.icp.gadgets.doa.ProductDoa;
import com.icp.gadgets.model.Product;
import com.icp.gadgets.utils.StringUtils;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


@WebServlet(name = "productServlet", value = "/product")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class product extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }


    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        String strMinPrice = request.getParameter("minPrice");
        String strMaxPrice = request.getParameter("maxPrice");
        String strCategoryId = request.getParameter("categoryId");

        Gson gson = new Gson();

        int minPrice = 0;
        int maxPrice = 0;
        int categoryId = 0;
        if(strMinPrice != null && !strMinPrice.isEmpty()){
            minPrice = Integer.parseInt(strMinPrice);
        }
        if(strMaxPrice != null && !strMaxPrice.isEmpty()){
            maxPrice = Integer.parseInt(strMaxPrice);
        }
        if(strCategoryId != null && !strCategoryId.isEmpty()){
            categoryId = Integer.parseInt(strCategoryId);
        }
        String search = request.getParameter("search");
        if(search == null || search.isEmpty()){
            search = "";
        }
        if(minPrice == 0 && maxPrice == 0 && categoryId == 0 && search.isEmpty()){
            List<Product> products = new ProductDoa().getAllProducts();
            String productsJson = gson.toJson(products);
//            response.getWriter().write(productsJson);

        }else if(minPrice != 0 && maxPrice != 0 && categoryId != 0) {
            List<Product> products = new ProductDoa().getProductsByCategoryAndPrice(minPrice, maxPrice, categoryId);
            String productsJson = gson.toJson(products);
//            response.getWriter().write(productsJson);
        } else if (minPrice != 0 && maxPrice != 0) {
            List<Product> products = new ProductDoa().getProductsByPrice(minPrice, maxPrice);
            String productsJson = gson.toJson(products);
//            response.getWriter().write(productsJson);
        } else if (categoryId != 0) {
            List<Product> products = new ProductDoa().getProductsByCategory(categoryId);
            String productsJson = gson.toJson(products);
//            response.getWriter().write(productsJson);
        } else {
            List<Product> products = new ProductDoa().getProductByName(search);
            String productsJson = gson.toJson(products);
//            response.getWriter().write(productsJson);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("application/json");
        String methodName = request.getParameter("_method");
        if(methodName != null && methodName.equalsIgnoreCase("PUT")) {
            doPut(request, response);
        }else if(methodName != null && methodName.equalsIgnoreCase("DELETE")){
            doDelete(request, response);
        }
        else {
            String productName = request.getParameter("productName");
            String productDescription = request.getParameter("productDesc");
            String productPriceStr = request.getParameter("productPrice");
            String categoryIdStr = request.getParameter("categoryId");

            int productPrice = 0;
            int categoryId = 0;
            if (productPriceStr != null && !productPriceStr.isEmpty()) {
                productPrice = Integer.parseInt(productPriceStr);
            }
            if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
                categoryId = Integer.parseInt(categoryIdStr);
            }
            Part filePart = request.getPart("productImage"); // Retrieve the image file part from the request
            String fileName = UUID.randomUUID().toString(); // Generate a unique filename
            String fileExtension = new ImageDoa().getFileExtension(filePart); // Get the file extension
            String filePath = new ImageDoa().SaveImageToFile(filePart, fileName, fileExtension); // Save the image to the file system
            System.out.println("File Path: " + filePath);
            if (filePath == null) {
                response.sendRedirect(request.getContextPath() + "/pages/adminproduct.jsp?" + StringUtils.ERROR_MESSAGE + "=Error Adding Image. Please try again.");
            } else {
                System.out.println("Image saved to: " + filePath);
            }
            int productId = new ProductDoa().addProduct(productName, productPrice, productDescription, categoryId); // Add the product to the database

            if (productId == 0) {
                response.sendRedirect(request.getContextPath() + "/pages/adminproduct.jsp?" + StringUtils.ERROR_MESSAGE + "=Error Adding Product. Please try again.");
            } else {
                int result = new ImageDoa().SaveImageToDatabase(productId, filePath); // Save the image path to the database
                if (result == 0) {
                    response.sendRedirect(request.getContextPath() + "/pages/adminproduct.jsp?" + StringUtils.ERROR_MESSAGE + "=Error Adding Product. Please try again.");
                } else {
                    response.sendRedirect(request.getContextPath() + "/pages/adminproduct.jsp?" + StringUtils.SUCCESS_MESSAGE + "=Product Added Successfully");
                }

            }
        }

    }

    public void doPut(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        response.setContentType("text/html");
        int productId = Integer.parseInt(request.getParameter("productId"));
        if( productId == 0){
            response.sendRedirect(request.getContextPath() + "/pages/adminproduct.jsp?" + StringUtils.ERROR_MESSAGE + "=Invalid Product ID");
        }
        String productName = request.getParameter("productName");
        String productDescription = request.getParameter("productDesc");
        int productPrice = Integer.parseInt(request.getParameter("productPrice"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        Part filePart = request.getPart("productImage"); // Retrieve the image file part from the request



        // If a new image is uploaded, save it to local and update database
        if (filePart != null ) {
            // Check if there are any images associated with the product ID
            String oldImgURL = new ImageDoa().getImgURLByProductId(productId);
            if (oldImgURL != null && !oldImgURL.isEmpty()) {
                // Image found, remove it
                int result = new ImageDoa().removeImageByProductId(productId);
                if (result == 0) {
                    response.sendRedirect(request.getContextPath() + "/pages/adminproduct.jsp?" + StringUtils.ERROR_MESSAGE + "=Error removing old image. Please try again.");
                    return;
                }
            }
            System.out.println("New image uploaded");
            String fileName = UUID.randomUUID().toString(); // Generate a unique filename
            String fileExtension = new ImageDoa().getFileExtension(filePart); // Get the file extension
            String filePath = new ImageDoa().SaveImageToFile(filePart, fileName, fileExtension); // Save the image to the file system
            if (filePath == null) {
                response.sendRedirect(request.getContextPath() + "/pages/adminproduct.jsp?" + StringUtils.ERROR_MESSAGE + "=Error adding new image. Please try again.");
                return;
            }
            // Update product information with new image path
            int updateResult = new ProductDoa().updateProduct(productId, productName, productPrice, productDescription, categoryId);
            if (updateResult == 0) {
                response.sendRedirect(request.getContextPath() + "/pages/adminproduct.jsp?" + StringUtils.ERROR_MESSAGE + "=Error updating product. Please try again.");
                return;
            }
            // Save new image path to the database
            int imageResult = new ImageDoa().SaveImageToDatabase(productId, filePath);
            if (imageResult == 0) {
                response.sendRedirect(request.getContextPath() + "/pages/adminproduct.jsp?" + StringUtils.ERROR_MESSAGE + "=Error updating product image. Please try again.");
                return;
            }
        } else {
            // No new image uploaded, update product information without changing the image
            int updateResult = new ProductDoa().updateProduct(productId, productName, productPrice, productDescription, categoryId);
            if (updateResult == 0) {
                response.sendRedirect(request.getContextPath() + "/pages/adminproduct.jsp?" + StringUtils.ERROR_MESSAGE + "=Error updating product. Please try again.");
                return;
            }
        }

        // Redirect to success page
        response.sendRedirect(request.getContextPath() + "/pages/adminproduct.jsp?" + StringUtils.SUCCESS_MESSAGE + "=Product Updated Successfully");


    }

    public void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        int productId = Integer.parseInt(request.getParameter("productId"));
        if( productId == 0){
            response.sendRedirect(request.getContextPath() + "/pages/adminproduct.jsp?" + StringUtils.ERROR_MESSAGE + "=Invalid Product ID");
        }
        int result = new ProductDoa().deleteProduct(productId);
        if(result == 0){
            response.sendRedirect(request.getContextPath() + "/pages/adminproduct.jsp?" + StringUtils.ERROR_MESSAGE + "=Error deleting product. Please try again.");
        }else{
            response.sendRedirect(request.getContextPath() + "/pages/adminproduct.jsp?" + StringUtils.SUCCESS_MESSAGE + "=Product Deleted Successfully");
        }
    }


    public void destroy() {
    }
}