package DTO.product;

import java.util.Date;

public class OrderDTO {
	private long order_no; 
	private long customer_no; 
	private long product_no; 
	private long coupon_no; 
	private long order_quantity; 
	private int status; 
	private Date order_date;
	
	
	public long getOrder_no() {
		return order_no;
	}
	public void setOrder_no(long order_no) {
		this.order_no = order_no;
	}
	public long getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(long customer_no) {
		this.customer_no = customer_no;
	}
	public long getProduct_no() {
		return product_no;
	}
	public void setProduct_no(long product_no) {
		this.product_no = product_no;
	}
	public long getCoupon_no() {
		return coupon_no;
	}
	public void setCoupon_no(long coupon_no) {
		this.coupon_no = coupon_no;
	}
	public long getOrder_quantity() {
		return order_quantity;
	}
	public void setOrder_quantity(long order_quantity) {
		this.order_quantity = order_quantity;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	
	
}
