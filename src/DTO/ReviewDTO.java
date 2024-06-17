package DTO;

import java.util.Date;

public class ReviewDTO {
	private long review_no;
	private Date purchase_date;
	private String review_title;
	private String review_content;
	private float review_rating;
	private long product_no;
	private long customer_no;
	private String customer_name;
	
	
	public long getReview_no() {
		return review_no;
	}
	public void setReview_no(long review_no) {
		this.review_no = review_no;
	}
	public Date getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(Date purchase_date) {
		this.purchase_date = purchase_date;
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
	public float getReview_rating() {
		return review_rating;
	}
	public void setReview_rating(float review_rating) {
		this.review_rating = review_rating;
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
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	
	
}
