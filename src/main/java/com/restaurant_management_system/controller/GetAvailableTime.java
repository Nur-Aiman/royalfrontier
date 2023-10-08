package com.restaurant_management_system.controller;

import com.google.gson.JsonObject;
import com.restaurant_management_system.model.TableDB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GetAvailableTime extends HttpServlet {

    private static final String ALL_TIMES = "08,10,12,14,16,18,20,22";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String date = request.getParameter("date");

        // Fetching data from database
        TableDB tableDB = new TableDB();
        List<String> allAvailableTimesForDate = tableDB.getAllAvailableTimesForDate(date);

        String finalAvailableTime;

        // Check if the list is empty
        if(allAvailableTimesForDate.isEmpty()) {
            finalAvailableTime = ALL_TIMES;
        } else {
            finalAvailableTime = computeFinalAvailableTime(allAvailableTimesForDate);
        }

        // Create a JSON object using Gson
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("availableTime", finalAvailableTime);

        // Set the response content type and write the JSON response
        response.setContentType("application/json");
        response.getWriter().write(jsonResponse.toString());
    }


    private String computeFinalAvailableTime(List<String> allAvailableTimesForDate) {
        String[] times = ALL_TIMES.split(",");
        StringBuilder finalAvailableTime = new StringBuilder();

        // Create a map to keep track of the count of tables that are NOT available for each time slot
        Map<String, Integer> timeCountMap = new HashMap<>();

        // Initialize the map with each time as key and count as 0
        for (String time : times) {
            timeCountMap.put(time, 0);
        }

        // Increase the count based on the times that are missing in the database
        for (String availableTime : allAvailableTimesForDate) {
            for (String time : times) {
                if (!availableTime.contains(time)) {
                    timeCountMap.put(time, timeCountMap.get(time) + 1);
                }
            }
        }

        // Check each time slot, and if the count of missing slots is less than 19, consider it as available
        for (String time : times) {
            if (timeCountMap.get(time) < 19) { 
                finalAvailableTime.append(time).append(",");
            }
        }

        // Remove the trailing comma
        if (finalAvailableTime.length() > 0) {
            finalAvailableTime.deleteCharAt(finalAvailableTime.length() - 1);
        }
        return finalAvailableTime.toString();
    }





    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
