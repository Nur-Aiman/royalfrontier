package com.restaurant_management_system.controller;

import com.restaurant_management_system.model.OrderDB;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateOrder extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateOrder() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDB orderDB = new OrderDB();

        int orderId = Integer.parseInt(request.getParameter("order_id"));
        String paymentStatus = request.getParameter("payment_status");

        if (!"approve".equals(paymentStatus)) {
            response.getWriter().write("Invalid payment status.");
            return;
        }

        String result = orderDB.updateOrderPaymentStatus(orderId, paymentStatus);
        response.getWriter().write(result);
    }
}
