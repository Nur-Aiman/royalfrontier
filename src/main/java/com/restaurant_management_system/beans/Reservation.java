package com.restaurant_management_system.beans;
import java.sql.Timestamp;


public class Reservation {
    private String name;
    private String email;
    private String phoneNumber; 
    private Timestamp dateAndTime;
    private int tableNumber;    
    private String specialRequest;


public Reservation() {}

public Reservation(String name, String email, String phoneNumber, Timestamp dateAndTime, 
        int tableNumber, String specialRequest) {
this.name = name;
this.email = email;
this.phoneNumber = phoneNumber; 
this.dateAndTime = dateAndTime;
this.tableNumber = tableNumber; 
this.specialRequest = specialRequest;
}



	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getDateAndTime() {
		return dateAndTime;
	}
	public void setDateAndTime(Timestamp dateAndTime) {
		this.dateAndTime = dateAndTime;
	}
	
	public String getSpecialRequest() {
		return specialRequest;
	}
	public void setSpecialRequest(String specialRequest) {
		this.specialRequest = specialRequest;
	}
	 public String getPhoneNumber() {
	        return phoneNumber;
	    }

	    public void setPhoneNumber(String phoneNumber) {
	        this.phoneNumber = phoneNumber;
	    }

	    public int getTableNumber() {
	        return tableNumber;
	    }

	    public void setTableNumber(int tableNumber) {
	        this.tableNumber = tableNumber;
	    }
}

