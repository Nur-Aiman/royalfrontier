package com.restaurant_management_system.controller;

import com.restaurant_management_system.beans.Menu;
import com.restaurant_management_system.model.MenuDB;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class GetMenu
 */
public class GetMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetMenu() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    MenuDB menuDB = new MenuDB();
	    List<Menu> menus = menuDB.getAllMenus();

	    // Convert menus to JSON format
	    StringBuilder jsonResponse = new StringBuilder("[");
	    for (int i = 0; i < menus.size(); i++) {
	        Menu menu = menus.get(i);
	        jsonResponse.append("{");
	        jsonResponse.append("\"id\": ").append(menu.getId()).append(",");
	        jsonResponse.append("\"menu\": \"").append(menu.getMenu()).append("\",");
	        jsonResponse.append("\"price\": ").append(menu.getPrice());
	        jsonResponse.append("}");
	        
	        if (i < menus.size() - 1) {  // Not the last item
	            jsonResponse.append(",");
	        }
	    }
	    jsonResponse.append("]");

	    // Set response type and write the JSON response
	    response.setContentType("application/json");
	    response.getWriter().write(jsonResponse.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
