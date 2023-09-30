<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menu</title>
    <style>
     
        body {
            font-family: Arial, sans-serif;
            padding: 40px;
            background-color: #f7f7f7;
        }

        h2 {
            margin-bottom: 20px;
            color: #444;
        }

  
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 0 auto;
            background-color: #fff;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            border: 1px solid #e0e0e0;
            padding: 10px 15px;
            text-align: left;
        }

        th {
            background-color: #007BFF;
            color: #fff;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
    <script>
    window.onload = function() {
        let cart = {};

        fetch('http://localhost:8079/royalfrontier/GetMenu') 
            .then(response => response.json())
            .then(menuData => {
                const tableBody = document.getElementById('menuTableBody');
                
                menuData.forEach(menu => {
                    let row = tableBody.insertRow();

                    let cellId = row.insertCell(0);
                    let cellMenu = row.insertCell(1);
                    let cellPrice = row.insertCell(2);
                    let cellAction = row.insertCell(3); 

                    cellId.innerHTML = menu.id;
                    cellMenu.innerHTML = menu.menu;
                    cellPrice.innerHTML = menu.price;

         
                    let addButton = document.createElement('button');
                    addButton.textContent = 'Add';
                    addButton.addEventListener('click', function() {
                        if(cart[menu.id]) {
                            cart[menu.id].quantity += 1; 
                        } else {
                            cart[menu.id] = {
                                id: menu.id,
                                name: menu.menu,
                                price: menu.price,
                                quantity: 1
                            };
                        }
                        renderCart(); 
                    });
                    cellAction.appendChild(addButton);
                });
            })
            .catch(error => console.error('Error fetching menu data:', error));
        
   
        function renderCart() {
            const cartList = document.getElementById('cartList');
            cartList.innerHTML = ''; 

            for (const itemId in cart) {
                let listItem = document.createElement('li');
                listItem.textContent = `${cart[itemId].name} - Quantity: ${cart[itemId].quantity} - Price: ${cart[itemId].price}`;
                cartList.appendChild(listItem);
            }
        }
    }

    </script>
</head>
<body>

<h2>Restaurant Menu</h2>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Menu Item</th>
            <th>Price</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody id="menuTableBody">
    </tbody>
</table>

<h2>Cart</h2>
<ul id="cartList">
</ul>

</body>
</html>
