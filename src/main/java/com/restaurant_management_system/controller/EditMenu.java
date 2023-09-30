/*
 * Online DB : OK
 */

package com.restaurant_management_system.controller;

import com.restaurant_management_system.beans.Menu;
import com.restaurant_management_system.model.MenuDB;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EditMenu extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public EditMenu() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MenuDB menuDB = new MenuDB();

        int id = Integer.parseInt(request.getParameter("id"));
        String menuName = request.getParameter("menuName");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String availability = request.getParameter("availability");

        Menu updatedMenu = new Menu(id, menuName, price, description, availability);

        String result = menuDB.updateMenu(updatedMenu);

        response.getWriter().write(result);
    }
}
