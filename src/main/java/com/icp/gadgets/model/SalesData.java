package com.icp.gadgets.model;

public class SalesData {
    private int dayOfWeek;
    private double dailySales;

    private int salesPercentage;

    public SalesData(int dayOfWeek, double dailySales) {
        this.dayOfWeek = dayOfWeek;
        this.dailySales = dailySales;
    }

    public SalesData() {

    }

    public int getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(int dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public double getDailySales() {
        return dailySales;
    }

    public int getSalesPercentage() {
        return salesPercentage;
    }

    public void setSalesPercentage(int salesPercentage) {
        this.salesPercentage = salesPercentage;
    }

    public void setDailySales(double dailySales) {
        this.dailySales = dailySales;
    }
}
