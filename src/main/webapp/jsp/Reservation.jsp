<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>RF - Table Reservation</title>
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
<style>
.tooltip-container {
	position: relative;
}

.tooltip {
	position: absolute;
	background-color: #333;
	color: #fff;
	padding: 5px;
	border-radius: 5px;
	font-size: 12px;
	display: none;
	z-index: 1;
}

.tooltip-container:hover .tooltip {
	display: block;
}
</style>
<body>
	<div class="container-xxl bg-white p-0">
		<!-- Spinner Start -->

		<!-- Spinner End -->
		<!-- Navbar & Hero Start -->
		<div class="container-xxl position-relative p-0">
			<nav
				class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
				<a href="" class="navbar-brand p-0">
					<h1 class="text-primary m-0">
						<i class="fa fa-utensils me-3"></i>Restoran
					</h1> <!-- <img src="../img/logo.png" alt="Logo"> -->
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
					<span class="fa fa-bars"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<div class="navbar-nav ms-auto py-0 pe-4">
						<a href="index.html" class="nav-item nav-link">Home</a> <a
							href="about.html" class="nav-item nav-link">About</a> <a
							href="service.html" class="nav-item nav-link">Service</a> <a
							href="menu.html" class="nav-item nav-link">Menu</a>
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle active"
								data-bs-toggle="dropdown">Pages</a>
							<div class="dropdown-menu m-0">
								<a href="booking.html" class="dropdown-item active">Booking</a>
								<a href="team.html" class="dropdown-item">Our Team</a> <a
									href="testimonial.html" class="dropdown-item">Testimonial</a>
							</div>
						</div>
						<a href="contact.html" class="nav-item nav-link">Contact</a>
					</div>
					<a href="" class="btn btn-primary py-2 px-4">Book A Table</a>
				</div>
			</nav>
			<div class="container-xxl py-5 bg-dark hero-header mb-5">
				<div class="container text-center my-5 pt-5 pb-4">
					<h1 class="display-3 text-white mb-3 animated slideInDown">Booking</h1>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb justify-content-center text-uppercase">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item"><a href="#">Pages</a></li>
							<li class="breadcrumb-item text-white active" aria-current="page">Booking</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
		<!-- Navbar & Hero End -->
		<!-- Reservation Start -->
		<div class="container-xxl py-5 px-0 wow fadeInUp"
			data-wow-delay="0.1s">
			<div class="row g-0">
				<div class="col-md-6">
					<div class="video">
						<button type="button" class="btn-play" data-bs-toggle="modal"
							data-src="https://www.youtube.com/embed/DWRcNpR6Kdc"
							data-bs-target="#videoModal">
							<span></span>
						</button>
					</div>
				</div>


				<div class="col-md-6 bg-dark d-flex align-items-center">
					<div class="p-5 wow fadeInUp" data-wow-delay="0.2s">
						<h5
							class="section-title ff-secondary text-start text-primary fw-normal">Reservation</h5>
						<h1 class="text-white mb-4">Book A Table Online</h1>
						<form action="../MakeReservation" method="post">
							<div class="row g-3">
								<div class="col-md-6">
									<div class="form-floating">
										<input type="text" name="name" class="form-control" id="name"
											placeholder="Your Name"> <label for="name">Your
											Name</label>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-floating">
										<input type="email" name="email" class="form-control"
											id="email" placeholder="Your Email"> <label
											for="email">Your Email</label>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-floating">
										<input type="text" name="phoneNumber" class="form-control"
											id="phoneNumber" placeholder="Your Phone Number"> <label
											for="phoneNumber">Your Phone Number</label>
									</div>
								</div>
								
								<div class="col-md-6">
    <div class="form-floating date" id="reservationDate" data-target-input="nearest">
        <input type="date" name="reservationDate" class="form-control" id="date" placeholder="Date" data-target="#reservationDate" min="" />
        <label for="date">Date</label>
    </div>
</div>

<div class="col-md-6">
    <div class="form-floating">
        <select name="reservationTime" class="form-control" id="time">
            <option value="08:00:00">08:00</option>
            <option value="10:00:00">10:00</option>
            <option value="12:00:00">12:00</option>
            <option value="14:00:00">14:00</option>
            <option value="16:00:00">16:00</option>
            <option value="18:00:00">18:00</option>
            <option value="20:00:00">20:00</option>
            <option value="22:00:00">22:00</option>
        </select>
        <label for="time">Time</label>
    </div>
