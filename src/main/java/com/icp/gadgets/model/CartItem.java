package com.icp.gadgets.model;

public class CartItem {
    private int cartItemId;
    private int quantity;
    private int cartId;
    private int productId;

    private String productName;
    private int price;


    public CartItem(int cartItemId, int quantity, int cartId, int productId) {
        this.cartItemId = cartItemId;
        this.quantity = quantity;
        this.cartId = cartId;
        this.productId = productId;
    }

    public CartItem() {

    }

    // Getters and setters
    public int getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(int cartItemId) {
        this.cartItemId = cartItemId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    // toString method for debugging or logging purposes
    @Override
    public String toString() {
        return "CartItem{" +
                "cartItemId=" + cartItemId +
                ", quantity=" + quantity +
                ", productId=" + productId +
                ", productName='" + productName + '\'' +
                ", price=" + price +
                '}';
    }
}
