package com.icp.gadgets.controller.servlet;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import com.icp.gadgets.model.User;
import com.icp.gadgets.utils.StringUtils;
import com.icp.gadgets.utils.Encryption;


public class DatabaseController {

    public Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/gadgets";
        String user = "root";
        String pass = "";
        return DriverManager.getConnection(url, user, pass);
    }


    public int addUser(User user) {
        try (Connection con = getConnection()) {

            PreparedStatement st = con.prepareStatement(StringUtils.INSERT_USER);

            st.setString(1, user.getFullName());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPhoneNumber());
            st.setString(4, user.getUsername());
            st.setDate(5, Date.valueOf(user.getDob()));
            //String encryptedPassword = Encryption.encrypt(user.getPassword());)
            st.setString(6, Encryption.encrypt(user.getPassword()));
            st.setString(7, user.getGender());
            st.setString(8, user.getAddress());




            int result = st.executeUpdate();
            return result > 0 ? 1 : 0;
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
            return -1;
        }
    }

    public int getUserLoginInfo(String username, String password) {
        try (Connection con = getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.GET_LOGIN_USER_INFO);
            st.setString(1, username);
            st.setString(2, Encryption.encrypt(password));
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
// Username and password match in the database
                return 1;
            } else {
// No matching record found
                return 0;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
            return -1;
        }
    }


// Existing methods...

    public boolean isUsernameExists(String username) {
        try (Connection con = getConnection()) {
            PreparedStatement st = con.prepareStatement("SELECT COUNT(*) AS count FROM users WHERE username = ?");
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("count");
                return count > 0;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
        }
        return false;
    }

    public boolean isEmailExists(String email) {
        try (Connection con = getConnection()) {
            PreparedStatement st = con.prepareStatement("SELECT COUNT(*) AS count FROM users WHERE email = ?");
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("count");
                return count > 0;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
        }
        return false;
    }

    public boolean isPhoneNumberExists(String phoneNumber) {
        try (Connection con = getConnection()) {
            PreparedStatement st = con.prepareStatement("SELECT COUNT(*) AS count FROM users WHERE phonenumber = ?");
            st.setString(1, phoneNumber);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("count");
                return count > 0;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
        }
        return false;
    }


    public User getUserInfo(String username) throws ClassNotFoundException, SQLException {
        DatabaseController dbController = new DatabaseController();
        User user = null;

        try (Connection con = dbController.getConnection()) {
            String sql = "SELECT * FROM users WHERE username=?";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                // Retrieve values from ResultSet

                String fullname  = rs.getString("name");
                String email = rs.getString("email");
                String phonenumber= rs.getString("phonenumber");
                String user_name = rs.getString("username");
                LocalDate dob = rs.getDate("dob").toLocalDate();
                String address = rs.getString("address");
                String password = rs.getString("password");
                String gender = rs.getString("gender");

                user = new User(fullname,user_name, email, phonenumber, address, dob, password,gender
                );
            }
            rs.close();
            statement.close();
        }
        return user;

    }


    public User getLoginUserInfo(String username, String password) {
        try (Connection con = getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.GET_LOGIN_USER_INFO);
            st.setString(1, username);
            st.setString(2, Encryption.encrypt(password));
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("user_id"));
                user.setFullName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phonenumber"));
                user.setUsername(rs.getString("username"));
                user.setDob(rs.getDate("dob").toLocalDate());
                user.setAddress(rs.getString("address"));
                user.setGender(rs.getString("gender"));
                user.setRole(rs.getString("role"));
                return user;
            } else {
                return null;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
            return null;
        }

    }

}
	
