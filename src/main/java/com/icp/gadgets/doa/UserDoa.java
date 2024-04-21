package com.icp.gadgets.doa;

import com.icp.gadgets.controller.servlet.DatabaseController;
import com.icp.gadgets.model.User;
import com.icp.gadgets.utils.StringUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDoa {

   public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        // Get all users from the database
        try(Connection con = new DatabaseController().getConnection()){
            PreparedStatement st = con.prepareStatement(StringUtils.GET_ALL_USERS);
            ResultSet result = st.executeQuery();
            while (result.next()){
                User user = new User();
                user.setId(result.getInt("user_id"));
                user.setFullName(result.getString("name"));
                user.setEmail(result.getString("email"));
                user.setPhoneNumber(result.getString("phonenumber"));
                user.setAddress(result.getString("address"));
                user.setDob(result.getDate("dob").toLocalDate());
                user.setUsername(result.getString("username"));
                user.setGender(result.getString("gender"));
                user.setRole(result.getString("role"));
                users.add(user);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
        return users;
    }
}
