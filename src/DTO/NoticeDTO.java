package DTO;

import java.sql.Timestamp;

public class NoticeDTO {
	private int noticeNoticeNo;
    private int noticeCategoryNo;
    private String noticeTitle;
    private String noticeContent;
    private Timestamp noticeRegistrationDate;
    private int noticeViews;
	public int getNoticeNoticeNo() {
		return noticeNoticeNo;
	}
	public void setNoticeNoticeNo(int noticeNoticeNo) {
		this.noticeNoticeNo = noticeNoticeNo;
	}
	public int getNoticeCategoryNo() {
		return noticeCategoryNo;
	}
	public void setNoticeCategoryNo(int noticeCategoryNo) {
		this.noticeCategoryNo = noticeCategoryNo;
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
	public Timestamp getNoticeRegistrationDate() {
		return noticeRegistrationDate;
	}
	public void setNoticeRegistrationDate(Timestamp noticeRegistrationDate) {
		this.noticeRegistrationDate = noticeRegistrationDate;
	}
	public int getNoticeViews() {
		return noticeViews;
	}
	public void setNoticeViews(int noticeViews) {
		this.noticeViews = noticeViews;
	}
}
