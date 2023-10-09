

package com.restaurant_management_system.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.restaurant_management_system.model.myDatabase;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		myDatabase db = new myDatabase(); 
		Connection con = db.getCon();
		
		try {
			PreparedStatement pst = con.prepareStatement("SELECT email, password, roles FROM `user` WHERE email = ? AND password = ?");
			pst.setString(1, email);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();
		    if (rs.next()) {
		        session.setAttribute("email", rs.getString("email"));
		        session.setAttribute("password", rs.getString("password"));
		        
		        int userRole = rs.getInt("roles"); // Assuming 'role' is an integer in the database

		        if (userRole == 0) {
		            // User role is 0, redirect to GetMenu.jsp
		            dispatcher = request.getRequestDispatcher("jsp/GetMenu.jsp");
		        } else if (userRole == 1) {
		            // User role is 1, redirect to EditMenu.jsp
		            dispatcher = request.getRequestDispatcher("jsp/EditMenu.jsp");
		        } else if (userRole == 2) {
		            // User role is 2, redirect to OrderStatus.jsp
		            dispatcher = request.getRequestDispatcher("jsp/OrderStatus.jsp");
		        }

		        dispatcher.forward(request, response); // Forward to the appropriate page
		    } else {
		        session.setAttribute("loginStatus", "Login failed. Wrong email or password.");
		        response.sendRedirect("jsp/Login.jsp"); // Redirect if login fails
		    }

		} catch (Exception ex) {
		    ex.printStackTrace();
		}

	}
}
