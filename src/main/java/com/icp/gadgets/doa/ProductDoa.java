package com.icp.gadgets.doa;

import com.icp.gadgets.controller.servlet.DatabaseController;
import com.icp.gadgets.model.Carts;
import com.icp.gadgets.model.Product;
import com.icp.gadgets.utils.StringUtils;

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

    public List<Product> getProductsByCategory(int categoryId) {
        List<Product> products = new ArrayList<>();
        try(Connection con = new DatabaseController().getConnection()) {
                PreparedStatement st = con.prepareStatement(StringUtils.GET_PRODUCT_BY_CATEGORY);
                st.setInt(1, categoryId);
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

    public List<Product> getProductsByPrice(int minPrice, int maxPrice) {
        List<Product> products = new ArrayList<>();
        try(Connection con = new DatabaseController().getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.GET_PRODUCT_BY_PRICE);
            st.setInt(1, minPrice);
            st.setInt(2, maxPrice);
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

    public List<Product> getProductsByCategoryAndPrice(int categoryId, int minPrice, int maxPrice) {
        List<Product> products = new ArrayList<>();
        try(Connection con = new DatabaseController().getConnection()) {

            PreparedStatement st = con.prepareStatement(StringUtils.GET_PRODUCT_BY_CATEGORY_AND_PRICE);
                st.setInt(1, categoryId);
                st.setInt(2, minPrice);
                st.setInt(3, maxPrice);
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

    public List<Product> getProductsByFilter(int minPrice, int maxPrice, int categoryId, String search) {
        List<Product> products = new ArrayList<>();
        try(Connection con = new DatabaseController().getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.GET_PRODUCTS_BY_FILTER);
            st.setInt(1, minPrice);
            st.setInt(2, maxPrice);
            st.setInt(3, categoryId);
            st.setString(4, "%" + search + "%");
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

    public Product getMostSellingProduct(){
        Product product = new Product();
        try(Connection con = new DatabaseController().getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.GET_MOST_ONE_MOST_SELLING_PRODUCT);
            ResultSet rs = st.executeQuery();
            if(rs.next()) {
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("name"));
                product.setProductPrice(rs.getInt("price"));
                product.setProductDescription(rs.getString("desc"));
                product.setCategoryId(rs.getInt("category_id"));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
        return product;
    }

    public  List<Product> getProductByName(String name){
        List<Product> products = new ArrayList<>();
        try(Connection con = new DatabaseController().getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.GET_PRODUCT_BY_NAME);
            st.setString(1, "%" + name + "%");
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

    public int getMaxPrice() {
        try(Connection con = new DatabaseController().getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.GET_MAX_PRICE);
            ResultSet rs = st.executeQuery();
            if(rs.next()) {
                return rs.getInt("max_price");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return 0;
        }
        return 0;
    }

    public int getMinPrice() {
        try(Connection con = new DatabaseController().getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.GET_MIN_PRICE);
            ResultSet rs = st.executeQuery();
            if(rs.next()) {
                return rs.getInt("min_price");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return 0;
        }
        return 0;
    }

    public int updateProduct(int productId, String productName, int productPrice, String productDescription, int categoryId) {
        try(Connection con = new DatabaseController().getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.UPDATE_PRODUCT);
            st.setString(1, productName);
            st.setInt(2, productPrice);
            st.setString(3, productDescription);
            st.setInt(4, categoryId);
            st.setInt(5, productId);
           int result = st.executeUpdate();
           if(result > 0) {
               return 1;
           } else {
               return 0;
           }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return 0;
        }
    }



    public Product getProductById(int productId) {
        Product product = new Product();
        try(Connection con = new DatabaseController().getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.GET_PRODUCT_BY_ID);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            if(rs.next()) {
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("name"));
                product.setProductPrice(rs.getInt("price"));
                product.setProductDescription(rs.getString("desc"));
                product.setCategoryId(rs.getInt("category_id"));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
        return product;
    }

    public int deleteProduct(int productId) {
        try(Connection con = new DatabaseController().getConnection()) {
            int resultOfAssociatedImageDelete = deleteAssociatedImage(con, productId);
            if(resultOfAssociatedImageDelete == 0) {
                return 0;
            }
            PreparedStatement st = con.prepareStatement(StringUtils.DELETE_PRODUCT);
            st.setInt(1, productId);
            int result = st.executeUpdate();
            if(result > 0) {
                return 1;
            } else {
                return 0;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public int deleteAssociatedImage(Connection con, int productId){
        try {
            PreparedStatement st = con.prepareStatement(StringUtils.DELETE_ASSOCIATED_IMAGE);
            st.setInt(1, productId);
            return st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public List<Carts> getCartProducts(ArrayList<Carts> cartsList){
        List<Carts> prodcts = new ArrayList<>();

        try(Connection con = new DatabaseController().getConnection()){

            if(cartsList.size()>0){
                for (Carts item: cartsList){

                    PreparedStatement st = con.prepareStatement(StringUtils.GET_PRODUCT_ITEM);
                    st.setInt(1,item.getProductId());
                    ResultSet rs = st.executeQuery();
                    while (rs.next()){
                        Carts carts = new Carts();
                        carts.setProductId(rs.getInt("product_id"));
                        carts.setProductName(rs.getString("name"));
                        carts.setProductPrice(rs.getInt("price")*item.getQuantity());
                        carts.setProductDescription(rs.getString("desc"));
                        carts.setCategoryId(rs.getInt("category_id"));
                        carts.setQuantity(item.getQuantity());
                        prodcts.add(carts);
                    }


                }
            }

        }
        catch (Exception e){
            System.out.println("Error in getCartProducts");

        }
        return  prodcts;

    }
    public double getTotalCartPrice(ArrayList<Carts> cartsList) throws SQLException, ClassNotFoundException {
        double total = 0 ;

        try(Connection con = new DatabaseController().getConnection()){
            if(cartsList.size()>0){
                for (Carts item: cartsList){
                    PreparedStatement st = con.prepareStatement(StringUtils.GET_PRODUCT_PRICE);
                    st.setInt(1,item.getProductId());
                    ResultSet rs = st.executeQuery();
                    while (rs.next()){
                        total += rs.getDouble("price")*item.getQuantity();
                    }
                }
            }


        }catch (Exception e){
            System.out.println("Error in getTotalCartPrice");
        }


        return total;
    }


}
