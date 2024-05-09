package com.icp.gadgets.doa;

import com.icp.gadgets.controller.servlet.DatabaseController;
import com.icp.gadgets.utils.StringUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderDoa {
    public  int createOrder(int userId, String orderStatus, String paymentStatus, int totalAmount){
        try(Connection con = new DatabaseController().getConnection()){
            PreparedStatement st = con.prepareStatement(StringUtils.CREATE_ORDER, PreparedStatement.RETURN_GENERATED_KEYS);
            st.setInt(1, userId);
            st.setString(2, orderStatus);
            st.setString(3, paymentStatus);
            st.setInt(4, totalAmount);
            int result = st.executeUpdate();
            if (result > 0) {
                try (ResultSet generatedKeys = st.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int orderId = generatedKeys.getInt(1);
                        System.out.println("Generated Order ID: " + orderId);
                        return orderId;
                    } else {
                        throw new SQLException("Creating order failed, no ID obtained.");
                    }
                }
            } else {
                return 0;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public  int creatOrderItem(int orderId, int productId, int quantity){
        try(Connection con = new DatabaseController().getConnection()){
            PreparedStatement st = con.prepareStatement(StringUtils.CREATE_ORDER_ITEM);
            st.setInt(1, orderId);
            st.setInt(2, productId);
            st.setInt(3, quantity);
            return st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public int updateOrder(int orderId, String orderStatus, String paymentStatus, int totalAmount){
        try(Connection con = new DatabaseController().getConnection()){
            PreparedStatement st = con.prepareStatement(StringUtils.UPDATE_ORDER);
            st.setString(1, orderStatus);
            st.setString(2, paymentStatus);
            st.setInt(3, totalAmount);
            st.setInt(4, orderId);
            return st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public int deleteOrder(int orderId,int OrderItemId){
        try(Connection con = new DatabaseController().getConnection()){
            PreparedStatement st = con.prepareStatement(StringUtils.DELETE_ORDER_ITEM);
            st.setInt(1, orderId);
            st.setInt(2, OrderItemId);
            int result = st.executeUpdate();
            if (result > 0) {
                PreparedStatement st1 = con.prepareStatement(StringUtils.DELETE_ORDER);
                st1.setInt(1, orderId);
                return st1.executeUpdate();
            } else {
                return 0;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return 0;
        }
    }
}
