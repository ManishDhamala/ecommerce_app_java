package com.icp.gadgets.doa;

import com.icp.gadgets.controller.servlet.DatabaseController;
import com.icp.gadgets.model.Category;
import com.icp.gadgets.utils.StringUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CatgeoryDoa {
    Category category = new Category();
    public int  addCategory(String categoryName) {
        // Add category to the database
        try(Connection con = new DatabaseController().getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.INSET_CATEGORY);
            st.setString(1, categoryName);
            int result = st.executeUpdate();
            return result > 0 ? 1 : 0;
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
            return -1;
        }
    }

    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        try (Connection con = new DatabaseController().getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.GET_CATEGORIES);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                Category category = new Category(); // Create a new Category object for each iteration
                category.setCategoryId(result.getInt("category_id"));
                category.setCategoryName(result.getString("name"));
                categories.add(category);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
            return null;
        }
//        System.out.println(categories);
        return categories;
    }

    public int deleteCategory(int categoryId) {
        try(Connection con = new DatabaseController().getConnection()) {
            // First, check if there are products in the category
            PreparedStatement checkProductsStmt = con.prepareStatement(StringUtils.CHECK_PRODUCTS_IN_CATEGORY);
            checkProductsStmt.setInt(1, categoryId);
            ResultSet productResult = checkProductsStmt.executeQuery();

            if (productResult.next()) {
                int productCount = productResult.getInt("product_count");
                if (productCount > 0) {
                    // If there are products, return 0 to indicate category cannot be deleted
                    return 0;
                }
            }

            // No products found, proceed to delete the category
            PreparedStatement deleteStmt = con.prepareStatement(StringUtils.DELETE_CATEGORY);
            deleteStmt.setInt(1, categoryId);
            int result = deleteStmt.executeUpdate();
            return result > 0 ? 1 : 0;
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
            return -1;
        }
    }


    public int updateCategory(int categoryId, String categoryName) {
        try(Connection con = new DatabaseController().getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.UPDATE_CATEGORY);
            st.setString(1, categoryName);
            st.setInt(2, categoryId);
            int result = st.executeUpdate();
            return result > 0 ? 1 : 0;
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
            return -1;
        }
    }

    public String getCategoryById(int categoryId) {
        try(Connection con = new DatabaseController().getConnection()) {
        PreparedStatement st = con.prepareStatement(StringUtils.GET_CATEGORY_BY_ID);
            st.setInt(1, categoryId);
            ResultSet result = st.executeQuery();
            if(result.next()) {
                return result.getString("name");
            } else {
                return null;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
            return null;
        }
    }
}
