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

public class AddMenu extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddMenu() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MenuDB menuDB = new MenuDB();

        String menuName = request.getParameter("menuName");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String availability = request.getParameter("availability");

        Menu newMenu = new Menu(0, menuName, price, description, availability); 

        String result = menuDB.insertMenu(newMenu);

        response.getWriter().write(result);
    }
}
