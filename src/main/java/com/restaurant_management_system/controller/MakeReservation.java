package com.restaurant_management_system.controller;

import com.restaurant_management_system.beans.Reservation;
import com.restaurant_management_system.model.ReservationDB;
import com.restaurant_management_system.model.TableDB;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

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
        
     // Ensure phone number starts with 6
        if (!phoneNumber.startsWith("6")) {
            phoneNumber = "6" + phoneNumber;
        }

        String reservationDateStr = request.getParameter("reservationDate");
        String reservationTimeStr = request.getParameter("reservationTime");

        Timestamp dateAndTime = null;
        if (reservationDateStr != null && !reservationDateStr.isEmpty() && reservationTimeStr != null && !reservationTimeStr.isEmpty()) {
            String combinedDateAndTimeStr = reservationDateStr + " " + reservationTimeStr + ":00";
            dateAndTime = Timestamp.valueOf(combinedDateAndTimeStr);
        }

        String[] tableNumbersStr = request.getParameterValues("tableNumber");  

        String specialRequest = request.getParameter("specialRequest");

        ReservationDB reservationDB = new ReservationDB();
        TableDB tableDB = new TableDB();
        
        String status = null;
        for (String tableNumberStr : tableNumbersStr) {
            int tableNumber = Integer.parseInt(tableNumberStr);
            
            // Create reservationBean for each table and insert into the database
            Reservation reservationBean = new Reservation(name, email, phoneNumber, dateAndTime, tableNumber, specialRequest);
            status = reservationDB.insertReservation(reservationBean);

            // Update the `table` availability
            String extractedReservationDate = dateAndTime.toLocalDateTime().toLocalDate().toString();
            String extractedReservationTime = String.format("%02d", dateAndTime.toLocalDateTime().getHour());
            String availableTimes = tableDB.getAvailableTimeByTableIdAndDate(tableNumber, extractedReservationDate);

            if (availableTimes == null) {
                String allTimes = "08,10,12,14,16,18,20,22";
                for (int i = 1; i <= 19; i++) { // Loop through all tables
                    String timesForThisTable = allTimes;
                    if (i == tableNumber) { // If it's the table being reserved, remove the time slot
                        timesForThisTable = timesForThisTable.replace(extractedReservationTime, "").replace(",,", ",").replaceAll(",$", "").replaceAll("^,", "");
                    }
                    tableDB.insertNewTableDate(i, extractedReservationDate, timesForThisTable);
                }
            } else if (availableTimes.contains(extractedReservationTime)) {
                availableTimes = availableTimes.replace(extractedReservationTime, "").replace(",,", ",").replaceAll(",$", "").replaceAll("^,", "");
                tableDB.updateAvailableTimeByTableIdAndDate(tableNumber, extractedReservationDate, availableTimes);
            }
        }

        request.getSession().setAttribute("reservationStatus", status);
        response.sendRedirect("/royalfrontier/jsp/Reservation.jsp");
    }
}
