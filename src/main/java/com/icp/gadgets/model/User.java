package com.icp.gadgets.model;

import java.io.Serializable;
import java.time.LocalDate;

//(Serializable)converting its state to a byte stream, so that it can be saved to a database.
public class User implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id;

    private String fullName;
    private String username;
    private String email;
    private String phoneNumber;
    private String address;
    private LocalDate dob;
    private String password;
    private String gender;

   private String role;

    public User(String fullName, String username, String email, String phoneNumber, String address,
                LocalDate dob, String password, String gender) {
        this.fullName = fullName;
        this.username = username;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.dob = dob;
        this.password = password;
        this.gender = gender;
    }

    public User() {

    }


    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
