package com.restaurant_management_system.controller;

import com.restaurant_management_system.model.MenuDB;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteMenu extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteMenu() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MenuDB menuDB = new MenuDB();
        HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;

        // Get the menuId to be deleted from the request parameter
        int id = Integer.parseInt(request.getParameter("menuId"));

        // Call a method in your MenuDB class to delete the menu item by menuId
        boolean isDeleted = menuDB.deleteMenu(id);

        // Check if the deletion was successful and return an appropriate response
        if (isDeleted) {
        	  dispatcher = request.getRequestDispatcher("jsp/EditMenu.jsp");
              dispatcher.forward(request, response);
        } else {
            response.getWriter().write("error");
        }
    }
}
