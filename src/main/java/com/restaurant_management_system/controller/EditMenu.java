/*
 * Online DB : OK
 */

package com.restaurant_management_system.controller;

import com.restaurant_management_system.beans.Menu;
import com.restaurant_management_system.model.MenuDB;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

public class EditMenu extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public EditMenu() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MenuDB menuDB = new MenuDB();
        HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;

        int id = Integer.parseInt(request.getParameter("menuId")); // Use "menuId" instead of "id"
        String menu = request.getParameter("editName"); // Assuming "editName" is the name of the input field for menu name
        double price = Double.parseDouble(request.getParameter("editPrice")); // Assuming "editPrice" is the name of the input field for price
        String description = request.getParameter("editDescription");

        String availability = request.getParameter("editAvailability"); // Assuming "availability" is still the name of the input field for availability
        String imageURL = request.getParameter("imageURL"); // Assuming "imageURL" is the name of the input field for imageURL

        Menu updatedMenu = new Menu(id, menu, price, description, availability, imageURL);

        String result = menuDB.updateMenu(updatedMenu);

        	if ("Menu updated successfully!".equals(result)) {
            dispatcher = request.getRequestDispatcher("jsp/EditMenu.jsp");
            dispatcher.forward(request, response);
        } else {
            response.getWriter().write(result);
        }
    }
}
