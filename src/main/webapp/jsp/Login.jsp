<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>RF - Login</title>


<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">

<link href="../css/login.css" rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js">

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</head>


<body>

	<a  href="../index.jsp" class="logo" target="_blank"> <img style="width: 20%; height: 20%;"
		src="https://i.imgur.com/jLxNPym.png" alt="">
	</a>


	<!--             <form action="../Login" method="post"> -->
	<!--                 <div class="form-group"> -->
	<!--                     <label for="email">Email:</label> -->
	<!--                     <input type="text" class="form-control" id="email" name="email" placeholder="Enter Lah Email"> -->
	<!--                 </div> -->
	<!--                 <div class="form-group"> -->
	<!--                     <label for="password">Password:</label> -->
	<!--                     <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password"> -->
	<!--                 </div> -->
	<!--                 <input type="submit" class="btn btn-primary" value="Login"> -->
	<!--             </form> -->



	<div style="background-color: black;" class="section">
		<div class="container">
			<div class="row full-height justify-content-center">
				<div class="col-12 text-center align-self-center py-5">
					<div class="section pb-5 pt-5 pt-sm-2 text-center">
						<h6 class="mb-0 pb-3">
							<span style="color:white;">Log In </span><span  style="color:white;">Sign Up</span>
						</h6>
						<input class="checkbox" type="checkbox" id="reg-log"
							name="reg-log" /> <label for="reg-log"></label>
						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">
								<div class="card-front">
									<div class="center-wrap">
										<div class="section text-center">
											<h4 class="mb-4 pb-3"  style="color:white;">Log In</h4>
											<form action="../Login" method="post">
												<div class="form-group">
													<input type="email" name="email" class="form-style"
														placeholder="Enter Email" id="logemail" autocomplete="off">
													<i class="input-icon uil uil-at"></i>
												</div>
												<div class="form-group mt-2">
													<input type="password" name="password" class="form-style"
														placeholder="Enter Password" id="logpass"
														autocomplete="off"> <i
														class="input-icon uil uil-lock-alt"></i>
												</div>
												<input  style="background-color:yellow;  color:black" type="submit" class="btn btn-primary" value="Login">
												<!-- 											<a href="#" class="btn mt-4">submit</a> -->
											</form>
<!-- 											<p class="mb-0 mt-4 text-center"> -->
<!-- 												<a href="#0" class="link">Forgot your password?</a> -->
<!-- 											</p> -->
										</div>
									</div>
								</div>
								<div class="card-back">
									<div class="center-wrap">
										<div class="section text-center">
											<h4 class="mb-4 pb-3"  style="color:white;">Sign Up</h4>
											<form action="../Register" method="post">
    <div class="form-group">
        <input type="text" name="name" class="form-style" placeholder="Your Full Name" id="logname" autocomplete="off">
        <i class="input-icon uil uil-user"></i>
    </div>
    <div class="form-group mt-2">
        <input type="email" name="email" class="form-style" placeholder="Your Email" id="logemail" autocomplete="off">
        <i class="input-icon uil uil-at"></i>
    </div>
    <div class="form-group mt-2">
        <input type="password" name="password" class="form-style" placeholder="Your Password" id="logpass" autocomplete="off">
        <i class="input-icon uil uil-lock-alt"></i>
    </div>
    <!-- Add a phone number field -->
    <div class="form-group mt-2">
        <input type="tel" name="phone" class="form-style" placeholder="Your Phone Number" id="logphone" autocomplete="off">
        <i class="input-icon uil uil-phone"></i>
    </div>
    <input style="color:black; background-color:yellow;" type="submit" value="Register" class="btn mt-4">
</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>
