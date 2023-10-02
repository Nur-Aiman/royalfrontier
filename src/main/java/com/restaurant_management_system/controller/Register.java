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

		
		user rb = new user();
		rb.setName(name);
		rb.setEmail(email);
		rb.setPassword(password);
		rb.setPhone(phone);

		
		UserDB ud = new UserDB();
		String s1 = ud.insertUser(rb);
		
		System.out.println(s1);
		// out.println(name);
		// out.println(email);
		// out.println(password);
		request.setAttribute("name", name);
//		request.getRequestDispatcher("jsp/Welcome.jsp").forward(request, response);
		response.sendRedirect("/royalfrontier/jsp/login.jsp");
	}
}
