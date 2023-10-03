package com.restaurant_management_system.controller;

import com.restaurant_management_system.model.OrderDB;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateOrderStatus extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateOrderStatus() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // You can keep this empty or use it to serve an update form page
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDB orderDB = new OrderDB();

        int orderId = Integer.parseInt(request.getParameter("order_id"));
        String orderStatus = request.getParameter("order_status"); // expected to be "served"

        String result = orderDB.updateOrderStatus(orderId, orderStatus);
        response.getWriter().write(result);
    }
}
