package com.icp.gadgets.controller.servlet.product;

import java.io.*;
import java.util.UUID;

import com.icp.gadgets.doa.ImageDoa;
import com.icp.gadgets.doa.ProductDoa;
import com.icp.gadgets.utils.StringUtils;
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

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        String productName = request.getParameter("productName");
        String productDescription = request.getParameter("productDesc");
        int productPrice = Integer.parseInt(request.getParameter("productPrice"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        Part filePart = request.getPart("productImage"); // Retrieve the image file part from the request
        String fileName = UUID.randomUUID().toString(); // Generate a unique filename
        String fileExtension = new ImageDoa().getFileExtension(filePart); // Get the file extension
        String filePath = new ImageDoa().SaveImageToFile(filePart, fileName, fileExtension); // Save the image to the file system
        if(filePath == null) {
            response.sendRedirect(request.getContextPath()+"/pages/adminproduct.jsp?"+ StringUtils.ERROR_MESSAGE+"=Error Adding Image. Please try again.");
        }else {
            System.out.println("Image saved to: " + filePath);
        }
        int productId = new ProductDoa().addProduct(productName, productPrice, productDescription, categoryId); // Add the product to the database

        if(productId == 0) {
            response.sendRedirect(request.getContextPath()+"/pages/adminproduct.jsp?"+ StringUtils.ERROR_MESSAGE+"=Error Adding Product. Please try again.");
        }else {
           int result = new ImageDoa().SaveImageToDatabase(productId, filePath); // Save the image path to the database
            if(result == 0) {
              response.sendRedirect(request.getContextPath()+"/pages/adminproduct.jsp?"+ StringUtils.ERROR_MESSAGE+"=Error Adding Product. Please try again.");
            }else{
                response.sendRedirect(request.getContextPath()+"/pages/adminproduct.jsp?"+ StringUtils.SUCCESS_MESSAGE+"=Product Added Successfully");
            }

        }

    }

    public void destroy() {
    }
}