<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order and Menu Details</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }

        h2 {
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        th {
            background-color: #333;
            color: white;
        }

        button {
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            background-color: #007BFF;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

    </style>
    
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

    <script>
let menuMapping = {};  // To store menu id to name mapping

// Fetch Menu data from the API
fetch('/royalfrontier/GetMenu')
    .then(response => response.json())
    .then(data => {
        const menuItems = data;

        // Populate the menuMapping object with fetched data
        menuItems.forEach(menu => {
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
                
             // Check if the order status for that item is 'pending'
                if (order.order_status[i] === 'served') {
                    completeButton.style.backgroundColor = "red";
                    // completeButton.disabled = true;
                }
                
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
