package DTO.community;

import java.sql.Timestamp;

public class CommunityQNADTO {
	private int qna_no;
	private String qna_title;
	private String qna_content;
	private String qna_fileurl;
	private String qna_imgurl;
	private Timestamp qna_date;
	private String qna_answer;
	private int customer_no;
	private String customer_id;
	private int iqc_no;
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_fileurl() {
		return qna_fileurl;
	}
	public void setQna_fileurl(String qna_fileurl) {
		this.qna_fileurl = qna_fileurl;
	}
	public String getQna_imgurl() {
		return qna_imgurl;
	}
	public void setQna_imgurl(String qna_imgurl) {
		this.qna_imgurl = qna_imgurl;
	}
	public Timestamp getQna_date() {
		return qna_date;
	}
	public void setQna_date(Timestamp qna_date) {
		this.qna_date = qna_date;
	}
	public String getQna_answer() {
		return qna_answer;
	}
	public void setQna_answer(String qna_answer) {
		this.qna_answer = qna_answer;
	}
	public int getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}
	public int getIqc_no() {
		return iqc_no;
	}
	public void setIqc_no(int iqc_no) {
		this.iqc_no = iqc_no;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
}
