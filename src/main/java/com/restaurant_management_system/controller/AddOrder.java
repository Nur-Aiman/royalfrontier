package com.restaurant_management_system.controller;

import com.restaurant_management_system.beans.Order;
import com.restaurant_management_system.model.OrderDB;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class AddOrder extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddOrder() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDB orderDB = new OrderDB();
        Order order = new Order();

        // Handle extraction of order items
        String[] itemStrings = request.getParameter("order_items").split(",");
        List<Integer> items = Arrays.stream(itemStrings)
                                    .map(Integer::parseInt)
                                    .collect(Collectors.toList());
        order.setOrder_items(items);

        // Set order status to 'pending' for each order item by default
        List<String> statuses = items.stream().map(item -> "pending").collect(Collectors.toList());
        order.setOrder_status(statuses);

        order.setTable_number(Integer.parseInt(request.getParameter("table_number")));
        order.setDate_and_time(LocalDateTime.parse(request.getParameter("date_and_time"), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));

        double totalPrice = 0.0;
        for (Integer itemId : items) {
            totalPrice += orderDB.fetchPriceById(itemId);
        }
        order.setTotal_price(totalPrice);
        order.setCustomer_email(request.getParameter("customer_email"));
        order.setPayment_mode(request.getParameter("payment_mode"));
        order.setPayment_status(request.getParameter("payment_status"));

        String result = orderDB.insertOrder(order);
        response.getWriter().write(result);
        response.sendRedirect("jsp/Checkout2.jsp");
    }

}
