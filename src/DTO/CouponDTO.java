package DTO;

import java.util.Date;

public class CouponDTO {
	private long coupon_no;
	private String coupon_name;
	private String coupon_limit;
	private int coupon_discount;
	private long product_no;
	private long customer_no;
	private long quantity;
	private Date coupon_duedate;
	
	
	public long getCoupon_no() {
		return coupon_no;
	}
	public void setCoupon_no(long coupon_no) {
		this.coupon_no = coupon_no;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public String getCoupon_limit() {
		return coupon_limit;
	}
	public void setCoupon_limit(String coupon_limit) {
		this.coupon_limit = coupon_limit;
	}
	public int getCoupon_discount() {
		return coupon_discount;
	}
	public void setCoupon_discount(int coupon_discount) {
		this.coupon_discount = coupon_discount;
	}
	public long getProduct_no() {
		return product_no;
	}
	public void setProduct_no(long product_no) {
		this.product_no = product_no;
	}
	public long getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(long customer_no) {
		this.customer_no = customer_no;
	}
	public long getQuantity() {
		return quantity;
	}
	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}
	public Date getCoupon_duedate() {
		return coupon_duedate;
	}
	public void setCoupon_duedate(Date coupon_duedate) {
		this.coupon_duedate = coupon_duedate;
	}
	
	
}
