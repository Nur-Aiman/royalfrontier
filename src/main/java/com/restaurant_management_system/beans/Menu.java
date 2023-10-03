package com.restaurant_management_system.beans;

public class Menu {

    private int id;
    private String menu;
    private double price;
    private String imageURL;
    private String description;
    private String availability;

    public Menu() {}

    public Menu(int id, String menuName, double price, String imageURL, String availability, String description) {
        // Initialize the instance variables with the provided values
        this.id = id;
        this.menu = menuName;
        this.price = price;
        this.imageURL = imageURL;
        this.availability = availability;
        this.description = description;
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
    
    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }
}
