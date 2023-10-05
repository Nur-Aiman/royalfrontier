// Sample menu items (replace with your actual menu items)
const menuItems = [
    { id: 1, name: "Item 1", price: 10.99, quantity: 0 },
    { id: 2, name: "Item 2", price: 12.99, quantity: 0 },
    // Add more menu items as needed
];

// Function to calculate and update the total price
function updateTotalPrice() {
    let totalPrice = 0;
    for (const item of menuItems) {
        totalPrice += item.price * item.quantity;
    }
    document.getElementById("totalPrice").textContent = `Total Price: RM ${totalPrice.toFixed(2)}`;
}

// Function to update the order summary and quantities
function updateOrderSummary() {
    const orderSummary = document.getElementById("orderSummary");
    orderSummary.innerHTML = "";

    for (const item of menuItems) {
        if (item.quantity > 0) {
            const itemRow = document.createElement("div");
            itemRow.innerHTML = `${item.name} (RM ${item.price.toFixed(2)} each) x ${item.quantity}`;
            orderSummary.appendChild(itemRow);
        }
    }
}

// Function to handle payment method selection
function handlePaymentMethodSelection() {
    const paymentMethod = document.querySelector('input[name="paymentMethod"]:checked').value;
    return paymentMethod;
}

// Function to send order details to the hidden input as JSON
function updateHiddenOrderDetails() {
    const orderDetails = menuItems.filter(item => item.quantity > 0);
    document.getElementById("orderDetails").value = JSON.stringify(orderDetails);
}

// Attach click event listener to the form submission
document.querySelector("form").addEventListener("submit", () => {
    const paymentMethod = handlePaymentMethodSelection();
    updateHiddenOrderDetails();
});

// Initialize the page
updateOrderSummary();
updateTotalPrice();
