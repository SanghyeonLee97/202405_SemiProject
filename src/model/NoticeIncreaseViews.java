package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommunityDAO;

public class NoticeIncreaseViews implements CommandProsessor{
	String communityNoticeNo;
	String communityBoard;
	
	public NoticeIncreaseViews(String communityNoticeNo,String communityBoard) {
		this.communityNoticeNo=communityNoticeNo;
		this.communityBoard=communityBoard;
	}
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		CommunityDAO cdao = new CommunityDAO();
		cdao.communityIncreaseViews(communityBoard,communityNoticeNo);
		return "/community/community_notice_read.jsp";
	}

}
