package DTO.mypage;

public class MyPageHeaderDTO {
	int customer_point;
	int review_count;
	int order_count;
	int coupon_count;
	public int getCustomer_point() {
		return customer_point;
	}
	public void setCustomer_point(int customer_point) {
		this.customer_point = customer_point;
	}
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	public int getOrder_count() {
		return order_count;
	}
	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}
	public int getCoupon_count() {
		return coupon_count;
	}
	public void setCoupon_count(int coupon_count) {
		this.coupon_count = coupon_count;
	}
}
