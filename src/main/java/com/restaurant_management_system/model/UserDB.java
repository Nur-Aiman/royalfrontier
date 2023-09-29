package com.restaurant_management_system.model;

import java.sql.Connection;
import java.sql.Statement;

import com.restaurant_management_system.beans.user;

import java.sql.SQLException;

public class UserDB {
    
    String s1 = null;

    public String insertUser(user rb) {
        myDatabase db = new myDatabase();
        Connection con = db.getCon();
        try {
            Statement stat = con.createStatement();
            stat.executeUpdate("INSERT INTO `user`(name, email, password) VALUES('" + rb.getName() + "','" + rb.getEmail()
                    + "','" + rb.getPassword() + "')");
            s1 = "Data Insert Successfully";
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return s1;
    }
}

