package com.restaurant_management_system.beans;
import java.sql.Timestamp;
public class Reservation {
private String name;
private String email;
private Timestamp dateAndTime;
private int numberOfPax;
private String specialRequest;
public Reservation() {}
public Reservation(String name, String email, Timestamp dateAndTime, int numberOfPax, String specialRequest) {
this.name = name;
this.email = email;
this.dateAndTime = dateAndTime;
this.numberOfPax = numberOfPax;
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
	public int getNumberOfPax() {
		return numberOfPax;
	}
	public void setNumberOfPax(int numberOfPax) {
		this.numberOfPax = numberOfPax;
	}
	public String getSpecialRequest() {
		return specialRequest;
	}
	public void setSpecialRequest(String specialRequest) {
		this.specialRequest = specialRequest;
	}
}

