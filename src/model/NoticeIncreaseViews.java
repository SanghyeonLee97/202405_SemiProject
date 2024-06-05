package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommunityDAO;

public class NoticeIncreaseViews implements CommandProsessor{
	String communityNoticeNo;
	
	public NoticeIncreaseViews(String communityNoticeNo) {
		this.communityNoticeNo=communityNoticeNo;
	}
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		CommunityDAO cdao = new CommunityDAO();
		cdao.noticeIncreaseViews(communityNoticeNo);
		return "/community/community_notice_read.jsp";
	}

}
