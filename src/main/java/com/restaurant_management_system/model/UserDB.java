package com.restaurant_management_system.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.restaurant_management_system.beans.user;

public class UserDB {
    
    String resultMessage = null;

    public String insertUser(user rb) {
        myDatabase db = new myDatabase();
        Connection con = db.getCon();
        
       
        String query = "INSERT INTO `user`(name, email, password,phone) VALUES(?, ?, ?, ?)";
        
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, rb.getName());
            pstmt.setString(2, rb.getEmail());
            pstmt.setString(3, rb.getPassword());
            pstmt.setString(4, rb.getPhone());

            pstmt.executeUpdate();
            resultMessage = "Data Inserted Successfully";
        } catch (SQLException ex) {
            ex.printStackTrace();
            resultMessage = "Error in insertion: " + ex.getMessage();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return resultMessage;
    }
}
