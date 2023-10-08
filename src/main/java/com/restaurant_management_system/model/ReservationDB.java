package com.restaurant_management_system.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.restaurant_management_system.beans.Reservation;


public class ReservationDB {
	
    public String insertReservation(Reservation reservation) {
        myDatabase db = new myDatabase();
        Connection con = db.getCon();
        String status = null;
        System.out.println("masuk sini 2");
        try {
        	String query = "INSERT INTO reservation (name, email, phone_number, date_and_time, table_number, special_request) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query);

            pst.setString(1, reservation.getName());
            pst.setString(2, reservation.getEmail());
            pst.setString(3, reservation.getPhoneNumber());  
            pst.setTimestamp(4, reservation.getDateAndTime());
            pst.setInt(5, reservation.getTableNumber());      
            pst.setString(6, reservation.getSpecialRequest());
            int result = pst.executeUpdate();
            if (result > 0) {
                status = "Reservation Inserted Successfully";
            } else {
                status = "Reservation Insertion Failed";
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            db.closeConnection(con);
            System.out.println("masuk sini 3");
        }
        return status;
    }
    


 // Inside ReservationDB class

    public List<Reservation> getAllReservations() {
        myDatabase db = new myDatabase();
        Connection con = db.getCon();
        List<Reservation> reservations = new ArrayList<>();
        try {
            String query = "SELECT * FROM reservation";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Reservation reservation = new Reservation();
                reservation.setName(rs.getString("name"));
                reservation.setEmail(rs.getString("email"));
                reservation.setPhoneNumber(rs.getString("phone_number"));
                reservation.setDateAndTime(rs.getTimestamp("date_and_time"));
                reservation.setTableNumber(rs.getInt("table_number"));
                reservation.setSpecialRequest(rs.getString("special_request"));
                reservations.add(reservation);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            db.closeConnection(con);
        }
        return reservations;
    }


}


