package com.restaurant_management_system.model;

import com.restaurant_management_system.beans.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.stream.Collectors;

public class OrderDB {

    public double fetchPriceById(int id) {
        double price = 0.0;
        myDatabase db = new myDatabase();
        Connection con = db.getCon();

        try {
            String query = "SELECT price FROM menu WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, id);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                price = rs.getDouble("price");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(con);
        }
        return price;
    }

    public String insertOrder(Order order) {
        myDatabase db = new myDatabase();
        Connection con = db.getCon();

        try {
            String query = "INSERT INTO `order` (order_items, table_number, date_and_time, total_price, customer_email, payment_mode, payment_status) " +
                           "VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);

        
            String orderItemsString = order.getOrder_items().stream()
                .map(String::valueOf)
                .collect(Collectors.joining(","));
            pstmt.setString(1, orderItemsString);

            pstmt.setInt(2, order.getTable_number());
            pstmt.setObject(3, order.getDate_and_time());
            pstmt.setDouble(4, order.getTotal_price());
            pstmt.setString(5, order.getCustomer_email());
            pstmt.setString(6, order.getPayment_mode());
            pstmt.setString(7, order.getPayment_status());

            pstmt.executeUpdate();

            return "Order added successfully!";
        } catch (Exception e) {
            e.printStackTrace();
            return "Error in adding order.";
        } finally {
            db.closeConnection(con);
        }
    }
    
    public String updateOrderPaymentStatus(int orderId, String paymentStatus) {
        myDatabase db = new myDatabase();
        Connection con = db.getCon();

        try {
            String query = "UPDATE `order` SET payment_status = ? WHERE order_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, paymentStatus);
            pstmt.setInt(2, orderId);

            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                return "Order payment status updated successfully!";
            } else {
                return "Order not found.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "Error in updating order payment status.";
        } finally {
            db.closeConnection(con);
        }
    }


}
