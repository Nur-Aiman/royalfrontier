<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Checkout</title>
    <link rel="stylesheet" type="text/css" href="css/checkout-style.css">
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
    </section>
    <section class="payment-method">
        <h2>Select Payment Method:</h2>
        <form action="AddOrder" method="post">
            <label class="payment-option"> <input type="radio"
                                                  name="paymentMethod" value="payAtCounter"> Pay at Counter
            </label> <label class="payment-option"> <input type="radio"
                                                          name="paymentMethod" value="senangpay"> Pay using SenangPay
            </label>
            <!-- Hidden input to store order details as JSON -->
            <input type="hidden" name="orderDetails" id="orderDetails" value="">
            <input type="hidden" name="order_items" id="order_items" value="orderItemsStr">
            <input type="hidden" name="table_number" id="table_number" value="tableNumberPlaceholder">
            <input type="hidden" name="date_and_time" id="date_and_time" value="">
            <input type="hidden" name="customer_email" id="customer_email" value=" <%=(String) session.getAttribute("email")%>">
             <input type="hidden" name="payment_status" id="payment_status" value="pending">

            <!-- Submit button to send the order to the controller -->
            <input type="submit" value="Proceed to Payment"
                   class="proceed-button">
        </form>
    </section>
    <section class="user-info">
        <div class="user-email">
            Email:
            <%=(String) session.getAttribute("email")%>
        </div>

        <div class="table-number">
            Table Number:
            <span id="tableNumberPlaceholder"></span>
        </div>
        <div class="date-time">
            Date and Time: <span id="formattedDateTime"></span>
        </div>
        <div>
        <ul id="selectedItemsList"></ul>
    </div>
    </section>
</div>
<script src="jquery.min.js"></script>
<script src="checkout.js"></script>
<script>

// Retrieve the order_items array from session storage
var orderItems = JSON.parse(sessionStorage.getItem('order_items'));

// Check if orderItems is not null and is an array
if (Array.isArray(orderItems)) {
    var selectedItemsList = document.getElementById('selectedItemsList');
    
 // Create a string to store the comma-separated values
    var orderItemsStr = orderItems.join(',');
    
    // Iterate through the orderItems array and display each menu item ID
    orderItems.forEach(function(menuItemId) {
//         var listItem = document.createElement('p');
// //         listItem.textContent = menuItemId;
//         selectedItemsList.appendChild(listItem);
    });
 // Now you can set the orderItemsStr as the value of the hidden input field
    document.getElementById('order_items').value = orderItemsStr;
} else {
    // Handle the case when orderItems is null or not an array
    console.error('Invalid order_items data');
}
var tableNumber = '<%=(String) session.getAttribute("tableNumber")%>';
var tableNumber = localStorage.getItem('tableNumber');



