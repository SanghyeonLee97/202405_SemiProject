

function updateTotalPrice() {
    let price = productPrice;
    let quantity = parseInt($("#quantity").val());
    let totalPrice = price * quantity;
    $("#totalPrice").text(totalPrice + "원");
}

function changeQuantity(delta) {
	let quantityInput = $("#quantity");
	let currentQuantity = parseInt(quantityInput.val());
    let newQuantity = currentQuantity + delta;
    if (newQuantity < 1) {
        newQuantity = 1;
    }
    quantityInput.val(newQuantity);
    updateTotalPrice();
}


function showSection(sectionId) {
	$(".detail-section > article").removeClass('active');
	$("#" + sectionId).addClass('active');
}


function toggleContent(index) {
	let contentRow = $('#content-' + index);
	if (contentRow.css('display') === 'none') {
		contentRow.css('display', 'table-row');
	} else {
    	contentRow.css('display', 'none');
	}
}


function loadReviews(pageNum){
	$.ajax({
		type: "GET",
		url: "loadReviews.do",
		data: {
			page: pageNum
		},
		success: function(response) {
			$("#review-content").html(response);
		},
		error: function(xhr, status, error) {
			console.error("AJAX 호출 오류 발생", status, error);
		}
	});
}


function loadQna(pageNum){
	$.ajax({
        type: "GET",
        url: "loadQna.do",
        data: {
            page: pageNum
        },
        success: function(response) {
            $("#qna-content").html(response);
        },
        error: function(xhr, status, error) {
            console.error("AJAX 호출 오류 발생", status, error);
        }
    });
}

function buyNow() {
	let quantity = $("#quantity").val();
    window.location.href = "orderPayment.do?product_no=" + productNo + "&product_quantity=" + quantity;
}