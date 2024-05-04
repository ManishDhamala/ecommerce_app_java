package com.icp.gadgets.model;

public class Cart {
    private int cartId;
    private int userId;

    // Constructor
    public Cart(int cartId, int userId) {
        this.cartId = cartId;
        this.userId = userId;
    }

    // Getters and setters
    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
