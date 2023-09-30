<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
</head>
<body>
    <h2>Contact Us Form</h2>
    <% 
  
       String result = (String) session.getAttribute("result");
       if (result != null) {
           out.print("<p>" + result + "</p>");
           session.removeAttribute("result"); 
       }
    %>
    <form action="../ContactUs" method="post">
        <label for="name">Name:</label><br>
        <input type="text" id="name" name="name" required><br><br>
        
        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="subject">Subject:</label><br>
        <input type="text" id="subject" name="subject" required><br><br>
        
        <label for="message">Message:</label><br>
        <textarea id="message" name="message" rows="4" cols="50" required></textarea><br><br>
        
        
        <input type="hidden" id="date" name="date" value="">
        
        <input type="submit" value="Submit">
    </form>

    <script>
        document.getElementById("date").value = new Date().toISOString().slice(0,19);
    </script>
</body>
</html>
