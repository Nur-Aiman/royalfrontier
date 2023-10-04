/*
 * Online DB : OK
 */

package com.restaurant_management_system.controller;

import com.restaurant_management_system.beans.Contact;
import com.restaurant_management_system.model.ContactUsDB;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
///import java.time.LocalDateTime; 

public class ContactUs extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ContactUs() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/jsp/contactUs.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		
		 // Check if the phone number starts with "0" and add "6" in front
	    if (phone.startsWith("0")) {
	        phone = "6" + phone;
	    }

		DateTimeFormatter date = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		String now = date.format(LocalDateTime.now());
		LocalDateTime dateTime = LocalDateTime.parse(now, date);

		Contact contact = new Contact();
		contact.setName(name);
		contact.setEmail(email);
		contact.setPhone(phone);
		contact.setSubject(subject);
		contact.setMessage(message);
		contact.setDate(dateTime);

		ContactUsDB contactUsDB = new ContactUsDB();
		String result = contactUsDB.messageContact(contact);
		
		 // Call the sendToWebhook method to send data to the webhook URL
	    sendToWebhook(name, email, phone, subject, message, now);

		request.getSession().setAttribute("result", result);

		response.sendRedirect("jsp/ContactUs.jsp");
	}
	private void sendToWebhook(String name, String email, String phone, String subject, String message, String dateTime) {
	    try {
	        // Replace this URL with your actual webhook URL
	        String webhookUrl = "https://connect.pabbly.com/workflow/sendwebhookdata/IjU3NjUwNTZmMDYzZTA0MzU1MjZjNTUzNzUxM2Ei_pc";
	        
	        URL url = new URL(webhookUrl);
	        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	        
	        // Set the request method to POST
	        connection.setRequestMethod("POST");
	        connection.setDoOutput(true);
	        
	        // Construct the JSON payload
	        String jsonPayload = "{\"name\":\"" + name + "\",\"email\":\"" + email + "\",\"phone\":\"" + phone + "\",\"subject\":\"" + subject + "\",\"message\":\"" + message + "\"}";
	        
	        // Write the payload to the request
	        try (OutputStream os = connection.getOutputStream()) {
	            byte[] input = jsonPayload.getBytes("utf-8");
	            os.write(input, 0, input.length);
	        }
	        
	        // Get the response from the webhook (optional)
	        int responseCode = connection.getResponseCode();
	        if (responseCode == HttpURLConnection.HTTP_OK) {
	            // Successfully sent data to the webhook
	            System.out.println("Webhook request successful.");
	        } else {
	            // Failed to send data to the webhook
	            System.err.println("Webhook request failed. Response code: " + responseCode);
	        }
	        
	        connection.disconnect();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

}


