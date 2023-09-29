package com.restaurant_management_system.beans;

public class Menu {

    private int id;
    private String menu;
    private double price;

    public Menu() {}

    public Menu(int id, String menu, double price) {
        this.id = id;
        this.menu = menu;
        this.price = price;
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
}
