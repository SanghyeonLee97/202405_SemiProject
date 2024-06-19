package DTO;

import java.sql.Date;

public class ProductInquiryDTO {
	String pi_title;
	String pi_content;
	Date pi_date;
	int pi_status;
	int order_no;
	int category_no;
	public String getPi_title() {
		return pi_title;
	}
	public void setPi_title(String pi_title) {
		this.pi_title = pi_title;
	}
	public String getPi_content() {
		return pi_content;
	}
	public void setPi_content(String pi_content) {
		this.pi_content = pi_content;
	}
	public Date getPi_date() {
		return pi_date;
	}
	public void setPi_date(Date pi_date) {
		this.pi_date = pi_date;
	}
	public int getPi_status() {
		return pi_status;
	}
	public void setPi_status(int pi_status) {
		this.pi_status = pi_status;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getCategory_no() {
		return category_no;
	}
	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
}
