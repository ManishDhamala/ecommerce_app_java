//package com.icp.gadgets.doa;
//
//import com.icp.gadgets.controller.servlet.DatabaseController;
//import com.icp.gadgets.model.CartItem;
//import com.icp.gadgets.utils.StringUtils;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//
//public class CartItemDoa {
//
//    CartItem carditem = new CartItem();
//    public int addCartItem(int cart_item_id, int quantity, int cart_id, int product_id) {
//        // Add cart item to the database
//       try(Connection con = new DatabaseController().getConnection()) {
//            PreparedStatement st = con.prepareStatement(StringUtils.INSERT_CART_ITEM);
//            st.setInt(1, cart_item_id);
//            st.setInt(2, quantity);
//            st.setInt(3, cart_id);
//            st.setInt(4, product_id);
//            int result = st.executeUpdate();
//            return result > 0 ? 1 : 0;
//        } catch ( ClassNotFoundException | SQLException ex) {
//            ex.printStackTrace(); // Log the exception for debugging
//            return -1;
//        }
//    }
//
//}
