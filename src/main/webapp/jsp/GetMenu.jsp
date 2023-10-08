<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.restaurant_management_system.model.MenuDB"%>
<%@ page import="com.restaurant_management_system.beans.Menu"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Order Menu</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<!-- Favicon -->
<link href="../img/favicon.ico" rel="icon">
<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap"
	rel="stylesheet">
<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />
<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Menu</title>
<!-- Include your CSS stylesheets for a fancy and elegant design -->
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Menu</title>
<!-- Include your CSS stylesheets for a fancy and elegant design -->
<link rel="stylesheet" href="css/style.css">

<style>
    .custom-font {
        font-family: 'Georgia', serif;
        /* Replace 'Your-Desired-Font' with the actual font you want to use */
    }
</style>
</head>
<body>
	<!-- Navbar & Hero Start -->
	<div class="container-xxl position-relative p-0">
		<nav
			class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
			<a href="" class="navbar-brand p-0">
				<h1 class="text-primary m-0">
					<i class="fa fa-utensils me-3"></i>Royal Frontier
				</h1> <!-- <img src="../img/logo.png" alt="Logo"> -->
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
				<span class="fa fa-bars"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<div class="navbar-nav ms-auto py-0 pe-4">
<!-- 					<a href="jsp/Index.jsp" class="nav-item nav-link" -->
<!-- 						style="font-weight: bold;">Home</a> -->
					<div class="nav-item dropdown"></div>
					<a href="jsp/ContactUs.jsp" class="nav-item nav-link"
						style="font-weight: bold;">Contact</a>
				</div>
				<a href="jsp/Index.jsp" class="btn btn-primary py-2 px-4"
					style="color: black;">Logout </a>
					
				
			</div>
		</nav>
		<div class="container-xxl py-5 bg-dark hero-header mb-5">
			<div class="container text-center my-5 pt-5 pb-4">
				<h1 class="display-3 text-white mb-3 animated slideInDown">Order
					Menu</h1>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb justify-content-center text-uppercase">
						<li class="breadcrumb-item text-white" aria-current="page">Home</li>
						<li class="breadcrumb-item text-white active" aria-current="page">Menu</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
	<!-- Navbar & Hero End -->
	<!-- Menu Start -->
	<div class="container-xxl py-0">
		<div class="container">

			<div class="tab-class text-right wow fadeInUp" data-wow-delay="0.1s">

				<!-- Add this within the HTML body where you want to display the user's email -->
				<div class="user-email custom-font">
					<h4>Welcome To Royal Frontier : <span id="userEmailPlaceholder"></span></h4>
				</div>

				
				
				<div class="table-number">
					<h5>Table Number : <span id="tableNumberPlaceholder"></span></h5>
				</div>
				<div class="total-quantity">
					<h4>Total Quantity : <span id="totalQuantity">0</span>
					<button class="cart-button" onclick="checkout()">Checkout</button></h4>
				</div>
				<br> <br>
				<div class="menu-container">
					<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
						<h5
							class="section-title ff-secondary text-center text-primary fw-normal"
							id="foodmenu">Please Order The Menu</h5>
					</div>

					<!-- Search and Sort Section -->
					<!-- 					<div class="search-sort"> -->
					<!-- 						<input type="text" id="searchInput" -->
					<!-- 							placeholder="Search by menu name" oninput="searchMenus()"> -->
					<!-- 						<label for="sortSelect">Sort by:</label> <select id="sortSelect" -->
					<!-- 							onchange="sortMenus()"> -->
					<!-- 							<option value="menu">Menu Name</option> -->
					<!-- 							<option value="price">Price (Low to High)</option> -->
					<!-- 							<option value="availability">Availability</option> -->
					<!-- 						</select> -->
					<!-- 					</div> -->
					<div class="menu-boxes">
						<!-- Your menu items here -->
					</div>
					<div class="menu-boxes">
						<%@ page import="java.util.List"%>
						<%@ page import="com.restaurant_management_system.beans.Menu"%>
						<%
						MenuDB menuDB = new MenuDB();
						List<Menu> menus = menuDB.getAllMenus();
						%>
						<%
						for (Menu menu : menus) {
						%>
						<div class="menu-box">
							<img src="<%=menu.getImageURL()%>"
								onclick="openModal('<%=menu.getImageURL()%>')">
							<h2><%=menu.getMenu()%></h2>
							<p>
								<!-- Price: -->
								RM
								<%=String.format("%.2f", menu.getPrice())%>
							</p>
<!-- 							<p> -->
<!-- 																Availability: -->
<%-- 								<%=menu.getAvailability()%> --%>
<!-- 							</p> -->
							<p>
								<!-- 								Description: -->
								<%=menu.getDescription()%>
							</p>
							<!-- Quantity Field with Add and Remove Buttons -->
							<div class="quantity-field">
								<button class="remove-button"
									onclick="decrementQuantity(<%=menu.getId()%>)">-</button>
								<input type="number" id="quantity<%=menu.getId()%>" value="0"
									class="quantity-input"
									oninput="updateTotalPrice(<%=menu.getId()%>); updateCart();">
								<button class="add-button"
									onclick="incrementQuantity(<%=menu.getId()%>)">+</button>
							</div>
							<!-- Total Price Calculations -->
							<p>
								Total Price: <span>RM</span><span
									id="totalPrice<%=menu.getId()%>">0.00</span>
							</p>
							<input type="hidden" id="menuPrice<%=menu.getId()%>"
								value="<%=menu.getPrice()%>"> <input type="hidden"
								name="imageURL" id="imageURL" value="">
						</div>
						<%
						}
						%>
					</div>
				</div>
				<br> <br>


				<script>
	
				 // Retrieve the user's email from the session
			 var userEmail = '<%=(String) session.getAttribute("email")%>';
			 var tableNumber = '<%=(String) session.getAttribute("tableNumber")%>';
			
			 // Check if the user is logged in and their email is available
			 if (userEmail && userEmail.trim() !== '') {
			 document.getElementById("userEmailPlaceholder").textContent = userEmail;
			 }
