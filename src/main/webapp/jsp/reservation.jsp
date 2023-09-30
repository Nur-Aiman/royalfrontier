<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Make a Reservation</title>
</head>
<body>
    <h2>Reservation Form</h2>
    <% 
  
       String result = (String) session.getAttribute("reservationStatus");
       if (result != null) {
           out.print("<p>" + result + "</p>");
           session.removeAttribute("reservationStatus"); 
       }
    %>
    <form action="../MakeReservation" method="post">
        <label for="name">Name:</label><br>
        <input type="text" id="name" name="name" required><br><br>
        
        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="dateAndTime">Reservation Date and Time (YYYY-MM-DD HH:MM:SS):</label><br>
        <input type="text" id="dateAndTime" name="dateAndTime" required><br><br>

        <label for="numberOfPax">Number of People:</label><br>
        <input type="number" id="numberOfPax" name="numberOfPax" required><br><br>
        
        <label for="specialRequest">Special Requests:</label><br>
        <textarea id="specialRequest" name="specialRequest" rows="4" cols="50"></textarea><br><br>
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>
