package com.restaurant_management_system.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TableDB {

    public String getAvailableTimeByTableIdAndDate(int table_id, String date) {
    	System.out.println("Checking/Inserting for Table ID: " + table_id + " Date: " + date);

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
}
