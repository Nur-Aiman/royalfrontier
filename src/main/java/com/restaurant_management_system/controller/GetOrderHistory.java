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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

        // Fetch sales amounts
        double todaySales = orderDB.fetchSalesForToday();
        double thisWeekSales = orderDB.fetchSalesForThisWeek();
        double thisMonthSales = orderDB.fetchSalesForThisMonth();
        double thisYearSales = orderDB.fetchSalesForThisYear();
        double lifetimeSales = orderDB.fetchLifetimeSales();

        // Prepare a response object
        Map<String, Object> responseObject = new HashMap<>();
        responseObject.put("orders", orders);
        responseObject.put("todaySales", todaySales);
        responseObject.put("thisWeekSales", thisWeekSales);
        responseObject.put("thisMonthSales", thisMonthSales);
        responseObject.put("thisYearSales", thisYearSales);
        responseObject.put("lifetimeSales", lifetimeSales);

        Gson gson = new GsonBuilder().registerTypeAdapter(LocalDateTime.class, new LocalDateTimeSerializer()).create();
        String jsonResponse = gson.toJson(responseObject);

        response.setContentType("application/json");
        response.getWriter().write(jsonResponse);
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
