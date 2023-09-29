<html>

<head>
    <title>Add New User</title>
</head>

<body>
    <h2>Add New Users</h2>

    <form action="http://localhost:8070/users/addUser" method="post">
        <label for="name">Name:</label><br>
        <input type="text" id="name" name="name" required><br><br>

        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email" required><br><br>

    

        <input type="submit" value="Submit">
    </form>
</body>

</html>
