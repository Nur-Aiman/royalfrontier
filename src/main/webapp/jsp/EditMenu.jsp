<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.restaurant_management_system.model.MenuDB"%>
<%@ page import="com.restaurant_management_system.beans.Menu"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>RF - Order Menu</title>
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
					<a href="jsp/ViewReservation.jsp" class="nav-item nav-link">View Reservation</a>
					<a href="jsp/AdminManageOrder.jsp" class="nav-item nav-link">Manage Order</a>
					<a href="SalesReport" class="nav-item nav-link">Sales Report</a> <a
						href="jsp/Login.jsp" class="nav-item nav-link">Logout</a>
				</div>
		</nav>
		<div class="container-xxl py-5 bg-dark hero-header mb-5">
			<div class="container text-center my-5 pt-5 pb-4">
				<h1 class="display-3 text-white mb-3 animated slideInDown">Food
					Menu</h1>
				<!-- 						<nav aria-label="breadcrumb"> -->
				<!-- 							<ol class="breadcrumb justify-content-center text-uppercase"> -->
				<!-- 								<li class="breadcrumb-item"><a href="#">Home</a></li> -->
				<!-- 								<li class="breadcrumb-item"><a href="#">Pages</a></li> -->
				<!-- 								<li class="breadcrumb-item text-white active" -->
				<!-- 									aria-current="page">Menu</li> -->
				<!-- 							</ol> -->
				<!-- 						</nav> -->
			</div>
		</div>
	</div>
	<!-- Navbar & Hero End -->
	<!-- Menu Start -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
				<h5
					class="section-title ff-secondary text-center text-primary fw-normal"
					id="foodmenu">Food Menu</h5>
			</div>
			<div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
				<ul
					class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
					<li class="nav-item"><a
						class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active"
						data-bs-toggle="pill" href="#tab-1"> <i
							class="fa fa-coffee fa-2x text-primary"></i>
							<div class="ps-3">
								<small class="text-body">Popular</small>
								<h6 class="mt-n1 mb-0">Appetizers</h6>
							</div>
					</a></li>
					<li class="nav-item"><a
						class="d-flex align-items-center text-start mx-3 pb-3"
						data-bs-toggle="pill" href="#tab-2"> <i
							class="fa fa-hamburger fa-2x text-primary"></i>
							<div class="ps-3">
								<small class="text-body">Special</small>
								<h6 class="mt-n1 mb-0">Main Courses</h6>
							</div>
					</a></li>
					<li class="nav-item"><a
						class="d-flex align-items-center text-start mx-3 me-0 pb-3"
						data-bs-toggle="pill" href="#tab-3"> <i
							class="fa fa-utensils fa-2x text-primary"></i>
							<div class="ps-3">
								<small class="text-body">Lovely</small>
								<h6 class="mt-n1 mb-0">Desserts</h6>
							</div>
					</a></li>
				</ul>
				<!-- Add this within the HTML body where you want to display the user's email -->
				<div class="user-email">
					Welcome, <span id="userEmailPlaceholder"></span>
				</div>
				<br>

				<!-- 				<div class="table-number"> -->
				<!-- 					Table Number: <span id="tableNumberPlaceholder"></span> -->
				<!-- 				</div> -->

				<!-- 				<div class="total-quantity"> -->
				<!-- 					Total Quantity: <span id="totalQuantity">0</span> -->
				<!-- 					<button class="cart-button" onclick="checkout()">Checkout</button> -->
				<!-- 				</div> -->
				<br> <br>
				<div class="menu-container">
					<h1>Our Menu</h1>
					<!-- 					Search and Sort Section -->
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
							<form class="edit-form" action="EditMenu" method="post">
								<input type="hidden" name="menuId" value="<%=menu.getId()%>">
								<input type="hidden" name="description"
									value="<%=menu.getDescription()%>"> <img
									src="<%=menu.getImageURL()%>"
									onclick="openModal('<%=menu.getImageURL()%>')">
								<p>
									<input type="text" id="editName" name="editName"
										value="<%=menu.getMenu()%>">
								</p>
								<p>
									<!-- Price: -->
									<input type="number" id="editPrice" name="editPrice"
										placeholder="RM" value="<%=menu.getPrice()%>">
								</p>
								<p>
									<!	-- Availability: -->
									<input type="text" id="editAvailability"
										name="editAvailability" value="<%=menu.getAvailability()%>">
								</p>
								<!-- 							<p> -->
								<!-- 															 																Description: -->
								<%-- 								<%=menu.getDescription()%> --%>
								<!-- 							</p> -->
								<!-- 							Quantity Field with Add and Remove Buttons -->
								<!-- 							<div class="quantity-field"> -->
								<!-- 								<button class="remove-button" -->
								<%-- 									onclick="decrementQuantity(<%=menu.getId()%>)">-</button> --%>
								<%-- 								<input type="number" id="quantity<%=menu.getId()%>" value="0" --%>
								<!-- 									class="quantity-input" -->
								<%-- 									oninput="updateTotalPrice(<%=menu.getId()%>); updateCart();"> --%>
								<!-- 								<button class="add-button" -->
								<%-- 									onclick="incrementQuantity(<%=menu.getId()%>)">+</button> --%>
								<!-- 							</div> -->
								<!-- 							Total Price Calculations -->
								<!-- 							<p> -->
								<!-- 								Total Price: <span>RM</span><span -->
								<%-- 									id="totalPrice<%=menu.getId()%>">0.00</span> --%>
								<!-- 							</p> -->
								<input type="hidden" id="menuPrice<%=menu.getId()%>"
									value="<%=menu.getPrice()%>"> <input type="hidden"
									name="imageURL" id="imageURL" value="">

								<!-- 							<button class="edit-button" -->
								<%-- 								onclick="openEditModal(<%=menu.getId()%>)">Edit</button> --%>

