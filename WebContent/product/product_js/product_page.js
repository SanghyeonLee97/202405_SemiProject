

function updateTotalPrice() {
    let price = productPrice;
    let quantity = parseInt(document.getElementById("quantity").value);
    let totalPrice = price * quantity;
    document.getElementById("totalPrice").innerText = totalPrice + "원";
}

function changeQuantity(delta) {
    let quantityInput = document.getElementById("quantity");
    let currentQuantity = parseInt(quantityInput.value);
    let newQuantity = currentQuantity + delta;
    if (newQuantity < 1) {
        newQuantity = 1;
    }
    quantityInput.value = newQuantity;
    updateTotalPrice();
}

function addToCart() {
    let productNo = productNo;
    let quantity = document.getElementById("quantity").value;

    let xhr = new XMLHttpRequest();
    xhr.open("post", "insertCart.do", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            alert("장바구니에 추가되었습니다.");
        }
    };
    xhr.send("product_no=" + productNo + "&product_quantity=" + quantity);
}

function buyNow() {
    let productNo = productNo;
    let quantity = document.getElementById("quantity").value;
    window.location.href = "orderPayment.do?product_no=" + productNo + "&product_quantity=" + quantity;
}

function showSection(sectionId) {
    let sections = document.querySelectorAll(".detail-section > article");
    sections.forEach(section => {
        section.classList.remove('active');
    });
    document.getElementById(sectionId).classList.add('active');
}

function toggleContent(index) {
    let contentRow = document.getElementById('content-' + index);
    if (contentRow.style.display === 'none') {
        contentRow.style.display = 'table-row';
    } else {
        contentRow.style.display = 'none';
    }
}