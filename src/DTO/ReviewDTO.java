package DTO;

import java.sql.Timestamp;
import java.util.Date;

public class ReviewDTO {
	private long review_no;
	private String review_title;
	private String review_content;
	private int review_rating;
	private Timestamp review_date;
	private long order_no;
	private long customer_no;
	private String customer_name;
	
	public long getReview_no() {
		return review_no;
	}
	public void setReview_no(long review_no) {
		this.review_no = review_no;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_rating() {
		return review_rating;
	}
	public void setReview_rating(int review_rating) {
		this.review_rating = review_rating;
	}
	public Timestamp getReview_date() {
		return review_date;
	}
	public void setReview_date(Timestamp review_date) {
		this.review_date = review_date;
	}
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
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	
}