var totalQuantity = 0;
function incrementQuantity(menuId) {
var quantityField = document.getElementById("quantity" + menuId);
var currentQuantity = parseInt(quantityField.value);
if (currentQuantity >= 0) {
quantityField.value = currentQuantity + 1;
updateTotalPrice(menuId);
updateCart();
}
}
function decrementQuantity(menuId) {
var quantityField = document.getElementById("quantity" + menuId);
var currentQuantity = parseInt(quantityField.value);
if (currentQuantity > 0) {
quantityField.value = currentQuantity - 1;
updateTotalPrice(menuId);
updateCart();
}
}
function checkout() {
// Create an array to store the order details
var orderDetails = [];
var order_items = [];
var tableNumber = document.getElementById("tableNumberPlaceholder").textContent; // Table Number
sessionStorage.setItem('tableNumber', tableNumber);
// Gather additional information
var currentDateAndTime = new Date().toISOString(); // Current date and time in ISO 8601 format
var customerEmail = '<%=(String) session.getAttribute("userEmailPlaceholder")%>'; // Customer's email (assuming it's retrieved from the session)
<%for (Menu menu : menus) {%>
var quantityField<%=menu.getId()%> = document.getElementById("quantity<%=menu.getId()%>");
var currentQuantity<%=menu.getId()%> = parseInt(quantityField<%=menu.getId()%>.value);
if (currentQuantity<%=menu.getId()%> > 0) {
// Add menu item details to the order
var imageURL<%=menu.getId()%> = '<%=menu.getImageURL()%>';
orderDetails.push({
id: <%=menu.getId()%>,
name: "<%=menu.getMenu()%>",
price: <%=menu.getPrice()%>,
quantity: currentQuantity<%=menu.getId()%>,
imageURL: imageURL<%=menu.getId()%> // Include imageURL in the order details
});
// Push the menu ID into the order_items array for each selected item
for (var i = 0; i < currentQuantity<%=menu.getId()%>; i++) {
order_items.push(<%=menu.getId()%>);
}
}
<%}%>
// Include additional information in the order details
orderDetails.push({
table_number: tableNumber,
date_and_time: currentDateAndTime, // Include the current date and time
customer_email: customerEmail
});
// Store the orderDetails array in a session variable
sessionStorage.setItem('orderDetails', JSON.stringify(orderDetails));
// Store the order_items array in a session variable
sessionStorage.setItem('order_items', JSON.stringify(order_items));
// Store the table number in a session variable
sessionStorage.setItem('tableNumber', tableNumber);
// Redirect the user to checkout.jsp
window.location.href = "Checkout?tableNumber="+tableNumber;
}
	
