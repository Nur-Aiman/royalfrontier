package com.restaurant_management_system.controller;

import com.google.gson.JsonObject;
import com.restaurant_management_system.model.TableDB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GetAvailableTime extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String date = request.getParameter("date");
        
        // Fetching data from database
        TableDB tableDB = new TableDB();
        String availableTime = tableDB.getAvailableTimeByTableIdAndDate(1, date); // Assuming table_id as 1 for this example

        // Create a JSON object using Gson
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("availableTime", availableTime);

        // Set the response content type and write the JSON response
        response.setContentType("application/json");
        response.getWriter().write(jsonResponse.toString());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
