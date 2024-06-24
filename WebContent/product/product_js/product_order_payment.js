

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
	
	$('#totalDiscount').text(totalDiscount + '원');
    $('#totalPrice').text(totalPrice + '원');
}