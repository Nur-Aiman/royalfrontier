<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RF - Checkout</title>
    <!-- Include necessary CSS and JS files -->
    
</head>	
<body>


    <!-- Your website header and navigation -->

    <!-- Checkout Page Content -->
    <div class="container">
        <h1>Checkout</h1>

        <!-- Order Summary -->
        <div id="orderSummary">
            <!-- Order details will be displayed here -->
            <!-- Include a form to allow users to adjust quantities if needed -->
        </div>

        <!-- Total Price -->
        <div id="totalPrice">
            <!-- Total price will be displayed here -->
        </div>

        <!-- Payment Method Selection -->
        <h2>Select Payment Method:</h2>
        <form action="../AddOrder" method="post">
            <label>
                <input type="radio" name="paymentMethod" value="payAtCounter"> Pay at Counter
            </label>
            <label>
                <input type="radio" name="paymentMethod" value="senangpay"> Pay using SenangPay
            </label>

            <!-- Hidden input to store order details as JSON -->
            <input type="hidden" name="orderDetails" id="orderDetails" value="">
            
            <!-- Submit button to send the order to the controller -->
            <input type="submit" value="Proceed to Payment">
        </form>
        
         <div class="user-email">
        Email: <%= (String) session.getAttribute("email") %>
    </div>

    <!-- Display the table number -->
    <div class="table-number">
       Table Number: <%= (String) session.getAttribute("tableNumberPlaceholder") %>
    </div>

    <!-- Display the current date and time -->
    <div class="date-time">
        Date and Time: <%= java.time.LocalDateTime.now() %>
    </div>
        
         <div id="orderSummary">
        <!-- Display the order details here -->
    </div>
    </div>

    <!-- Include jQuery and any other necessary scripts -->
    <script src="jquery.min.js"></script>
    <script src="checkout.js"></script>
    <script>
    // Retrieve the orderDetails array from the session
    var orderDetailsJSON = sessionStorage.getItem('orderDetails');

    // Parse the JSON string into an array of order details
    var orderDetails = JSON.parse(orderDetailsJSON);

    // Display the order details on the page
    var orderSummary = document.getElementById("orderSummary");
    orderSummary.innerHTML = "<h2>Order Details</h2>";

    // Iterate through the order details and display them
    for (var i = 0; i < orderDetails.length - 1; i++) {
        var item = orderDetails[i];
        orderSummary.innerHTML += "<p>Name: " + item.name + "</p>";
        orderSummary.innerHTML += "<p>Price: RM " + item.price.toFixed(2) + "</p>";
        orderSummary.innerHTML += "<p>Quantity: " + item.quantity + "</p>";
        var totalItemPrice = item.quantity * item.price;
        orderSummary.innerHTML += "<p>Total Price: RM " + totalItemPrice.toFixed(2) + "</p>";
        orderSummary.innerHTML += "<hr>";
      
        
        
    }

    
    </script>
</body>
</html>
