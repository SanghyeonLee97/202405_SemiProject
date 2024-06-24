package DTO.mypage;

public class MyPageReserveDTO {
	int order_no;
	int point_no;
	int point_status;
	int point_amount;
	int orderproduct_customer_no;
	int orderproduct_product_no;
	String product_name;
	public int getPoint_no() {
		return point_no;
	}
	public void setPoint_no(int point_no) {
		this.point_no = point_no;
	}
	public int getPoint_amount() {
		return point_amount;
	}
	public void setPoint_amount(int point_amount) {
		this.point_amount = point_amount;
	}
	public int getOrderproduct_customer_no() {
		return orderproduct_customer_no;
	}
	public void setOrderproduct_customer_no(int orderproduct_customer_no) {
		this.orderproduct_customer_no = orderproduct_customer_no;
	}
	public int getOrderproduct_product_no() {
		return orderproduct_product_no;
	}
	public void setOrderproduct_product_no(int orderproduct_product_no) {
		this.orderproduct_product_no = orderproduct_product_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getPoint_status() {
		return point_status;
	}
	public void setPoint_status(int point_status) {
		this.point_status = point_status;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	
}
