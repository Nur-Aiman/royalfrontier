package com.restaurant_management_system.controller;

import com.restaurant_management_system.beans.Order;
import com.restaurant_management_system.model.OrderDB;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Type;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 * Servlet implementation class GetOrderHistory
 */
public class GetOrderHistory extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public GetOrderHistory() {
        super();
    }

    /**
     * Handles the HTTP GET request.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDB orderDB = new OrderDB();
        List<Order> orders = orderDB.fetchAllOrders();

        Gson gson = new GsonBuilder().registerTypeAdapter(LocalDateTime.class, new LocalDateTimeSerializer()).create();
        String ordersJson = gson.toJson(orders);

        response.setContentType("application/json");
        response.getWriter().write(ordersJson);
    }

    /**
     * Handles the HTTP POST request. We simply forward the POST request to the GET handler.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private static class LocalDateTimeSerializer implements JsonSerializer<LocalDateTime> {
        private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        @Override
        public JsonElement serialize(LocalDateTime localDateTime, Type type, JsonSerializationContext jsonSerializationContext) {
            return new JsonPrimitive(formatter.format(localDateTime));
        }
    }
}
