package com.restaurant_management_system.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class myDatabase {
    Connection con = null;

    public Connection getCon() {
        
        try {
           
            Class.forName("org.postgresql.Driver");
            
            
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/restaurant_management_system", "postgres", "1234");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
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
