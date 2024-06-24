package DTO.mypage;

import java.sql.Timestamp;

public class ProductInquiryDTO {
	String pi_title;
	String pi_content;
	Timestamp pi_date;
	int order_no;
	int category_no;
	String pi_answer;
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
	public Timestamp getPi_date() {
		return pi_date;
	}
	public void setPi_date(Timestamp pi_date) {
		this.pi_date = pi_date;
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
	public String getPi_answer() {
		return pi_answer;
	}
	public void setPi_answer(String pi_answer) {
		this.pi_answer = pi_answer;
	}
}
