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
                let row = tableBody.insertRow();

                let cellOrderId = row.insertCell(0);
                cellOrderId.textContent = order.order_id;

                let cellOrderItems = row.insertCell(1);
                // Map order items to their menu names
                let menuNames = order.order_items.map(id => menuMapping[id] || id).join(', ');
                cellOrderItems.textContent = menuNames;

                let cellTableNumber = row.insertCell(2);
                cellTableNumber.textContent = order.table_number;

                let cellDateTime = row.insertCell(3);
                cellDateTime.textContent = order.date_and_time;

                let cellOrderStatus = row.insertCell(4);
                cellOrderStatus.textContent = order.order_status;
            });
        })
        .catch(error => {
            console.error('Error:', error);
        });
</script>

</body>
</html>
