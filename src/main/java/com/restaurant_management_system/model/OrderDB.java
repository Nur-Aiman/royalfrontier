package com.restaurant_management_system.model;

import com.restaurant_management_system.beans.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

import java.util.ArrayList;
import java.util.Arrays;

public class OrderDB {
	
	public String updateOrderStatus(int orderId, List<String> orderStatuses) {
	    myDatabase db = new myDatabase();
	    Connection con = db.getCon();

	    try {
	        String query = "UPDATE `order` SET order_status = ? WHERE order_id = ?";
	        PreparedStatement pstmt = con.prepareStatement(query);
	        pstmt.setString(1, String.join(",", orderStatuses));
	        pstmt.setInt(2, orderId);

	        int affectedRows = pstmt.executeUpdate();
	        if (affectedRows > 0) {
	            return "Order status updated successfully!";
	        } else {
	            return "Order not found.";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "Error in updating order status.";
	    } finally {
	        db.closeConnection(con);
	    }
	}




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
            String query = "INSERT INTO `order` (order_items, table_number, date_and_time, total_price, customer_email, payment_mode, order_status, payment_status) " +
                           "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);

            // Set order items
            String orderItemsString = order.getOrder_items().stream()
                                          .map(String::valueOf)
                                          .collect(Collectors.joining(","));
            pstmt.setString(1, orderItemsString);

            pstmt.setInt(2, order.getTable_number());
            pstmt.setObject(3, order.getDate_and_time());
            pstmt.setDouble(4, order.getTotal_price());
            pstmt.setString(5, order.getCustomer_email());
            pstmt.setString(6, order.getPayment_mode());

            // Set order status
            String orderStatusString = order.getOrder_status().stream()
                                           .collect(Collectors.joining(","));
            pstmt.setString(7, orderStatusString);

            pstmt.setString(8, order.getPayment_status());

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
    
    public List<Order> fetchAllOrders() {
        List<Order> orders = new ArrayList<>();
        myDatabase db = new myDatabase();
        Connection con = db.getCon();

        try {
            String query = "SELECT * FROM `order`";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                order.setOrder_id(rs.getInt("order_id"));

                // Handle extraction of order items
                String[] itemStrings = rs.getString("order_items").split(",");
                List<Integer> items = new ArrayList<>();
                for (String item : itemStrings) {
                    items.add(Integer.parseInt(item));
                }
                order.setOrder_items(items);

                order.setTable_number(rs.getInt("table_number"));
                order.setDate_and_time(rs.getTimestamp("date_and_time").toLocalDateTime());
                order.setTotal_price(rs.getDouble("total_price"));
                order.setCustomer_email(rs.getString("customer_email"));
                order.setPayment_mode(rs.getString("payment_mode"));

                // Handle extraction of order status
                String[] statusStrings = rs.getString("order_status").split(",");
                List<String> statuses = Arrays.asList(statusStrings);
                order.setOrder_status(statuses);

                order.setPayment_status(rs.getString("payment_status"));
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(con);
        }
        return orders;
    }

    
    
    public double fetchSalesForToday() {
        return fetchSalesForPeriod("CURDATE()", "CURDATE() + INTERVAL 1 DAY");
    }

    public double fetchSalesForThisWeek() {
        return fetchSalesForPeriod("DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) DAY)", "DATE_ADD(CURDATE(), INTERVAL 7 - WEEKDAY(CURDATE()) DAY)");
    }

    public double fetchSalesForThisMonth() {
        return fetchSalesForPeriod("DATE_FORMAT(CURDATE() ,'%Y-%m-01')", "LAST_DAY(CURDATE())");
    }

    public double fetchSalesForThisYear() {
        return fetchSalesForPeriod("DATE_FORMAT(CURDATE() ,'%Y-01-01')", "DATE_FORMAT(CURDATE() ,'%Y-12-31')");
    }

    public double fetchLifetimeSales() {
        return fetchSalesForPeriod(null, null);
    }

    private double fetchSalesForPeriod(String startDate, String endDate) {
        double sales = 0.0;
        myDatabase db = new myDatabase();
        Connection con = db.getCon();

        try {
            StringBuilder query = new StringBuilder("SELECT SUM(total_price) as sales FROM `order`");
            if (startDate != null && endDate != null) {
                query.append(" WHERE date_and_time BETWEEN ").append(startDate).append(" AND ").append(endDate);
            }
            PreparedStatement pstmt = con.prepareStatement(query.toString());
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                sales = rs.getDouble("sales");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(con);
        }
        return sales;
    }
    
   ////S A L E S -  D A I L Y    
    
    public double fetchSalesDaily(LocalDate date) {
        double totalSalesDaily=0;
        myDatabase db = new myDatabase();
        Connection con = db.getCon();

        try {
        	//SELECT sum(total_price) FROM `order` WHERE date_and_time >= '2023-09-29' AND date_and_time < '2023-09-30'
            String query = "SELECT sum(total_price) as x FROM `order` WHERE date_and_time >= ? AND date_and_time < ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            //pstmt.setString(1, date.format(DateTimeFormatter.ISO_LOCAL_DATE));
            System.out.println(pstmt);
            pstmt.setString(1, date.toString());
            pstmt.setString(2, (date.plusDays(1)).toString());
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
            	totalSalesDaily = rs.getDouble("x");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(con);
        }
        return totalSalesDaily;
    }
    
////S A L E S -  W E E K
    
	public double fetchSalesWeek(LocalDate date) {
	    double totalSalesWeek = 0;
	    myDatabase db = new myDatabase();
	    Connection con = db.getCon();
	
	    try {
	        // Construct the date range for the week
	        LocalDate startOfWeek = date.with(DayOfWeek.MONDAY); // Assuming Monday is the start of the week
	        LocalDate endOfWeek = startOfWeek.plusDays(7); // Assuming a 7-day week
	        
	        String query = "SELECT SUM(total_price) as x FROM `order` WHERE date_and_time >= ? AND date_and_time < ?";
	        PreparedStatement pstmt = con.prepareStatement(query);
	        
	        // Set the parameters for the date range
	        pstmt.setString(1, startOfWeek.format(DateTimeFormatter.ISO_LOCAL_DATE));
	        pstmt.setString(2, endOfWeek.format(DateTimeFormatter.ISO_LOCAL_DATE));
	        
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	            totalSalesWeek = rs.getDouble("x");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        db.closeConnection(con);
	    }
	    return totalSalesWeek;
	}

////S A L E S -  M O N T H	

	public double fetchSalesMonth(LocalDate date) {
	    double totalSalesMonth = 0;
	    myDatabase db = new myDatabase();
	    Connection con = db.getCon();

	    try {
	        // Extract the year and month from the LocalDate
	        int year = date.getYear();
	        int month = date.getMonthValue();
	        
	        // SQL query to calculate total sales for a specific month
	        String query = "SELECT SUM(total_price) as x FROM `order` WHERE EXTRACT(YEAR FROM date_and_time) = ? AND EXTRACT(MONTH FROM date_and_time) = ?";
	        PreparedStatement pstmt = con.prepareStatement(query);
	        
	        // Set the parameters for year and month
	        pstmt.setInt(1, year);
	        pstmt.setInt(2, month);
	        
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            totalSalesMonth = rs.getDouble("x");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        db.closeConnection(con);
	    }
	    return totalSalesMonth;
	}

////S A L E S -  Y E A R
	public double fetchSalesYear(LocalDate date) {
	    double totalSalesYear = 0;
	    myDatabase db = new myDatabase();
	    Connection con = db.getCon();

	    try {
	        // Extract the year from the provided LocalDate
	        int year = date.getYear();
	        
	        // SQL query to calculate total sales for a specific year
	        String query = "SELECT SUM(total_price) as x FROM `order` WHERE EXTRACT(YEAR FROM date_and_time) = ?";
	        PreparedStatement pstmt = con.prepareStatement(query);
	        
	        // Set the parameter for the year
	        pstmt.setInt(1, year);
	        
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            totalSalesYear = rs.getDouble("x");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        db.closeConnection(con);
	    }
	    return totalSalesYear;
	}

////S A L E S -  L I F E T I M E    
    
	public double fetchSalesLifetime() {
	    double totalSalesLifetime = 0;
	    myDatabase db = new myDatabase();
	    Connection con = db.getCon();

	    try {
	        // SQL query to calculate lifetime total sales
	        String query = "SELECT SUM(total_price) as x FROM `order`";
	        PreparedStatement pstmt = con.prepareStatement(query);

	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            totalSalesLifetime = rs.getDouble("x");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        db.closeConnection(con);
	    }
	    return totalSalesLifetime;
	}

    


}
