package com.icp.gadgets.doa;

import com.icp.gadgets.controller.servlet.DatabaseController;
import com.icp.gadgets.model.Order;
import com.icp.gadgets.utils.StringUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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


    public List<Order> getAllOrders(){
        List<Order> orders = new ArrayList<>();
        try(Connection con = new DatabaseController().getConnection()){
            PreparedStatement st = con.prepareStatement(StringUtils.GET_ORDERS);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                Order order = new Order();
                order.setOrder_id(rs.getInt("order_id"));
                order.setUser_id(rs.getInt("user_id"));
                order.setOrder_status(rs.getString("orderStatus"));
                order.setPayment_status(rs.getString("paymentStatus"));
                order.setOrder_total(rs.getInt("total"));
                order.setOrder_date(rs.getDate("created_at"));
                orders.add(order);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
        return orders;
    }

    public List<Order> getAllOderItems(int orderId){
        System.out.println("Order ID: " + orderId);
        List<Order> orders = new ArrayList<>();
        try(Connection con = new DatabaseController().getConnection()){
            PreparedStatement st = con.prepareStatement(StringUtils.GET_ORDER_ITEMS);
            st.setInt(1, orderId);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                Order order = new Order();
                order.setOrder_item_id(rs.getInt("order_item_id"));
                order.setProduct_id(rs.getInt("product_id"));
                order.setQuantity(rs.getInt("quantity"));
                orders.add(order);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
        System.out.println(orders);
        return orders;
    }

    public List<Order> getOrderByUserId(int userId){
        System.out.println(userId);
        List<Order> orders = new ArrayList<>();
        try(Connection con = new DatabaseController().getConnection()){
            PreparedStatement st = con.prepareStatement(StringUtils.GET_ORDER_BY_USER_ID);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                Order order = new Order();
                order.setOrder_id(rs.getInt("order_id"));
                order.setUser_id(rs.getInt("user_id"));
                order.setOrder_status(rs.getString("orderStatus"));
                order.setPayment_status(rs.getString("paymentStatus"));
                order.setOrder_total(rs.getInt("total"));
                order.setOrder_date(rs.getDate("created_at"));
                orders.add(order);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
        System.out.println(orders);
        return orders;
    }

    public int updateOrder(int orderId, String orderStatus, String paymentStatus){
        System.out.println(paymentStatus);
        try(Connection con = new DatabaseController().getConnection()){
            PreparedStatement st = con.prepareStatement(StringUtils.UPDATE_ORDER);

            st.setString(1, orderStatus);
            st.setString(2, paymentStatus);
//            st.setInt(3, totalAmount);
            st.setInt(3, orderId);
            System.out.println(st);
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
//            st.setInt(2, OrderItemId);
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
