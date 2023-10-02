/*
 * Online DB : OK
 */

package com.restaurant_management_system.controller;

import com.restaurant_management_system.model.UserDB;
import com.restaurant_management_system.beans.user;
import com.restaurant_management_system.model.myDatabase;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
    }
    
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		out.println("Welcome to first servlet");
		
		Connection con;
		Statement stmt;
		ResultSet rs;
		String query = "select * from \"user\"";
		ArrayList<user> userlist = new ArrayList<user>();
		
		myDatabase db = new myDatabase();
		try {
			con = db.getCon();
			if(con==null) {
				out.println("Failed with connection" + con);
			} else {
				out.println("Successful with connection" + con);
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
				while(rs.next()) {
					user user = new user();
					user.setName(rs.getString("name"));
					user.setEmail(rs.getString("email"));
					user.setPassword(rs.getString("password"));
					user.setPhone(rs.getString("phone"));

					userlist.add(user);
				}
				request.setAttribute("UserData", userlist);
				request.getRequestDispatcher("jsp/UserList.jsp").forward(request, response);
			}
			
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");

		 // Check if the phone number starts with "0" and add "6" in front
	    if (phone.startsWith("0")) {
	        phone = "6" + phone;
	    }
	    
		user rb = new user();
		rb.setName(name);
		rb.setEmail(email);
		rb.setPassword(password);
		rb.setPhone(phone);

		
		
		UserDB ud = new UserDB();
		String s1 = ud.insertUser(rb);
		
		System.out.println(s1);
		
		 // Send data to the webhook
	    sendToWebhook(name, email, password, phone);
		// out.println(name);
		// out.println(email);
		// out.println(password);
		request.setAttribute("name", name);
//		request.getRequestDispatcher("jsp/Welcome.jsp").forward(request, response);
		response.sendRedirect("jsp/Login.jsp");
	}
	private void sendToWebhook(String name, String email, String password, String phone) {
	    try {
	        // Replace this URL with your actual webhook URL
	        String webhookUrl = "https://connect.pabbly.com/workflow/sendwebhookdata/IjU3NjUwNTZmMDYzMTA0MzM1MjZkNTUzNDUxMzMi_pc";
	        
	        URL url = new URL(webhookUrl);
	        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	        
	        // Set the request method to POST
	        connection.setRequestMethod("POST");
	        connection.setDoOutput(true);
	        
	        // Construct the JSON payload
	        String jsonPayload = "{\"name\":\"" + name + "\",\"email\":\"" + email + "\",\"password\":\"" + password + "\",\"phone\":\"" + phone + "\"}";
	        
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