<br>

								<button type="submit" class="save-button"
									style="background-color: #4CAF50; color: white; border: none; padding: 10px 20px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer;">Save
									Changes</button>
<br><br>

							</form>
							<form class="delete-form" action="DeleteMenu" method="post">
								<input type="hidden" name="menuId" value="<%=menu.getId()%>">
								<button class="delete-button" style="background: none; border: none; color: red; text-decoration: underline; cursor: pointer;">Delete</button>


							</form>

							<!-- 							Close modal button -->
							<%-- 							<span class="close" onclick="closeEditModal(<%=menu.getId()%>)">&times;</span> --%>
						</div>
						<%
						}
						%>
					</div>
				</div>
				<br> <br>

				<!-- <script> -->
				// function deleteMenu(menuId) { // // Ask for confirmation before
				deleting // if (confirm("Are you sure you want to delete this
				menu?")) { // // Send an AJAX request to the server to delete the
				menu // $.ajax({ // type: "POST", // url: "DeleteMenu", // Replace
				with the actual URL of your servlet for deleting the menu // data: {
				menuId: menuId }, // success: function(response) { // // Handle the
				server response (e.g., remove the menu item from the DOM) // if
				(response === "success") { // // Assuming the server returns
				"success" on successful deletion // // Remove the menu item from the
				DOM // var menuBox =
				document.querySelector(".menu-box[data-menu-id='" + menuId + "']");
				// if (menuBox) { // menuBox.remove(); // } else { // alert("Menu
				not found."); // } // } else { // alert("Failed to delete the
				menu."); // } // }, // error: function(error) { // // Handle errors
				(e.g., show an error message) // console.error('Error:', error); //
				} // }); // } // }
				<!-- </script> -->

				<script>
				
				function openEditModal(menuId) {
				    var editModal = document.getElementById("editModal" + menuId);
				    editModal.style.display = "block";
				}

				function closeEditModal(menuId) {
				    var editModal = document.getElementById("editModal" + menuId);
				    editModal.style.display = "none";
				}

	
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
var userEmail = '<%=(String) session.getAttribute("email")%>
					';
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
			<div class="container py-5">
				<div class="row g-5">
					<div class="col-lg-3 col-md-6">
						<h4
							class="section-title ff-secondary text-start text-primary fw-normal mb-4">Company</h4>
						<a class="btn btn-link" href="Index.jsp">About Us</a> <a
							class="btn btn-link" href="ContactUs">Contact Us</a> <a
							class="btn btn-link" href="Reservation.jsp">Reservation</a> <a
							class="btn btn-link" href="">Privacy Policy</a> <a
							class="btn btn-link" href="">Terms & Condition</a>
					</div>
					<div class="col-lg-3 col-md-6">
						<h4
							class="section-title ff-secondary text-start text-primary fw-normal mb-4">Contact</h4>
						<p class="mb-2">
							<i class="fa fa-map-marker-alt me-3"></i>123 Street, New York,
							USA
						</p>
						<p class="mb-2">
							<i class="fa fa-phone-alt me-3"></i>+012 345 67890
						</p>
						<p class="mb-2">
							<i class="fa fa-envelope me-3"></i>info@example.com
						</p>
						<div class="d-flex pt-2">
							<a class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-youtube"></i></a> <a
								class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-linkedin-in"></i></a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<h4
							class="section-title ff-secondary text-start text-primary fw-normal mb-4">Opening</h4>
						<h5 class="text-light fw-normal">Monday - Saturday</h5>
						<p>09AM - 09PM</p>
						<h5 class="text-light fw-normal">Sunday</h5>
						<p>10AM - 08PM</p>
					</div>
					<div class="col-lg-3 col-md-6">
						<h4
							class="section-title ff-secondary text-start text-primary fw-normal mb-4">Newsletter</h4>
						<p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
						<div class="position-relative mx-auto" style="max-width: 400px;">
							<input class="form-control border-primary w-100 py-3 ps-4 pe-5"
								type="text" placeholder="Your email">
							<button type="button"
								class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="copyright">
					<div class="row">
						<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
							&copy; <a class="border-bottom" href="#">Your Site Name</a>, All
							Right Reserved.
							<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
							Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML
								Codex</a><br> <br> Distributed By <a class="border-bottom"
								href="https://themewagon.com" target="_blank">ThemeWagon</a>
						</div>
						<div class="col-md-6 text-center text-md-end">
							<div class="footer-menu">
								<a href="">Home</a> <a href="">Cookies</a> <a href="">Help</a> <a
									href="">FQAs</a>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer End -->
		<!-- The Modal -->
		<div id="myModal" class="modal">
			<span class="close" onclick="closeModal()">&times;</span> <img
				class="modal-content" id="modalImg">
		</div>
		<!-- Add this script in your JSP page -->
<script>
    function deleteMenu(menuId) {
        $.ajax({
            type: "POST",
            url: "DeleteMenu", // Servlet URL
            data: { menuId: menuId },
            success: function (response) {
                if (response === "success") {
                    // Show a success pop-up
                    alert("Menu item deleted successfully!");
                } else {
                    // Show an error pop-up
                    alert("Delete failed. Please try again.");
                }
            },
            error: function () {
                // Show an error pop-up in case of AJAX error
                alert("An error occurred while deleting the menu item.");
            }
        });
    }
</script>
		
</body>
</html>
