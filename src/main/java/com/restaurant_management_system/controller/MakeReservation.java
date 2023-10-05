package com.restaurant_management_system.controller;

import java.io.IOException;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.restaurant_management_system.beans.Reservation;
import com.restaurant_management_system.model.ReservationDB;
import com.restaurant_management_system.model.TableDB;

public class MakeReservation extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MakeReservation() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Reservation service is post-only.");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetching form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");

        // Handling reservationDate and reservationTime separately
        String reservationDateStr = request.getParameter("reservationDate");
        String reservationTimeStr = request.getParameter("reservationTime");

        Timestamp dateAndTime = null;
        if (reservationDateStr != null && !reservationDateStr.isEmpty() && reservationTimeStr != null && !reservationTimeStr.isEmpty()) {
            String combinedDateAndTimeStr = reservationDateStr + " " + reservationTimeStr ;
            System.out.println("Combined Date-Time String: " + combinedDateAndTimeStr);

            try {
                dateAndTime = Timestamp.valueOf(combinedDateAndTimeStr);
            } catch (IllegalArgumentException e) {
                response.getWriter().append("Invalid date and time format.");
                return;
            }
        }

        // Handling tableNumber
        String tableNumberStr = request.getParameter("tableNumber");
        int tableNumber = 0;
        if (tableNumberStr != null && !tableNumberStr.isEmpty()) {
            try {
                tableNumber = Integer.parseInt(tableNumberStr);
            } catch (NumberFormatException e) {
                response.getWriter().append("Invalid table number format.");
                return;
            }
        }

        String specialRequest = request.getParameter("specialRequest");

        // Creating reservationBean with the fetched data
        Reservation reservationBean = new Reservation(name, email, phoneNumber, dateAndTime, tableNumber, specialRequest);

        // Save to database
        ReservationDB reservationDB = new ReservationDB();
        String status = reservationDB.insertReservation(reservationBean);

        // Check and update the `table` table for availability
        TableDB tableDB = new TableDB();

        String extractedReservationDate = dateAndTime.toLocalDateTime().toLocalDate().toString();
        String extractedReservationTime = String.format("%02d", dateAndTime.toLocalDateTime().getHour());

        System.out.println("Extracted Date: " + extractedReservationDate);
        System.out.println("Extracted Time: " + extractedReservationTime);

        String availableTimes = tableDB.getAvailableTimeByTableIdAndDate(tableNumber, extractedReservationDate);

        if (availableTimes == null) {
            String allTimes = "08,10,12,14,16,18,20,22";
            allTimes = allTimes.replace(extractedReservationTime, "").replace(",,", ",").replaceAll(",$", "").replaceAll("^,", "");
            tableDB.insertNewTableDate(tableNumber, extractedReservationDate, allTimes);
        } else if (availableTimes.contains(extractedReservationTime)) {
            availableTimes = availableTimes.replace(extractedReservationTime, "").replace(",,", ",").replaceAll(",$", "").replaceAll("^,", "");
            tableDB.updateAvailableTimeByTableIdAndDate(tableNumber, extractedReservationDate, availableTimes);
        }

        request.getSession().setAttribute("reservationStatus", status);
        response.sendRedirect("/royalfrontier/jsp/Reservation.jsp"); 
    }
}
