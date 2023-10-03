<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order and Menu Details</title>
</head>
<body>
    <h2>Order History</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Order Items</th>
                <th>Table Number</th>
                <th>Date and Time</th>
                <th>Order Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody id="orderData">
            <!-- Order data will be populated here using JavaScript -->
        </tbody>
    </table>

    <h2>Menu Items</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Menu Item</th>
                <th>Price</th>
                <th>Description</th>
                <th>Availability</th>
                
            </tr>
        </thead>
        <tbody id="menuData">
            <!-- Menu data will be populated here using JavaScript -->
        </tbody>
    </table>

    <script>
let menuMapping = {};  // To store menu id to name mapping

// Fetch Menu data from the API
fetch('/royalfrontier/GetMenu')
    .then(response => response.json())
    .then(data => {
        const menuItems = data;
        const tableBody = document.getElementById('menuData');

        // Populate the table with fetched data
        menuItems.forEach(menu => {
            let row = tableBody.insertRow();

            let cellId = row.insertCell(0);
            cellId.textContent = menu.id;

            let cellMenuItem = row.insertCell(1);
            cellMenuItem.textContent = menu.menu;

            let cellPrice = row.insertCell(2);
            cellPrice.textContent = menu.price;

            let cellDescription = row.insertCell(3);
            cellDescription.textContent = menu.description;

            let cellAvailability = row.insertCell(4);
            cellAvailability.textContent = menu.availability;

            // Store the mapping of menu id to its name
            menuMapping[menu.id] = menu.menu;
        });

        // After getting the menu, get the order history
        return fetch('/royalfrontier/GetOrderHistory');
    })
    .then(response => response.json())
    .then(data => {
        const orders = data.orders;
        const tableBody = document.getElementById('orderData');

        // Populate the table with fetched data
        orders.forEach(order => {
            for(let i = 0; i < order.order_items.length; i++) {
                let row = tableBody.insertRow();

                let cellOrderId = row.insertCell(0);
                cellOrderId.textContent = order.order_id;

                let cellOrderItems = row.insertCell(1);
                cellOrderItems.textContent = menuMapping[order.order_items[i]] || order.order_items[i];

                let cellTableNumber = row.insertCell(2);
                cellTableNumber.textContent = order.table_number;

                let cellDateTime = row.insertCell(3);
                cellDateTime.textContent = order.date_and_time;

                let cellOrderStatus = row.insertCell(4);
                cellOrderStatus.textContent = order.order_status[i]; // Fetching status based on current item index
            
             // Adding a 'Complete' button in the new column
                let cellAction = row.insertCell(5);
                let completeButton = document.createElement('button');
                completeButton.textContent = "Complete";
                completeButton.addEventListener('click', function() {
                    // Handle the completion action here (e.g., make an API call to update the order status)
                	// Update the status for the specific item
                    order.order_status[i] = 'served';
                    
                    // Make an API call to update the order status
                    fetch('/royalfrontier/UpdateOrderStatus', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: `order_id=${order.order_id}&order_statuses=${order.order_status.join(",")}`
                    })
                    .then(response => response.text())
                    .then(data => {
                        alert(data);
                        location.reload();  // Reload the page to reflect the updated status
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert('Failed to update the order status.');
                    });
                });
             
                cellAction.appendChild(completeButton);
            }
        });
    })
    .catch(error => {
        console.error('Error:', error);
    });
</script>



</body>
</html>
