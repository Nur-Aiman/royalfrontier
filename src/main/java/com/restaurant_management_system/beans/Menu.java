package com.restaurant_management_system.beans;

public class Menu {

    private int id;
    private String menu;
    private double price;
    private String description;
    private String availability;

    public Menu() {}

    public Menu(int id, String menu, double price, String description, String availability) {
        this.id = id;
        this.menu = menu;
        this.price = price;
        this.description = description; 
        this.availability = availability;
    }

 

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAvailability() {
        return availability;
    }

    public void setAvailability(String availability) {
        this.availability = availability;
    }
}
