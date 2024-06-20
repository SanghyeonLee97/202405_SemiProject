package model.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeRead extends Community{
	String communityNoticeNo;
	
	public NoticeRead(String communityNoticeNo,String communityBoard) {
		this.communityNoticeNo=communityNoticeNo;
	}
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//조회수상승
		cdao.communityIncreaseViews(communityNoticeNo);
		//글제목,내용 객체생성
		req.setAttribute("read", cdao.getNoticePost(communityNoticeNo));
		return "/community/community_notice_read.jsp";
	}

}
