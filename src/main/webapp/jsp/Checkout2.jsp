<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link rel="stylesheet" type="text/css" href="../css/checkout-style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Checkout</h1>
        </header>
        <section class="order-summary">
            <h2>Order Summary</h2>
             <!-- Order Summary -->
        <div id="orderSummary">
            <!-- Order details will be displayed here -->
            <!-- Include a form to allow users to adjust quantities if needed -->
        </div>

        <!-- Total Price -->
        <div id="totalPrice">
            <!-- Total price will be displayed here -->
        </div>

        </section>
        <section class="payment-method">
            <h2>Select Payment Method:</h2>
            <form action="../AddOrder" method="post">
                <label class="payment-option">
                    <input type="radio" name="paymentMethod" value="payAtCounter"> Pay at Counter
                </label>
                <label class="payment-option">
                    <input type="radio" name="paymentMethod" value="senangpay"> Pay using SenangPay
                </label>
                <!-- Hidden input to store order details as JSON -->
                <input type="hidden" name="orderDetails" id="orderDetails" value="">
                <!-- Submit button to send the order to the controller -->
                <input type="submit" value="Proceed to Payment" class="proceed-button">
            </form>
        </section>
        <section class="user-info">
            <div class="user-email">
                Email: <%= (String) session.getAttribute("email") %>
            </div>
            <% String tableNumber = (String) session.getAttribute("tableNumber"); %>
            <div class="table-number">
                Table Number: <%= tableNumber %>
            </div>
            <div class="date-time">
                Date and Time: <%= java.time.LocalDateTime.now() %>
            </div>
        </section>
    </div>
    <script src="jquery.min.js"></script>
    <script src="checkout.js"></script>
    <script>
    // Retrieve the orderDetails array from the session
    var orderDetailsJSON = sessionStorage.getItem('orderDetails');

    // Parse the JSON string into an array of order details
    var orderDetails = JSON.parse(orderDetailsJSON);

    // Display the order details on the page
    var orderSummary = document.getElementById("orderSummary");

    // Function to update the order details and refresh the display
    function updateOrderDetails() {
        orderSummary.innerHTML = "<h2>Order Details</h2>";

        // Iterate through the order details and display them
        for (var i = 0; i < orderDetails.length; i++) {
            var item = orderDetails[i];
            var itemDiv = document.createElement("div");

            // Display item name and price
            itemDiv.innerHTML += "<p>Name: " + item.name + "</p>";
            itemDiv.innerHTML += "<p>Price: RM " + item.price.toFixed(2) + "</p>";

            // Quantity input field
            itemDiv.innerHTML += "<label>Quantity: ";
            itemDiv.innerHTML += "<input type='number' min='1' step='1' value='" + item.quantity + "' data-index='" + i + "'>";

            itemDiv.innerHTML += "</label>";

            // Total price for the item
            var totalItemPrice = item.quantity * item.price;
            itemDiv.innerHTML += "<p>Total Price: RM " + totalItemPrice.toFixed(2) + "</p>";

            // Remove button
            itemDiv.innerHTML += "<button class='remove-item' data-index='" + i + "'>Remove</button>";
            itemDiv.innerHTML += "<hr>";

            orderSummary.appendChild(itemDiv);
        }

        // Update the hidden input with the modified order details
        document.getElementById("orderDetails").value = JSON.stringify(orderDetails);
    }

    // Attach event listeners for quantity changes and item removal
    orderSummary.addEventListener("input", function (event) {
        if (event.target.tagName === "INPUT") {
            var index = event.target.getAttribute("data-index");
            orderDetails[index].quantity = parseInt(event.target.value);
            updateOrderDetails();
        }
    });

    orderSummary.addEventListener("click", function (event) {
        if (event.target.classList.contains("remove-item")) {
            var index = event.target.getAttribute("data-index");
            orderDetails.splice(index, 1);
            updateOrderDetails();
        }
    });

    // Initial display of order details
    updateOrderDetails();

    
    </script>
</body>
</html>
s