</div>

								
								<div class="col-md-6">
									<div class="form-floating">
										<select name="tableNumber" class="form-control"
											id="tableNumber">
											<option value="1">Table 1</option>
											<option value="2">Table 2</option>
											<option value="3">Table 3</option>
											<option value="4">Table 4</option>
											<option value="5">Table 5</option>
											<!-- Add more options as per your restaurant's tables -->
										</select> <label for="tableNumber">Table Number</label>
									</div>
								</div>

								<div class="col-12">
									<div class="form-floating">
										<textarea class="form-control" placeholder="Special Request"
											name="specialRequest" id="message" style="height: 100px"></textarea>
										<label for="message">Special Request</label>
									</div>
								</div>
								<div class="col-12">
									<button onclick="showSweetAlert()"
										class="btn btn-primary w-100 py-3" type="submit">Book
										Now</button>
								</div>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>


		<div class="modal fade" id="videoModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content rounded-0">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Youtube Video</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<!-- 16:9 aspect ratio -->
						<div class="ratio ratio-16x9">
							<iframe class="embed-responsive-item" src="" id="video"
								allowfullscreen allowscriptaccess="always" allow="autoplay"></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Reservation Start -->
		<!-- Footer Start -->
			<div
				class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn"
				data-wow-delay="0.1s">
				<div class="container py-5">
					<div class="row g-5">
						<div class="col-lg-3 col-md-6">
							<h4
								class="section-title ff-secondary text-start text-primary fw-normal mb-4">Royal Frontier</h4>
							<a class="btn btn-link" href="Index.jsp">About Us</a>
								 <a class="btn btn-link" href="ContactUs.jsp">Contact Us</a> <a
								class="btn btn-link" href="Reservation.jsp">Reservation</a> <a
								class="btn btn-link" href="PrivacyPolicy.jsp">Privacy Policy</a>
							<a class="btn btn-link" href="TermsCondition.jsp">Terms & Condition</a>
						</div>
						<div class="col-lg-3 col-md-6">
							<h4
								class="section-title ff-secondary text-start text-primary fw-normal mb-4">Contact</h4>
							<p class="mb-2">
								<i class="fa fa-map-marker-alt me-3"></i>123 GKK, Petaling Jaya, Selangor.
							
							</p>
							<p class="mb-2">
								<i class="fa fa-phone-alt me-3"></i>+012 345 67890
							</p>
							<p class="mb-2">
								<i class="fa fa-envelope me-3"></i>royalfrontierinfo@gmail.com
							</p>
							<!-- 								<div class="d-flex pt-2"> -->
							<!-- 									<a class="btn btn-outline-light btn-social" href=""><i -->
							<!-- 										class="fab fa-twitter"></i></a> <a -->
							<!-- 										class="btn btn-outline-light btn-social" href=""><i -->
							<!-- 										class="fab fa-facebook-f"></i></a> <a -->
							<!-- 										class="btn btn-outline-light btn-social" href=""><i -->
							<!-- 										class="fab fa-youtube"></i></a> <a -->
							<!-- 										class="btn btn-outline-light btn-social" href=""><i -->
							<!-- 										class="fab fa-linkedin-in"></i></a> -->
							<!-- 								</div> -->
						</div>
						<div class="col-lg-3 col-md-6">
							<h4
								class="section-title ff-secondary text-start text-primary fw-normal mb-4">Opening</h4>
							<h5 class="text-light fw-normal">Monday - Sunday</h5>
							<p>08 AM - 10 PM</p>

						</div>
						<!-- 							<div class="col-lg-3 col-md-6"> -->
						<!-- 								<h4 -->
						<!-- 									class="section-title ff-secondary text-start text-primary fw-normal mb-4">Newsletter</h4> -->
						<!-- 								<p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p> -->
						<!-- 								<div class="position-relative mx-auto" style="max-width: 400px;"> -->
						<!-- 									<input class="form-control border-primary w-100 py-3 ps-4 pe-5" -->
						<!-- 										type="text" placeholder="Your email"> -->
						<!-- 									<button type="button" -->
						<!-- 										class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button> -->
						<!-- 								</div> -->
						<!-- 							</div> -->
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
	<!-- JavaScript Libraries -->
	<script>
		function getFormValue(e) {
			e.preventDefault();
			const name = document.getElementById("name").value;
			const email = document.getElementById("email").value;
			const dateAndTime = document.getElementById("dateAndTime").value;
			const numberOfPax = document.getElementById("numberOfPax").value;
			const specialRequest = document.getElementById("specialRequest").value;
			console.log(name + email + dateAndTime + numberOfPax
					+ specialRequest);
		}
	</script>
	<script>
		function showSweetAlert() {
			Swal.fire({
				position : 'center',
				icon : 'success',
				title : 'Your work has been saved',
				showConfirmButton : false,
				timer : 2500
			})

		}
	</script>
	
	<script>
	document.addEventListener("DOMContentLoaded", function(event) { 
	    var today = new Date();
	    var dd = String(today.getDate() + 1).padStart(2, '0'); // Get tomorrow's date
	    var mm = String(today.getMonth() + 1).padStart(2, '0');
	    var yyyy = today.getFullYear();
	    var minDate = yyyy + '-' + mm + '-' + dd;
	    document.getElementById('date').setAttribute('min', minDate);
	});

	</script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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

