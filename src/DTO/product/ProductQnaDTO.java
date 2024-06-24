package DTO.product;

import java.sql.Timestamp;

public class ProductQnaDTO {
	private String customer_name;
	private String pi_title;
	private String pi_content;
	private Timestamp pi_date;
	private String pi_answer;
	private int category_no;
	
	
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
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
	public String getPi_answer() {
		return pi_answer;
	}
	public void setPi_answer(String pi_answer) {
		this.pi_answer = pi_answer;
	}
	public int getCategory_no() {
		return category_no;
	}
	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
	
	
}
