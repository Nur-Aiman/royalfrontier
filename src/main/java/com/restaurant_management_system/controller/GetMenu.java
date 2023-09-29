package com.restaurant_management_system.controller;
import com.google.gson.Gson;
import com.restaurant_management_system.beans.Menu;
import com.restaurant_management_system.model.MenuDB;

import javax.servlet.RequestDispatcher;
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

        // Convert the list of menus to JSON
        Gson gson = new Gson();
        String jsonMenus = gson.toJson(menus);

        // Set the content type to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonMenus);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
