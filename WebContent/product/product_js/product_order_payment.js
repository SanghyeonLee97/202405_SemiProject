

$(document).ready(function() {
	$('select[name="couponName"]').change(updateDiscount);
	$('input[name="pointUsage"]').on('input', updateDiscount);
	$('button[name="useAllPoints"]').click(function() {
		$('input[name="pointUsage"]').val(customerPoint);
		updateDiscount();
	});
});


function updateDiscount() {
	let selectedCouponValue = $('select[name="couponName"] option:selected').data('discount');
	let pointValue = parseInt($('input[name="pointUsage"]').val()) || 0;
	let maxPoints = parseInt($('#maxPoints').val());
	
	//보유한 적립금보다 큰 금액을 입력할 경우
	if (pointValue > maxPoints) {
		alert('보유한 적립금보다 많이 사용할 수 없습니다.');
		$('input[name="pointUsage"]').val(maxPoints);
		pointValue = maxPoints;
	}
	
	let productPrice = parseInt($('#productPrice').val());
	let productQuantity = parseInt($('#productQuantity').val());
	let automaticDiscount = 8000;
	
	let couponDiscount = parseInt(selectedCouponValue) || 0;
	let totalDiscount = automaticDiscount + couponDiscount + pointValue;
	let totalPrice = (productPrice * productQuantity) - totalDiscount;
	
	// 총 결제금액이 음수가 되지 않도록 처리
    if (totalPrice < 0) {
        alert('할인 및 적립금을 사용한 총 결제금액은 0원 이상이어야 합니다.');
        pointValue = pointValue - Math.abs(totalPrice);
        totalDiscount = automaticDiscount + couponDiscount + pointValue;
        totalPrice = 0;
        $('input[name="pointUsage"]').val(pointValue);
    }
    
	$('#totalDiscount').text(totalDiscount + '원');
    $('#totalPrice').text(totalPrice + '원');
}