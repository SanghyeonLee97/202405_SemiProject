package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CommunityNoticeDTO;
import dao.CommunityDAO;

public class NoticeRead implements CommandProsessor{
	String communityNoticeNo;
	
	public NoticeRead(String communityNoticeNo,String communityBoard) {
		this.communityNoticeNo=communityNoticeNo;
	}
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		CommunityDAO cdao = new CommunityDAO();
		//조회수상승
		cdao.communityIncreaseViews(communityNoticeNo);
		//글제목,내용 객체생성
		CommunityNoticeDTO cndto=cdao.getNoticePost(communityNoticeNo);
		
		req.setAttribute("read", cndto);
		return "/community/community_notice_read.jsp";
	}

}
