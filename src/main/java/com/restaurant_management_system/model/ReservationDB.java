package com.restaurant_management_system.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.restaurant_management_system.beans.Reservation;


public class ReservationDB {
	
    public String insertReservation(Reservation reservation) {
        myDatabase db = new myDatabase();
        Connection con = db.getCon();
        String status = null;
        System.out.println("masuk sini 2");
        try {
        	String query = "INSERT INTO reservation (name, email, date_and_time, number_of_pax, special_request) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query);

            pst.setString(1, reservation.getName());
            pst.setString(2, reservation.getEmail());
            pst.setTimestamp(3, reservation.getDateAndTime());
            pst.setInt(4, reservation.getNumberOfPax());
            pst.setString(5, reservation.getSpecialRequest());

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
}


