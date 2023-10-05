<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>RF - Admin Manage</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
    
    
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
	
	 <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	rel="stylesheet">
	
	 <link
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"
	rel="stylesheet">
    
</head>



<div class="container my-5">
	<form action="controller" method="get"
		class="d-md-flex d-sm-block justify-content-between">
		<input type="hidden" name="command" value="select-orders">
		<h1 class="h5 align-self-center col-3">Search Order</h1>
		<div
			class="btn-group align-self-center col-12 col-sm-12 col-md-8 col-lg-6">
			<select name="searchType" class="btn btn-outline-dark col-3 col-sm-3">
				<option value="order_id">// ID</option>
				<option value="order_items">// Order Menu</option>
				<option value="table_number">// Table Number</option>
				<option value="date_and_time">// Date & Time</option> 
				<option value="total_price">// Total Price</option>
				<option value="customer_email">// Email</option>
				<option value="payment_mode">// Payment Mode</option>
				<option value="order_status">// Order Status</option>
				<option value="payment_status">// Payment Status</option>
			</select> <input type="search" name="searchBy" class="col-6 col-sm-6">
			<input type="submit" value="Search"
				class="btn btn-outline-dark col-3 col-sm-3">
		</div>
	</form>
	<div
		class="d-md-flex d-none justify-content-md-between justify-content-sm-center align-content-center border-bottom border-2 my-2 bg-dark text-light p-3 rounded-3">
		<div class="col-2 text-sm-center text-md-start align-self-center">
			<h1 class="h5 fw-bold">ID</h1>
		</div>
		<div class="col-2 align-self-center">
			<h1 class="h5 fw-bold">Order Menu</h1>
		</div>
		<div class="col-2 align-self-center">
			<h1 class="h5 fw-bold">Table Number</h1>
		</div>
		<div class="col-2 align-self-center">
			<h1 class="h5 fw-bold">Date & Time</h1>
		</div>
		<div class="col-3 align-self-center">
			<h1 class="h5 fw-bold">Total Price</h1>
		</div>
		<div class="col-3 align-self-center">
			<h1 class="h5 fw-bold">Email</h1>
		</div>
		<div class="col-3 align-self-center">
			<h1 class="h5 fw-bold">Payment Mode</h1>
		</div>
		<div class="col-2 align-self-center">
			<h1 class="h5 fw-bold">Payment Status</h1>
		</div>
		<div class="col-2 align-self-center">
			<h1 class="h5 fw-bold">Status</h1>
		</div>
	</div>
	<div
		class="d-md-flex d-sm-block justify-content-md-between justify-content-sm-center text-center border-bottom border-2 my-2 bg-light p-2 rounded-3">
		<div
			class="col-md-2 text-sm-center text-md-start align-self-center my-2">
			<h1 class="h6">101</h1>
		</div>
		<div
			class="col-md-2 text-sm-center text-md-start align-self-center my-2">
			<h1 class="h6">Spagetty Tomyam</h1>
		</div>
		<div
			class="col-md-2 text-sm-center text-md-start align-self-center my-2">
			<h1 class="h6">15</h1>
		</div>
		<div
			class="col-md-2 text-sm-center text-md-start align-self-center my-2">
			<h1 class="h6">04/12/2021 3:15:24:299</h1>
		</div>
		<div
			class="col-md-3 text-sm-center text-md-start align-self-center my-2">
			<h1 class="h6">Robert Tailor Hamonovych</h1>
		</div>
		<div
			class="col-md-2 text-sm-center text-md-start align-self-center my-2">
			<a class="btn btn-outline-dark w-100" href="#">Details</a>
		</div>
		<div
			class="col-md-2 text-sm-center text-md-start align-self-center my-2">
			<form method="get" action="controller" class="d-flex btn-group">
				<input type="hidden" name="command" value="refresh-order-status">
				<select name="status" class="btn btn-outline-dark">
					<option value="REGISTERED" class="form-select-button">REGISTERED</option>
					<option value="PAID" class="form-select-button">PAID</option>
					<option value="CANCELED" class="form-select-button">CANCELED</option>
				</select> <input type="submit" class="btn btn-outline-dark" value="OK">
			</form>
		</div>
	</div>
	<div
		class="d-md-flex d-sm-block justify-content-md-between justify-content-sm-center text-center border-bottom border-2 my-2 bg-light p-2 rounded-3">
		<div
			class="col-md-2 text-sm-center text-md-start align-self-center my-2">
			<h1 class="h6">D2903WE</h1>
		</div>
		<div
			class="col-md-2 text-sm-center text-md-start align-self-center my-2">
			<h1 class="h6">03/09/2021 3:15:24:299</h1>
		</div>
		<div
			class="col-md-3 text-sm-center text-md-start align-self-center my-2">
			<h1 class="h6">Jason Tailor Hamonovych</h1>
		</div>
		<div
			class="col-md-2 text-sm-center text-md-start align-self-center my-2">
			<a class="btn btn-outline-dark w-100" href="#">Details</a>
		</div>
		<div
			class="col-md-2 text-sm-center text-md-start align-self-center my-2">
			<form method="get" action="controller" class="d-flex btn-group">
				<input type="hidden" name="command" value="refresh-order-status">
				<select name="status" class="btn btn-outline-dark">
					<option value="REGISTERED" class="form-select-button">REGISTERED</option>
					<option value="PAID" class="form-select-button">PAID</option>
					<option value="CANCELED" class="form-select-button">CANCELED</option>
				</select> <input type="submit" class="btn btn-outline-dark" value="OK">
			</form>
		</div>
	</div>
	<div
		class="d-md-flex d-sm-block justify-content-md-between justify-content-sm-center text-center border-bottom border-2 my-2 bg-light p-2 rounded-3">
		<div
			class="col-md-2 text-sm-center text-md-start align-self-center my-2">
			<h1 class="h6">5463783D</h1>
		</div>
		<div
			class="col-md-2 text-sm-center text-md-start align-self-center my-2">
			<h1 class="h6">19/10/2021 3:34:24:299</h1>
		</div>
		<div
			class="col-md-3 text-sm-center text-md-start align-self-center my-2">
			<h1 class="h6">Mike Orley Hemington</h1>
		</div>
		<div
			class="col-md-2 text-sm-center text-md-start align-self-center my-2">
			<a class="btn btn-outline-dark w-100" href="#">Details</a>
		</div>
		<div
			class="col-md-2 text-sm-center text-md-start align-self-center my-2">
			<form method="get" action="controller" class="d-flex btn-group">
				<input type="hidden" name="command" value="refresh-order-status">
				<select name="status" class="btn btn-outline-dark">
					<option value="REGISTERED" class="form-select-button">REGISTERED</option>
					<option value="PAID" class="form-select-button">PAID</option>
					<option value="CANCELED" class="form-select-button">CANCELED</option>
				</select> <input type="submit" class="btn btn-outline-dark" value="OK">
			</form>
		</div>
	</div>
	<div
		class="d-md-flex d-sm-block justify-content-md-between justify-content-sm-center text-center border-bottom border-2 my-2 bg-light p-2 rounded-3">
		<div
			class="col-md-2 text-sm-center text-md-start align-self-center my-2">
			<h1 class="h6">324516AD</h1>
		</div>
		<div
			class="col-md-2 text-sm-center text-md-start align-self-center my-2">
			<h1 class="h6">03/02/2021 22:45:44:999</h1>
		</div>
		<div
			class="col-md-3 text-sm-center text-md-start align-self-center my-2">
			<h1 class="h6">Jessy Koper Fauer</h1>
		</div>
		<div
			class="col-md-2 text-sm-center text-md-start align-self-center my-2">
			<a class="btn btn-outline-dark w-100" href="#">Details</a>
		</div>
		<div
			class="col-md-2 text-sm-center text-md-start align-self-center my-2">
			<form method="get" action="controller" class="d-flex btn-group">
				<input type="hidden" name="command" value="refresh-order-status">
				<select name="status" class="btn btn-outline-dark">
					<option value="REGISTERED" class="form-select-button">REGISTERED</option>
					<option value="PAID" class="form-select-button">PAID</option>
					<option value="CANCELED" class="form-select-button">CANCELED</option>
				</select> <input type="submit" class="btn btn-outline-dark" value="OK">
			</form>
		</div>
	</div>
</div>