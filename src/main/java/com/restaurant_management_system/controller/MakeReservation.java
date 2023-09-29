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
        Timestamp dateAndTime = Timestamp.valueOf(request.getParameter("dateAndTime"));
        int numberOfPax = Integer.parseInt(request.getParameter("numberOfPax"));
        String specialRequest = request.getParameter("specialRequest");

        Reservation reservationBean = new Reservation(name, email, dateAndTime, numberOfPax, specialRequest);
        
        ReservationDB reservationDB = new ReservationDB();
        String status = reservationDB.insertReservation(reservationBean);

        request.setAttribute("reservationStatus", status);
//        request.getRequestDispatcher("jsp/reservationConfirmation.jsp").forward(request, response);
    }
}
