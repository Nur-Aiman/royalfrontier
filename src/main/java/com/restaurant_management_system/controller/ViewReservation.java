package com.restaurant_management_system.controller;

import com.restaurant_management_system.beans.Reservation;
import com.restaurant_management_system.model.ReservationDB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.google.gson.Gson;
import java.util.List;

/**
 * Servlet implementation class ViewReservation
 */

public class ViewReservation extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ReservationDB reservationDB = new ReservationDB();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewReservation() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Reservation> reservations = reservationDB.getAllReservations();
        
        // Convert list of reservations to JSON
        String json = new Gson().toJson(reservations);

        // Set response type to application/json
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
