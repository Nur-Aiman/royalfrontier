package com.restaurant_management_system.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.restaurant_management_system.beans.Order;
import com.restaurant_management_system.model.OrderDB;

/**
 * Servlet implementation class SalesReport
 */
public class SalesReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DateTimeFormatter date = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String now = date.format(LocalDate.now());
		LocalDate dateTime = LocalDate.parse(now, date);
		
	 ////S A L E S -  D A I L Y
	    OrderDB daily=new OrderDB();
	    double totalSalesDaily = daily.fetchSalesDaily(dateTime);
	    System.out.println("Total Sales for " + dateTime + ": " + totalSalesDaily);
	 ////S A L E S -  W E E K
	    OrderDB week=new OrderDB();
	    double totalSalesWeek = week.fetchSalesWeek(dateTime);
	    System.out.println("Total Sales for current week "  + ": " + totalSalesWeek);
	 ////S A L E S -  M O N T H
	    OrderDB month=new OrderDB();
	    double totalSalesMonth = month.fetchSalesMonth(dateTime);
	    System.out.println("Total Sales for this month " + dateTime + ": " + totalSalesMonth);
	////S A L E S -  Y E A R
	    OrderDB year=new OrderDB();
	    double totalSalesYear = year.fetchSalesYear(dateTime);
	    System.out.println("Total Sales for this year " + dateTime + ": " + totalSalesYear);
	////S A L E S -  L I F E T I M E
	    OrderDB lifetime=new OrderDB();
	    double totalSalesLifetime = lifetime.fetchSalesLifetime();
	    System.out.println("Total Sales for lifetime" + dateTime + ": " + totalSalesLifetime);   
	    
	    // Set these attributes in the request
	    request.setAttribute("totalSalesDaily", totalSalesDaily);
	    request.setAttribute("totalSalesWeek", totalSalesWeek);
	    request.setAttribute("totalSalesMonth", totalSalesMonth);
	    request.setAttribute("totalSalesYear", totalSalesYear);
	    request.setAttribute("totalSalesLifetime", totalSalesLifetime);

	    // Forward the request to the JSP
	    request.getRequestDispatcher("/jsp/SalesReport.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}


