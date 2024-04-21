package com.icp.gadgets.model;

public class Order {

    private int order_id;
    private int user_id;
    private String order_date;
    private String order_status;
    private String order_total;
    private String payment_status;

    private int order_item_id;

    private int quantity;

    private int product_id;

    public Order() {
    }

    public Order(int order_id, int user_id, String order_date, String order_status, String order_total, String payment_status, int order_item_id, int quantity, int product_id) {
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



}
