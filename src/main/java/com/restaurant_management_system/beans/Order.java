package com.restaurant_management_system.beans;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class Order {
    
    private int order_id;
    private List<Integer> order_items;
    private int table_number;
    private LocalDateTime date_and_time;
    private double total_price;
    private String customer_email;
    private String payment_mode;
    private String order_status;
    private String payment_status;

    public Order() {
    	order_items = new ArrayList<>();
    }

    public Order(int order_id, List<Integer> order_items, int table_number, LocalDateTime date_and_time, 
                double total_price, String customer_email, String payment_mode, String payment_status) {
        this.order_id = order_id;
        this.order_items = order_items;
        this.table_number = table_number;
        this.date_and_time = date_and_time;
        this.total_price = total_price;
        this.customer_email = customer_email;
        this.payment_mode = payment_mode;
        this.payment_status = payment_status;
    }

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public List<Integer> getOrder_items() {
		return order_items;
	}

	public void setOrder_items(List<Integer> order_items) {
		this.order_items = order_items;
	}

	public int getTable_number() {
		return table_number;
	}

	public void setTable_number(int table_number) {
		this.table_number = table_number;
	}

	public LocalDateTime getDate_and_time() {
		return date_and_time;
	}

	public void setDate_and_time(LocalDateTime date_and_time) {
		this.date_and_time = date_and_time;
	}

	public double getTotal_price() {
		return total_price;
	}

	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}

	public String getCustomer_email() {
		return customer_email;
	}

	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}

	public String getPayment_mode() {
		return payment_mode;
	}

	public void setPayment_mode(String payment_mode) {
		this.payment_mode = payment_mode;
	}

	public String getPayment_status() {
		return payment_status;
	}

	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}
	
	public String getOrder_status() {
	    return order_status;
	}

	public void setOrder_status(String order_status) {
	    this.order_status = order_status;
	}

    
}
