/*
 * Online DB : OK
*/

package com.restaurant_management_system.controller;

//import com.restaurant_management_system.model.Restaurant;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.restaurant_management_system.beans.Reservation;
//import com.restaurant_management_system.beans.reservation;
import com.restaurant_management_system.model.ReservationDB;

/**
 * Servlet implementation class Reservation
 */
public class MakeReservation extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MakeReservation() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Reservation service is post-only.");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        ///Timestamp dateAndTime = Timestamp.valueOf(request.getParameter("dateAndTime"));
	        
	        String dateAndTimeStr = request.getParameter("dateAndTime");
	        Timestamp dateAndTime = null;
	
	        if (dateAndTimeStr != null && !dateAndTimeStr.isEmpty()) {
	            try {
	                dateAndTime = Timestamp.valueOf(dateAndTimeStr);
	            } catch (IllegalArgumentException e) {
	                // Handle the case when the dateAndTime parameter is in an invalid format
	                // You can log the error, set a default value, or return an error response
	            }
	        }

        ////int numberOfPax = Integer.parseInt(request.getParameter("numberOfPax"));
	        
	        String numberOfPaxStr = request.getParameter("numberOfPax");
	        int numberOfPax = 0; // Default value or another appropriate value if the parameter is missing or invalid

	        if (numberOfPaxStr != null && !numberOfPaxStr.isEmpty()) {
	            try {
	                numberOfPax = Integer.parseInt(numberOfPaxStr);
	            } catch (NumberFormatException e) {
	                // Handle the case when numberOfPax parameter is not a valid integer
	                // You can log the error, set a default value, or return an error response
	            }
	        }
			
	    System.out.println("masuk sini");
        String specialRequest = request.getParameter("specialRequest");

        Reservation reservationBean = new Reservation(name, email, dateAndTime, numberOfPax, specialRequest);
        
        ReservationDB reservationDB = new ReservationDB();
        String status = reservationDB.insertReservation(reservationBean);
        request.getSession().setAttribute("reservationStatus", status);
        response.sendRedirect("/royalfrontier/jsp/Reservation.jsp");  ////tukar project name kpd royalfrontier
}
}


