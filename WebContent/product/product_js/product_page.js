

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

function addToCart() {
	let quantity = $("#quantity").val();
    $.ajax({
        type: "POST",
        url: "insertCart.do",
        data: {
            product_no: productNo,
            product_quantity: quantity
        },
        success: function(response) {
            alert("장바구니에 추가되었습니다.");
        },
        error: function(xhr, status, error) {
        	if (xhr.status === 401){
        		alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
        		window.location.href = "/projectdengdeng/member/login.jsp";
        	}else{
        		console.error("AJAX 호출 오류 발생", status, error);
        	}
            
        }
    });
}