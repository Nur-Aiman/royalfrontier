<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta tags, title, and other head content will go here -->

    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Enhanced styles -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .container-xxl {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
        }

        table {
            transition: all 0.5s ease;
            transform: translateY(20px);
            opacity: 0;
        }

        th {
            background-color: #333;
            color: #fff;
            border: none;
            padding: 15px;
        }

        td {
            padding: 10px 15px;
            border-top: 1px solid #eaeaea;
        }

        h2 {
            color: #444;
            border-bottom: 2px solid #444;
            padding-bottom: 10px;
            display: inline-block;
        }
    </style>
</head>

<body>

    <div class="container-xxl py-5 d-flex justify-content-center">
    <div style="max-width: 1000px; width: 100%;">
        <h2 class="text-center mb-4">All Reservations</h2>
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Date & Time</th>
                    <th>Table Number</th>
                    <th>Special Request</th>
                </tr>
            </thead>
            <tbody id="reservationsTbody">
                <!-- Data will be dynamically inserted here -->
            </tbody>
        </table>
    </div>
</div>

    <script>
        $(document).ready(function() {
            $.ajax({
                url: '../ViewReservation', 
                method: 'GET',
                dataType: 'json',
                success: function(reservations) {
                    // Sort the reservations by date (newest first)
                    reservations.sort((a, b) => new Date(b.dateAndTime) - new Date(a.dateAndTime));

                    let reservationsHtml = '';
                    reservations.forEach(function(reservation) {
                        reservationsHtml += `<tr>
                            <td>${reservation.name}</td>
                            <td>${reservation.email}</td>
                            <td>${reservation.phoneNumber}</td>
                            <td>${reservation.dateAndTime}</td>
                            <td>${reservation.tableNumber}</td>
                            <td>${reservation.specialRequest}</td>
                        </tr>`;
                    });
                    $('#reservationsTbody').html(reservationsHtml);
                    // Add an animation for the table when data loads
                    $("table").css({ transform: "translateY(0)", opacity: "1" });
                },
                error: function(error) {
                    console.log("Failed to fetch reservations:", error);
                }
            });
        });
    </script>

</body>
</html>
