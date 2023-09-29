<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Make a Reservation</title>
</head>
<body>

<h2>Reservation Form</h2>

<form action="../MakeReservation" method="post">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required><br><br>
    
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br><br>
    
    <label for="dateAndTime">Date and Time (Format: yyyy-MM-dd HH:mm:ss):</label>
    <input type="text" id="dateAndTime" name="dateAndTime" required><br><br>

    <label for="numberOfPax">Number of People:</label>
    <input type="number" id="numberOfPax" name="numberOfPax" min="1" required><br><br>

    <label for="specialRequest">Special Request:</label>
    <textarea id="specialRequest" name="specialRequest" rows="4" cols="50"></textarea><br><br>

    <input type="submit" value="Submit">
</form>

</body>
</html>
