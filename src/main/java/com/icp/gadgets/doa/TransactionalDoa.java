package com.icp.gadgets.doa;

import com.icp.gadgets.controller.servlet.DatabaseController;
import com.icp.gadgets.model.SalesData;
import com.icp.gadgets.utils.StringUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TransactionalDoa {

    public int getTotalUsers() {
       try(Connection con = new DatabaseController().getConnection()){
           PreparedStatement ps = con.prepareStatement(StringUtils.GET_USERS_COUNT);
           ResultSet rs = ps.executeQuery();
              if(rs.next()){
//                  System.out.println("Total users found: " + rs.getInt("user_count"));
                return rs.getInt("user_count");
              }
//           System.out.println("No users found");
                return 0;
       }catch (ClassNotFoundException | SQLException e) {
           e.printStackTrace();
           return 0;
       }
       }

       public int getTotalProducts(){
              try(Connection con = new DatabaseController().getConnection()){
                PreparedStatement ps = con.prepareStatement(StringUtils.GET_PRODUCTS_COUNT);
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
//                    System.out.println("Total products found: " + rs.getInt("product_count"));
                    return rs.getInt("product_count");
                }
//                System.out.println("No products found");
                return 0;
              }catch (ClassNotFoundException | SQLException e) {
                  e.printStackTrace();
                  return 0;
              }
       }

         public int getTotalOrders(){
                  try(Connection con = new DatabaseController().getConnection()){
                 PreparedStatement ps = con.prepareStatement(StringUtils.GET_ORDERS_COUNT);
                 ResultSet rs = ps.executeQuery();
                 if(rs.next()){
//                     System.out.println("Total orders found: " + rs.getInt("order_count"));
                     return rs.getInt("order_count");
                 }
//                 System.out.println("No orders found");
                    return 0;
                    }catch (ClassNotFoundException | SQLException e) {
                        e.printStackTrace();
                        return 0;
                    }
            }
    public List<SalesData> getWeeklySales() throws SQLException, ClassNotFoundException {
        List<SalesData> salesList = new ArrayList<>();

        try (Connection con = new DatabaseController().getConnection()) {
            String query = StringUtils.GET_WEEKLY_SALES;

            try (PreparedStatement stmt = con.prepareStatement(query)) {
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    SalesData salesData = new SalesData();
                    salesData.setDayOfWeek(rs.getInt("day_of_week"));
                    salesData.setDailySales(rs.getDouble("daily_sales"));
                    salesData.setSalesPercentage(rs.getInt("sales_percentage"));
                    salesList.add(salesData);
                }
            }
        }
        System.out.println(salesList);
        System.out.println("Weekly sales data retrieved"+salesList.size());
        return salesList;
    }

    }

