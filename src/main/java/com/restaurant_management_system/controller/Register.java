/*
 * Online DB : OK
 */

package com.restaurant_management_system.controller;

import com.google.gson.Gson;
import com.restaurant_management_system.beans.user;
import com.restaurant_management_system.model.UserDB;
import com.restaurant_management_system.model.myDatabase;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Register extends HttpServlet {
    // Your existing code here...



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phoneNumber = request.getParameter("phone"); // Assuming the parameter name is "phone"

        // Check if the phone number starts with "0" and add "6" if needed
        if (phoneNumber != null && phoneNumber.startsWith("0")) {
            phoneNumber = "6" + phoneNumber;
        }

        user rb = new user();
        rb.setName(name);
        rb.setEmail(email);
        rb.setPassword(password);
        rb.setPhone(phoneNumber);
        
        // Delay for 1 second (1000 milliseconds)
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        // Send data to the webhook
        sendToWebhook(name, email, password, phoneNumber);

        // Redirect to a different page or perform other actions as needed
        response.sendRedirect("/royalfrontier/jsp/Login.jsp");
    }

    // Method to send data to the webhook
    private void sendToWebhook(String name, String email, String password, String phone) {
        try {
            String webhookUrl = "https://connect.pabbly.com/workflow/sendwebhookdata/IjU3NjUwNTZmMDYzMTA0MzM1MjZkNTUzNDUxMzMi_pc";

            // Create a JSON payload with the user data
            Map<String, String> userData = new HashMap<>();
            userData.put("name", name);
            userData.put("email", email);
            userData.put("password", password);
            userData.put("phone", phone); // Include the phone number in the payload

            // Convert the data to JSON format
            String jsonPayload = new Gson().toJson(userData);

            // Create a URL object and open a connection
            URL url = new URL(webhookUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // Set the HTTP method to POST
            connection.setRequestMethod("POST");

            // Set headers if needed (e.g., content type)
            connection.setRequestProperty("Content-Type", "application/json");

            // Enable input/output streams for sending data
            connection.setDoOutput(true);

            // Write the JSON data to the output stream
            try (PrintWriter out = new PrintWriter(connection.getOutputStream())) {
                out.print(jsonPayload);
                out.flush();
            }

            // Get the HTTP response code (you can handle the response as needed)
            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                // Request was successful
                System.out.println("Data sent to the webhook successfully.");
            } else {
                // Request failed
                System.out.println("Failed to send data to the webhook. Response code: " + responseCode);
            }

            // Close the connection
            connection.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
