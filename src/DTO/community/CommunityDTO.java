package DTO.community;

import java.sql.Timestamp;

public class CommunityDTO {
	private int communityNo;
	private String communityTitle;
	private String communityContent;
	private int communityViews;
	private Timestamp communityDate;
	private int IQCNo;
	private String customer_id;
	private int customer_no;
	private String communityfileurl;
	private String communityimgurl;
	private String communityanswer;
	
	public int getCommunityNo() {
		return communityNo;
	}
	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}
	public String getCommunityTitle() {
		return communityTitle;
	}
	public void setCommunityTitle(String communityTitle) {
		this.communityTitle = communityTitle;
	}
	public String getCommunityContent() {
		return communityContent;
	}
	public void setCommunityContent(String communityContent) {
		this.communityContent = communityContent;
	}
	public int getCommunityViews() {
		return communityViews;
	}
	public void setCommunityViews(int communityViews) {
		this.communityViews = communityViews;
	}
	public Timestamp getCommunityDate() {
		return communityDate;
	}
	public void setCommunityDate(Timestamp communityDate) {
		this.communityDate = communityDate;
	}
	public int getIQCNo() {
		return IQCNo;
	}
	public void setIQCNo(int iQCNo) {
		IQCNo = iQCNo;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public int getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}
	public String getCommunityfileurl() {
		return communityfileurl;
	}
	public void setCommunityfileurl(String communityfileurl) {
		this.communityfileurl = communityfileurl;
	}
	public String getCommunityimgurl() {
		return communityimgurl;
	}
	public void setCommunityimgurl(String communityimgurl) {
		this.communityimgurl = communityimgurl;
	}
	public String getCommunityanswer() {
		return communityanswer;
	}
	public void setCommunityanswer(String communityanswer) {
		this.communityanswer = communityanswer;
	}
}
