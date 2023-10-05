package com.restaurant_management_system.beans;

public class Table {
    private int table_id;
    private String date;
    private String available_time;  

    public Table() {}

    public Table(int table_id, String date, String available_time) {
        this.table_id = table_id;
        this.date = date;
        this.available_time = available_time;
    }

    public int getTableId() {
        return table_id;
    }

    public void setTableId(int table_id) {
        this.table_id = table_id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAvailableTime() {
        return available_time;
    }

    public void setAvailableTime(String available_time) {
        this.available_time = available_time;
    }
}
