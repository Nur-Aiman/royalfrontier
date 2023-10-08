

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">

<meta charset="UTF-8">
<title>Order History</title>

<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
	background-color: #f4f4f4;
}

h2 {
	/* 	border-bottom: 2px solid #333; */
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

	<h2>Order History For Admin</h2>

	<div class="container-fluid bg-light d-flex justify-content-end p-2">
	

		<a href="EditMenu.jsp" class="btn btn-primary mx-2">Edit Menu</a>
		<a href="ViewReservation.jsp" class="btn btn-primary mx-2">View Reservation</a>
		<a href="../SalesReport" class="btn btn-primary mx-2">Sales Report</a>
		<a href="Index.jsp" class="btn btn-danger mx-2">Logout</a>
	</div>


	<table border="1">
		<thead>
			<tr>
				<th>ID</th>
				<th>Order Menu</th>
				<th>Table Number</th>
				<th>Date & Time</th>
				<th>Total Price</th>
				<th>Email</th>
				<th>Payment Mode</th>
				<th>Payment Status</th>
				<th>Order Status</th>
				<th>Approve / Reject <br> Payment
				</th>

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
                
                let cellTotalPrice = row.insertCell(4);
                cellTotalPrice.textContent = order.total_price;
                
                let cellCustomerEmail = row.insertCell(5);
                cellCustomerEmail.textContent = order.customer_email;
                
                let cellPaymentMode = row.insertCell(6);
                cellPaymentMode.textContent = order.payment_mode;
                
                let cellPaymentStatus = row.insertCell(7);
                cellPaymentStatus.textContent = order.payment_status;

                let cellOrderStatus = row.insertCell(8);
                cellOrderStatus.textContent = order.order_status[i]; // Fetching status based on current item index
                
                
                // Adding a 'Complete' button in the new column
                let cellAction = row.insertCell(9);
                let completeButton = document.createElement('button');
                completeButton.textContent = "Complete";
                
             // Check if the order status for that item is 'pending'
                if (order.order_status[i] === 'served') {
                    completeButton.style.backgroundColor = "red";
                    completeButton.textContent = "Pending";
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
