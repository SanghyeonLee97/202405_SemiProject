package DTO.community;

import java.sql.Timestamp;

public class CommunityDTO {
	private int communityNo;
	private String communityTitle;
	private String communityContent;
	private int communityViews;
	private Timestamp communityDate;
	private int IQCNo;
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
}
