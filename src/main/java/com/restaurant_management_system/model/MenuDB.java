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
                    rs.getString("imageURL"),
                    rs.getString("availability"),
                    rs.getString("description")
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
            String query = "INSERT INTO menu (menu, price, description, availability,imageURL) VALUES (?,?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setString(1, menu.getMenu());
            pstmt.setDouble(2, menu.getPrice());
            pstmt.setString(3, menu.getDescription());
            pstmt.setString(4, menu.getAvailability());
            pstmt.setString(5, menu.getImageURL());

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
            String query = "UPDATE menu SET menu=?, price=?,  availability=? WHERE id=?";
            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setString(1, menu.getMenu());
            pstmt.setDouble(2, menu.getPrice());
            pstmt.setString(3, menu.getAvailability());
            pstmt.setInt(4, menu.getId());

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
            
            pstmt.setInt(1, id);  
            
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
            db.closeConnection(con);  
        }
    }
    public boolean deleteMenu(int id) {
        myDatabase db = new myDatabase();
        Connection con = db.getCon();

        try {
            // Prepare the SQL query to delete the menu item by menuId
            String query = "DELETE FROM menu WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);

            // Set the menuId parameter in the query
            pstmt.setInt(1, id);

            // Execute the SQL query to delete the menu item
            int deletedRows = pstmt.executeUpdate();

            // Check if any rows were deleted (i.e., deletion was successful)
            if (deletedRows > 0) {
                return true;
            } else {
                return false; // Menu with the specified menuId was not found or not deleted
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false; // Error occurred while deleting the menu item
        } finally {
            db.closeConnection(con);
        }
    }



    
    
}
