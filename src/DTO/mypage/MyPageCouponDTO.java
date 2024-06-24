package DTO.mypage;

import java.sql.Date;

public class MyPageCouponDTO {
	String coupon_name;
	int coupon_discount;
	String coupon_limit;
	Date coupon_duedate;
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public int getCoupon_discount() {
		return coupon_discount;
	}
	public void setCoupon_discount(int coupon_discount) {
		this.coupon_discount = coupon_discount;
	}
	public String getCoupon_limit() {
		return coupon_limit;
	}
	public void setCoupon_limit(String coupon_limit) {
		this.coupon_limit = coupon_limit;
	}
	public Date getCoupon_duedate() {
		return coupon_duedate;
	}
	public void setCoupon_duedate(Date coupon_duedate) {
		this.coupon_duedate = coupon_duedate;
	}
}
