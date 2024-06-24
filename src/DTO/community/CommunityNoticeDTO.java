package DTO.community;

import java.sql.Timestamp;

public class CommunityNoticeDTO {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private int noticeViews;
	private Timestamp noticeDate;
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public int getNoticeViews() {
		return noticeViews;
	}
	public void setNoticeViews(int noticeViews) {
		this.noticeViews = noticeViews;
	}
	public Timestamp getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Timestamp noticeDate) {
		this.noticeDate = noticeDate;
	}
}
