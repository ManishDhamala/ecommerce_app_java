package com.icp.gadgets.model;

import java.sql.Date;

public class Order {

    private int order_id;
    private int user_id;
    private Date order_date;
    private String order_status;
    private int order_total;
    private String payment_status;

    private int order_item_id;

    private int quantity;

    private int product_id;


    public Order() {
    }

    public Order(int order_id, int user_id, Date order_date, String order_status, int order_total, String payment_status, int order_item_id, int quantity, int product_id) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.order_date = order_date;
        this.order_status = order_status;
        this.order_total = order_total;
        this.payment_status = payment_status;
        this.order_item_id = order_item_id;
        this.quantity = quantity;
        this.product_id = product_id;
    }


    public int getOrder_id() {
        return order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public String getOrder_status() {
        return order_status;
    }

    public int getOrder_total() {
        return order_total;
    }

    public String getPayment_status() {
        return payment_status;
    }

    public int getOrder_item_id() {
        return order_item_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public void setOrder_status(String order_status) {
        this.order_status = order_status;
    }

    public void setOrder_total(int order_total) {
        this.order_total = order_total;
    }

    public void setPayment_status(String payment_status) {
        this.payment_status = payment_status;
    }

    public void setOrder_item_id(int order_item_id) {
        this.order_item_id = order_item_id;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

}
