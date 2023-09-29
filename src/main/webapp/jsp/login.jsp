<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Login Form</title>
 
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }

        .login-container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0px 0px 5px #aaaaaa;
        }

        .btn-secondary {
            background-color: #007BFF;
            border-color: #007BFF;
        }

        .btn-secondary:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>

    <div class="container">
        <div class="login-container">
            <h2>Login Page</h2>

            <% 
            String message = (String) session.getAttribute("loginStatus");
            if (message != null) {
            %>
            <div class="alert alert-danger"><%= message %></div>
            <% 
            session.removeAttribute("loginStatus");  // clear the message after displaying
            }
            %>

            <form action="../Login" method="post">
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="text" class="form-control" id="email" name="email" placeholder="Enter Your Email">
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password">
                </div>
                <input type="submit" class="btn btn-primary" value="Login">
            </form>
            <br>
       
            <a href="register.jsp" class="btn btn-secondary">New user? Register here</a>
        </div>
    </div>

 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

</html>
