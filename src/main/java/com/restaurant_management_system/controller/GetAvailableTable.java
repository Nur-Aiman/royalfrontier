package com.restaurant_management_system.controller;

import com.google.gson.JsonArray;
import com.restaurant_management_system.model.TableDB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class GetAvailableTable extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String date = request.getParameter("date");
	    String time = request.getParameter("time");

	    // Fetching data from database
	    TableDB tableDB = new TableDB();
	    
	    // Check if date exists
	    boolean dateExists = tableDB.doesDateExist(date);
	    List<Integer> availableTables;
	    
	    if (!dateExists) {
	        // If the date does not exist in the database, all tables are available
	        availableTables = new ArrayList<>();
	        for (int i = 1; i <= 19; i++) {
	            availableTables.add(i);
	        }
	    } else {
	        availableTables = tableDB.getAvailableTablesForDateTime(date, time);
	    }

	    // Create a JSON array using Gson
	    JsonArray jsonArray = new JsonArray();
	    for (Integer tableId : availableTables) {
	        jsonArray.add(tableId);
	    }

	    // Set the response content type and write the JSON response
	    response.setContentType("application/json");
	    response.getWriter().write(jsonArray.toString());
	}
}