if (tableNumber) {
    // Display the table number in the designated element
    document.getElementById("tableNumberPlaceholder").textContent = tableNumber;
} else {
    // Handle the case when the table number is not available
    console.log('Table Number not found in local storage');
}
    // Retrieve the orderDetails array from the session
    var orderDetailsJSON = sessionStorage.getItem('orderDetails');

    // Parse the JSON string into an array of order details
    var orderDetails = JSON.parse(orderDetailsJSON);

    // Display the order details on the page
    var orderSummary = document.getElementById("orderSummary");
    function formatDateTime() {
        const now = new Date();
        const year = now.getFullYear();
        const month = String(now.getMonth() + 1).padStart(2, '0');
        const day = String(now.getDate()).padStart(2, '0');
        const hours = String(now.getHours()).padStart(2, '0');
        const minutes = String(now.getMinutes()).padStart(2, '0');
        const seconds = String(now.getSeconds()).padStart(2, '0');
        return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
    }

    // Update the formatted date and time
    document.getElementById("formattedDateTime").textContent = formatDateTime();

    // Add an event listener for the form submission
    document.querySelector("form").addEventListener("submit", function (event) {
        // Get the current date and time
        var currentDateTime = formatDateTime();

        // Set the value of the date_and_time field
        document.getElementById("date_and_time").value = currentDateTime;
    });

    // Function to update the order details and refresh the display
    function updateOrderDetails() {
        // Clear existing order details
        orderSummary.innerHTML = "";

        // Iterate through the order details and display them
        for (var i = 0; i < orderDetails.length; i++) {
            var item = orderDetails[i];

            // Create a div for each menu item
            var menuItemDiv = document.createElement("div");
            menuItemDiv.classList.add("menu-item");

            // Menu image
            var menuImage = document.createElement("img");
            menuImage.src = item.imageURL; // Replace with the actual image URL
            menuImage.classList.add("menu-image");

            // Menu details
            var menuDetailsDiv = document.createElement("div");
            menuDetailsDiv.classList.add("menu-details");

            // Menu name with different color
            var menuName = document.createElement("p");
            menuName.textContent = item.name;
            menuName.classList.add("menu-name");

            // Quantity input field with + and - buttons
            var quantityDiv = document.createElement("div");
            quantityDiv.classList.add("quantity-div");

            var quantityLabel = document.createElement("label");
            quantityLabel.textContent = "Quantity:";
            quantityLabel.classList.add("quantity-label");

            var quantityInput = document.createElement("input");
            quantityInput.type = "number";
            quantityInput.min = "1";
            quantityInput.step = "1";
            quantityInput.value = item.quantity;
            quantityInput.setAttribute("data-index", i);
            quantityInput.classList.add("quantity-input");

            var decreaseButton = document.createElement("button");
            decreaseButton.textContent = "-";
            decreaseButton.classList.add("quantity-button",
                "decrease-button");

            var increaseButton = document.createElement("button");
            increaseButton.textContent = "+";
            increaseButton.classList.add("quantity-button",
                "increase-button");

            // Menu price
            var menuPrice = document.createElement("p");
            menuPrice.textContent = "Price: RM " + item.price.toFixed(2);
            menuPrice.classList.add("menu-price");

            // Total price for the item
            var totalItemPrice = item.quantity * item.price;
            var totalPrice = document.createElement("p");
            totalPrice.textContent = "Total: RM "
                + totalItemPrice.toFixed(2);
            totalPrice.classList.add("total-price");

            // Remove text (underlined)
            var removeText = document.createElement("p");
            removeText.textContent = "Remove";
            removeText.classList.add("remove-text");
            removeText.setAttribute("data-index", i);

            // Append elements to the quantity div
            quantityDiv.appendChild(decreaseButton);
            quantityDiv.appendChild(quantityInput);
            quantityDiv.appendChild(increaseButton);

            // Append elements to the menu item div
            menuDetailsDiv.appendChild(menuName);
            menuDetailsDiv.appendChild(menuPrice);
            menuItemDiv.appendChild(quantityInput);
            menuItemDiv.appendChild(menuImage);
            menuItemDiv.appendChild(menuDetailsDiv);
            menuDetailsDiv.appendChild(quantityDiv);
            menuDetailsDiv.appendChild(totalPrice);
            menuDetailsDiv.appendChild(removeText);
            menuItemDiv.appendChild(totalPrice);
            menuItemDiv.appendChild(removeText);

            // Append the menu item div to the order summary
            orderSummary.appendChild(menuItemDiv);
        }

        // Update the hidden input with the modified order details
        document.getElementById("orderDetails").value = JSON.stringify(orderDetails);
    }

    // Attach event listeners for quantity changes and item removal
    orderSummary.addEventListener("input", function (event) {
        if (event.target.classList.contains("quantity-input")) {
            var index = event.target.getAttribute("data-index");
            orderDetails[index].quantity = parseInt(event.target.value);
            updateOrderDetails();
        }
    });

    orderSummary.addEventListener("click", function (event) {
        if (event.target.classList.contains("remove-text")) {
            var index = event.target.getAttribute("data-index");
            orderDetails.splice(index, 1);
            updateOrderDetails();
        }
    });

    // Initial display of order details
    updateOrderDetails();
</script>
<script>
var tableNumber = localStorage.getItem('tableNumber');
var parsedTableNumber = parseInt(tableNumber);

if (!isNaN(parsedTableNumber)) {
    document.getElementById("table_number").value = parsedTableNumber;
} else {
    console.log('Table Number not found or not a valid integer in local storage');
}

// Initialize an empty order_items array
var order_items = [];

// Iterate through the order details to populate order_items
for (var i = 0; i < orderDetails.length; i++) {
    var item = orderDetails[i];
    var menuItemId = menu.getId(); // Replace with the actual property that holds the menu item ID

    // Iterate based on the quantity of the menu item
    for (var j = 0; j < item.quantity; j++) {
        order_items.push(menuItemId);
    }
}

// Convert the order_items array to a JSON string and update the hidden input
document.getElementById("order_items").value = JSON.stringify(order_items);
</script>

</body>
</html>
