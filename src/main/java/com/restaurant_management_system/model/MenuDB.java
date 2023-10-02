package com.restaurant_management_system.model;

import com.restaurant_management_system.beans.Menu;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MenuDB {

    public List<Menu> getAllMenus() {
        List<Menu> menuList = new ArrayList<>();
        myDatabase db = new myDatabase();
        Connection con = db.getCon();

        try {
            String query = "SELECT * FROM menu";
            System.out.println(query);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                Menu menu = new Menu(
                    rs.getInt("id"),
                    rs.getString("menu"),
                    rs.getDouble("price"),
                    rs.getString("description"),
                    rs.getString("availability") 
                );
                menuList.add(menu);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(con);
        }

        return menuList;
    }
    
    public String insertMenu(Menu menu) {
    	myDatabase db = new myDatabase();
        Connection con = db.getCon();
       

        try {
            String query = "INSERT INTO menu (menu, price, description, availability) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setString(1, menu.getMenu());
            pstmt.setDouble(2, menu.getPrice());
            pstmt.setString(3, menu.getDescription());
            pstmt.setString(4, menu.getAvailability());

            pstmt.executeUpdate();

            return "Menu added successfully!";
        } catch (Exception e) {
            e.printStackTrace();
            return "Error in adding menu.";
        } finally {
            db.closeConnection(con);
        }
    }
    
    public String updateMenu(Menu menu) {
    	myDatabase db = new myDatabase();
        Connection con = db.getCon();
        try {
        	
            
            String query = "UPDATE menu SET menu=?, price=?, description=?, availability=? WHERE id=?";
            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setString(1, menu.getMenu());
            pstmt.setDouble(2, menu.getPrice());
            pstmt.setString(3, menu.getDescription());
            pstmt.setString(4, menu.getAvailability());
            pstmt.setInt(5, menu.getId());

            int updatedRows = pstmt.executeUpdate();
            if (updatedRows > 0) {
                return "Menu updated successfully!";
            } else {
                return "Menu not found!";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "Error updating menu.";
        } finally {
            db.closeConnection(con);
        }
    }
    
    public String setMenuUnavailableById(int id) {
        myDatabase db = new myDatabase();
        Connection con = db.getCon();
        try {
            String query = "UPDATE menu SET availability = 'unavailable' WHERE id = ? AND availability = 'available'";
            PreparedStatement pstmt = con.prepareStatement(query);
            
            pstmt.setInt(1, id);  // Set the 'id' to the prepared statement
            
            int updatedRows = pstmt.executeUpdate();

            if (updatedRows > 0) {
                return "Menu with ID " + id + " set to unavailable successfully!";
            } else {
                return "Menu with ID " + id + " was not available or does not exist!";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "Error updating menu with ID " + id + " to unavailable.";
        } finally {
            db.closeConnection(con);  // Ensure the connection is closed after the operation
        }
    }


    
    
}
