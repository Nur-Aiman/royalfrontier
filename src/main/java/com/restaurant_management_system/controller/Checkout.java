package com.restaurant_management_system.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.List;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/Checkout")
public class Checkout extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the tableNumber from the request or session, depending on where you store it
        String tableNumber = request.getParameter("tableNumber"); // Assuming it's passed as a parameter

        if (tableNumber != null) {
            // Set the tableNumber as an attribute in the request (you can also use the session)
            request.setAttribute("tableNumber", tableNumber);
            

            // Forward the request to the JSP page
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/Checkout.jsp");
            dispatcher.forward(request, response);
        } else {
            // Handle the case when the tableNumber is not available
            // You can redirect to an error page or take appropriate action here
            response.sendRedirect("/error.jsp");
        }
    }

    // You can also implement doPost if needed for handling form submissions
    // protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    //     // Handle POST request if necessary
    // }
}