function updateTotalPrice(menuId) {
var quantityField = document.getElementById("quantity" + menuId);
var priceField = document.getElementById("menuPrice" + menuId);
var totalPriceSpan = document.getElementById("totalPrice" + menuId);
var quantity = parseInt(quantityField.value);
var price = parseFloat(priceField.value);
var totalPrice = quantity * price;
totalPriceSpan.innerText = totalPrice.toFixed(2);
}
function updateCart() {
totalQuantity = 0;
<%for (Menu menu : menus) {%>
var quantityField<%=menu.getId()%> = document.getElementById("quantity<%=menu.getId()%>");
var currentQuantity<%=menu.getId()%> = parseInt(quantityField<%=menu.getId()%>.value);
totalQuantity += currentQuantity<%=menu.getId()%>;
<%}%>
document.getElementById("totalQuantity").innerText = totalQuantity;
}
function goToCheckout() {
// Check if there are items in the cart
if (totalQuantity > 0) {
// Gather additional user information (e.g., name, address, payment details)
var userName = document.getElementById("userName").value;
var userAddress = document.getElementById("userAddress").value;
var paymentMethod = document.getElementById("paymentMethod").value;
// Create an object with the data to send to the server
var requestData = {
order_items: selectedMenuItems, // An array of selected menu items
table_number: userAddress, // The user's table number
date_and_time: new Date().toISOString(), // Current date and time
customer_email: userName, // The user's email
payment_mode: paymentMethod, // The payment mode
payment_status: "pending" // Default payment status
};
// Send the data to the AddOrder servlet using AJAX
$.ajax({
type: "POST",
url: "../AddOrder", // Replace with the actual URL of your servlet
data: JSON.stringify(requestData),
contentType: "application/json",
success: function(response) {
// Handle the server response (e.g., show a confirmation message)
alert('Order placed successfully!');
// Clear the cart
clearCart();
},
error: function(error) {
// Handle errors (e.g., show an error message)
console.error('Error:', error);
}
});
} else {
alert('Your cart is empty. Please add items before checking out.');
}
}
// Open the modal with the clicked image
function openModal(imgSrc) {
var modal = document.getElementById("myModal");
var modalImg = document.getElementById("modalImg");
modal.style.display = "block";
modalImg.src = imgSrc;
}
// Close the modal
function closeModal() {
var modal = document.getElementById("myModal");
modal.style.display = "none";
}
// Retrieve the user's email from the session
var userEmail = '<%=(String) session.getAttribute("email")%>';
// Check if the user is logged in and their email is available
if (userEmail && userEmail.trim() !== '') {
document.getElementById("userEmailPlaceholder").textContent = userEmail;
}
// Retrieve the table number from local storage
var tableNumber = localStorage.getItem('tableNumber');
// Check if the table number is available
if (tableNumber) {
// Display the table number in the designated element
document.getElementById("tableNumberPlaceholder").textContent = tableNumber;
} else {
// Handle the case when the table number is not available
console.log('Table Number not found in local storage');
}
// Initialize the total quantity on page load
window.onload = function() {
updateCart();
};
</script>
				<!-- Back to Top -->
				<a href="#foodmenu"
					class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
					class="bi bi-arrow-up"></i></a>
			</div>
			<!-- JavaScript Libraries -->
			<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
			<script src="lib/wow/wow.min.js"></script>
			<script src="lib/easing/easing.min.js"></script>
			<script src="lib/waypoints/waypoints.min.js"></script>
			<script src="lib/counterup/counterup.min.js"></script>
			<script src="lib/owlcarousel/owl.carousel.min.js"></script>
			<script src="lib/tempusdominus/js/moment.min.js"></script>
			<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
			<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
			<!-- Template Javascript -->
			<script src="js/main.js"></script>
		</div>
		<!-- Footer Start -->
		<div
			class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn"
			data-wow-delay="0.1s">
			<div class="container py-0">
				<div class="row g-5">
			
					<div class="col-lg-3 col-md-6">
						<h4
							class="section-title ff-secondary text-start text-primary fw-normal mb-4">Opening</h4>
						<h5 class="text-light fw-normal">Monday - Sunday</h5>
						<p>08 AM - 10 PM</p>

					</div>
				
				</div>
			</div>
			<div class="container">
				<div class="copyright">
					<div class="row">
						<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
							&copy; <a class="border-bottom" href="#">Royal Frontier</a>, All
							Right Reserved.

							<!-- 									/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/ -->
							Designed By <a class="border-bottom" href=#>RF Theme</a><br>
							<br>
							<!-- 									Distributed By <a class="border-bottom" -->
							<!-- 										href="https://themewagon.com" target="_blank">ThemeWagon</a> -->
						</div>
						<!-- 								<div class="col-md-6 text-center text-md-end"> -->
						<!-- 									<div class="footer-menu"> -->
						<!-- 										<a href="">Home</a> <a href="">Cookies</a> <a href="">Help</a> -->
						<!-- 										<a href="">FQAs</a> -->
						<!-- 									</div> -->
						<!-- 								</div> -->
					</div>
				</div>
			</div>
		</div>
		<!-- Footer End -->

<!-- Back to Top -->
				<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
					class="bi bi-arrow-up"></i></a>
			</div>
			
	<!-- The Modal -->
	<div id="myModal" class="modal">
		<span class="close" onclick="closeModal()">&times;</span> <img
			class="modal-content" id="modalImg">
	</div>
</body>
</html>



