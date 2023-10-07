<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>RF - Menu Home</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

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
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="../css/style.css" rel="stylesheet">
</head>

<body>
	<div class="container-xxl bg-white p-0">


		<!-- Navbar & Hero Start -->
		<div class="container-xxl position-relative p-0">
			<nav
				class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
				<a href="" class="navbar-brand p-0">
					<h1 class="text-primary m-0">
						<i class="fa fa-utensils me-3"></i>Restoran
					</h1> <!-- <img src="img/logo.png" alt="Logo"> -->
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
					<span class="fa fa-bars"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<div class="navbar-nav ms-auto py-0 pe-4">
						<a href="Index.jsp" class="nav-item nav-link">Home</a> <a
							href="HomeMenu.jsp" class="nav-item nav-link active">Menu</a>
						<div class="nav-item dropdown"></div>
						<a href="ContactUs.jsp" class="nav-item nav-link">Contact</a>
					</div>
					<a href="Reservation.jsp" class="btn btn-primary py-2 px-4">Reserve
						A Table</a>
				</div>
			</nav>

			<div class="container-xxl py-5 bg-dark hero-header mb-5">
				<div class="container text-center my-5 pt-5 pb-4">
					<h1 class="display-3 text-white mb-3 animated slideInDown">Food
						Menu</h1>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb justify-content-center text-uppercase">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item"><a href="#">Pages</a></li>
							<li class="breadcrumb-item text-white active" aria-current="page">Menu</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
		<!-- Navbar & Hero End -->


		<!-- Menu Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
					<h5
						class="section-title ff-secondary text-center text-primary fw-normal">Food
						Menu</h5>
					<h4 class="mb-5">Our menu boasts an exquisite array of delectable culinary creations.
						</h4>
				</div>
				<div class="tab-class text-center wow fadeInUp"
					data-wow-delay="0.1s">
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

					<div class="menu-boxes">
						<!-- Your menu items here -->
					</div>
					<div class="menu-boxes">
						<%@ page import="java.util.List"%>
						<%@ page import="com.restaurant_management_system.beans.Menu"%>
						<%@ page import="com.restaurant_management_system.model.MenuDB"%>
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
								RM
								<%=String.format("%.2f", menu.getPrice())%>
							</p>
							<p>
								
								<%=menu.getDescription()%>
							</p>

							<!-- 							<p> -->
							<!-- 								Availability: -->
							<%-- 								<%=menu.getAvailability()%> --%>
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
							<%-- 							<input type="hidden" id="menuPrice<%=menu.getId()%>" --%>
							<%-- 								value="<%=menu.getPrice()%>"> --%>
						</div>
						<%
						}
						%>
					</div>

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
									class="btn btn-link" href="ContactUs.jsp">Contact Us</a> <a
									class="btn btn-link" href="Reservation.jsp">Reservation</a> <a
									class="btn btn-link" href="PrivacyPolicy.jsp">Privacy Policy</a> <a
									class="btn btn-link" href="TandC">Terms & Condition</a>
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
									&copy; <a class="border-bottom" href="#">Your Site Name</a>,
									All Right Reserved.

									<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
									Designed By <a class="border-bottom"
										href="https://htmlcodex.com">HTML Codex</a><br>
									<br> Distributed By <a class="border-bottom"
										href="https://themewagon.com" target="_blank">ThemeWagon</a>
								</div>
								<div class="col-md-6 text-center text-md-end">
									<div class="footer-menu">
										<a href="">Home</a> <a href="">Cookies</a> <a href="">Help</a>
										<a href="">FQAs</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Footer End -->


				<!-- Back to Top -->
				<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
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
</body>

</html>

