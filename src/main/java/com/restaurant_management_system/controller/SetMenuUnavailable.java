package com.restaurant_management_system.controller;

import com.restaurant_management_system.model.MenuDB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class SetMenuUnavailable extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SetMenuUnavailable() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Fetch the 'id' from the POST request body
        int id = Integer.parseInt(request.getParameter("id"));
        //
        MenuDB menuDB = new MenuDB();
        String result = menuDB.setMenuUnavailableById(id);

        PrintWriter out = response.getWriter();
        out.println(result);
    }
// test
    // If you want, you can still have a doGet method or any other methods as needed
}
