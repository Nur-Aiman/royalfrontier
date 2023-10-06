package com.restaurant_management_system.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class TableDB {
	
	public boolean doesDateExist(String date) {
	    boolean dateExists = false;
	    myDatabase db = new myDatabase();
	    Connection con = db.getCon();
	    try {
	        String query = "SELECT 1 FROM `table` WHERE date = ? LIMIT 1";
	        PreparedStatement pst = con.prepareStatement(query);
	        pst.setString(1, date);
	        ResultSet rs = pst.executeQuery();
	        if (rs.next()) {
	            dateExists = true;
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        db.closeConnection(con);
	    }
	    return dateExists;
	}

	
	public String getAvailableTimeByTableIdAndDate(int table_id, String date) {
	    System.out.println("Fetching available times for Table ID: " + table_id + " Date: " + date);
	    myDatabase db = new myDatabase();
	    Connection con = db.getCon();
	    String available_time = null;
	    try {
	        String query = "SELECT available_time FROM `table` WHERE table_id = ? AND date = ?";
	        PreparedStatement pst = con.prepareStatement(query);
	        pst.setInt(1, table_id);
	        pst.setString(2, date);
	        ResultSet rs = pst.executeQuery();
	        if (rs.next()) {
	            available_time = rs.getString("available_time");
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        db.closeConnection(con);
	    }
	    return available_time;
	}


	public List<String> getAllAvailableTimesForDate(String date) {
        List<String> availableTimesList = new ArrayList<>();
        
        myDatabase db = new myDatabase();
        Connection con = db.getCon();
        
        try {
            String query = "SELECT available_time FROM `table` WHERE date = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, date);
            
            ResultSet rs = pst.executeQuery();
            
            while (rs.next()) {
                availableTimesList.add(rs.getString("available_time"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            db.closeConnection(con);
        }
        return availableTimesList;
    }

    
    public void insertNewTableDate(int table_id, String date, String availableTimes) {
    	System.out.println("Inserting new date for Table ID: " + table_id + " Date: " + date);

    	myDatabase db = new myDatabase();
        Connection con = db.getCon();
        try {
            String query = "INSERT INTO `table` (table_id, date, available_time) VALUES (?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, table_id);
            pst.setString(2, date);
            pst.setString(3, availableTimes);
            pst.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            db.closeConnection(con);
        }
    }


    public void updateAvailableTimeByTableIdAndDate(int table_id, String date, String newAvailableTime) {
    	System.out.println("Updating available times for Table ID: " + table_id + " Date: " + date);

    	myDatabase db = new myDatabase();
        Connection con = db.getCon();
        try {
            String query = "UPDATE `table` SET available_time = ? WHERE table_id = ? AND date = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, newAvailableTime);
            pst.setInt(2, table_id);
            pst.setString(3, date);

            pst.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            db.closeConnection(con);
        }
    }
    
    public List<Integer> getAvailableTablesForDateTime(String date, String time) {
        List<Integer> availableTables = new ArrayList<>();
        
        myDatabase db = new myDatabase();
        Connection con = db.getCon();

        
        String formattedTime = time.substring(0, 2);
        
        try {
            String query = "SELECT table_id FROM `table` WHERE date = ? AND available_time LIKE ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, date);
            pst.setString(2, "%" + formattedTime + "%");             
            ResultSet rs = pst.executeQuery();
            
            while (rs.next()) {
                availableTables.add(rs.getInt("table_id"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            db.closeConnection(con);
        }
        return availableTables;
    }

    
    

    
    
    
}
