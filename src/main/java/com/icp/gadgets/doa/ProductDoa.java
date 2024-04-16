package com.icp.gadgets.doa;

import com.icp.gadgets.controller.servlet.DatabaseController;
import com.icp.gadgets.model.Product;
import com.icp.gadgets.utils.StringUtils;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDoa {

    public int addProduct(String productName,int productPrice,String productDescription,int categoryId)
    {
        try(Connection con = new DatabaseController().getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.INSERT_PRODUCT, PreparedStatement.RETURN_GENERATED_KEYS);
            st.setString(1, productName);
            st.setInt(2, productPrice);
            st.setString(3, productDescription);
            st.setInt(4, categoryId);
            int result = st.executeUpdate();
            if (result > 0) {
                try (ResultSet generatedKeys = st.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int productId = generatedKeys.getInt(1);
                        System.out.println("Generated Product ID: " + productId);
                        return productId;
                    } else {
                        throw new SQLException("Creating product failed, no ID obtained.");
                    }
                }
            } else {
                return 0;
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        try(Connection con = new DatabaseController().getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.GET_PRODUCTS);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                Product product = new Product();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("name"));
                product.setProductPrice(rs.getInt("price"));
                product.setProductDescription(rs.getString("desc"));
                product.setCategoryId(rs.getInt("category_id"));
                products.add(product);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
        return products;
    }

}
