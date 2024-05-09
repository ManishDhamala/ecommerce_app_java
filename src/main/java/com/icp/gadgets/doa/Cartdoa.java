package com.icp.gadgets.doa;

import com.icp.gadgets.controller.servlet.DatabaseController;
import com.icp.gadgets.model.CartItem;
import com.icp.gadgets.utils.StringUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

public class Cartdoa {


    public int addToCart(int userId){
        try(Connection con = new DatabaseController().getConnection()){
            PreparedStatement st = con.prepareStatement(StringUtils.INSERT_INTO_CART, PreparedStatement.RETURN_GENERATED_KEYS);
            st.setInt(1, userId);
            int result = st.executeUpdate();
            if(result > 0){
                try(ResultSet generatedKeys = st.getGeneratedKeys()){
                    if(generatedKeys.next()){
                        int cartId = generatedKeys.getInt(1);
                        System.out.println("Generated Cart ID: " + cartId);
                        return cartId;
                    }else{
                        throw new SQLException("Creating cart failed, no ID obtained.");
                    }
                }
            }else {
                return 0;
            }
        }catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public  int addToCartItem(int cartId, int productId, int quantity){
        try(Connection con = new DatabaseController().getConnection()){
            //Check if product already exists in cart
            PreparedStatement st = con.prepareStatement(StringUtils.CHECK_PRODUCT_IN_CART);
            st.setInt(1, cartId);
            st.setInt(2, productId);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                int cartItemId = rs.getInt("cart_item_id");
                int existingQuantity = rs.getInt("quantity");
                return updateCartItemQuantity(cartItemId, existingQuantity + quantity);
            }else{
                //Add new product to cart
                st = con.prepareStatement(StringUtils.INSERT_INTO_CART_ITEM);
                st.setInt(1, cartId);
                st.setInt(2, productId);
                st.setInt(3, quantity);
                return st.executeUpdate();
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public List<CartItem> getCartItemByUserID(int userId) {
        List<CartItem> cartItems = new ArrayList<>();
        Map<Integer, CartItem> consolidatedCart = new HashMap<>();
        try (Connection con = new DatabaseController().getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.SELECT_CART_ITEM_BY_USER_ID);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                if (consolidatedCart.containsKey(productId)) {
                    // Increment quantity if product already exists in cart
                    CartItem existingCartItem = consolidatedCart.get(productId);
                    existingCartItem.setQuantity(existingCartItem.getQuantity() + rs.getInt("quantity"));
                } else {
                    // Add new cart item if product doesn't exist in cart
                    CartItem cartItem = new CartItem();
                    cartItem.setCartItemId(rs.getInt("cart_item_id"));
                    cartItem.setCartId(rs.getInt("cart_id"));
                    cartItem.setProductId(productId);
                    cartItem.setQuantity(rs.getInt("quantity"));
                    cartItem.setProductName(rs.getString("name"));
                    cartItem.setPrice(rs.getInt("price"));
                    consolidatedCart.put(productId, cartItem);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        cartItems.addAll(consolidatedCart.values());

        return cartItems;
    }

    public  List<CartItem> getCartItems(int cartId){
        List<CartItem> cartItems = new ArrayList<>();
        try(Connection con = new DatabaseController().getConnection()){
            PreparedStatement st = con.prepareStatement(StringUtils.GET_CART_ITEMS);
            st.setInt(1, cartId);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                CartItem cartItem = new CartItem();
                cartItem.setCartItemId(rs.getInt("cart_item_id"));
                cartItem.setCartId(rs.getInt("cart_id"));
                cartItem.setProductId(rs.getInt("product_id"));
                cartItem.setQuantity(rs.getInt("quantity"));
                cartItems.add(cartItem);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return cartItems;
    }

    public  int updateCartItemQuantity(int cartItemId, int quantity){
        try(Connection con = new DatabaseController().getConnection()){
            PreparedStatement st = con.prepareStatement(StringUtils.UPDATE_CART_ITEM_QUANTITY);
            st.setInt(1, quantity);
            st.setInt(2, cartItemId);
            //Log the query
            System.out.println(st);
            //Log the execution of the query

            return st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error updating cart item quantity"+e);
            e.printStackTrace();
            return 0;
        }
    }

    public  int deleteCartItem(int cartItemId){
        try(Connection con = new DatabaseController().getConnection()){
            PreparedStatement st = con.prepareStatement(StringUtils.DELETE_CART_ITEM);
            st.setInt(1, cartItemId);
            return st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error deleting cart item"+e);
            e.printStackTrace();
            return 0;
        }
    }

}
