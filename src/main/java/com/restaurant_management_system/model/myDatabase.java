package com.restaurant_management_system.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class myDatabase {
    Connection con = null;

    public Connection getCon() {
        try {
         
            Class.forName("com.mysql.cj.jdbc.Driver");
        
         
            con = DriverManager.getConnection("jdbc:mysql://ns87.netcfm.com/xifuhali_royalfrontier", "xifuhali_royalfrontier", "Admin123");
        } catch (ClassNotFoundException ex) {
            System.err.println("Error: Unable to load MySQL driver.");
            ex.printStackTrace();
            return null;
        } catch (SQLException ex) {
            System.err.println("Error: Unable to establish database connection.");
            ex.printStackTrace();
            return null;
        }
        return con;
    }


    public void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
