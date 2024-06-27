package model.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeRead extends Community{
	String communityNoticeNo;
	
	//읽을 게시글 번호 생성자
	public NoticeRead(String communityNoticeNo,String communityBoard) {
		this.communityNoticeNo=communityNoticeNo;
	}
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//읽을 게시글 번호의 조회수상승
		cdao.communityIncreaseViews(communityNoticeNo);
		//읽을 게시글 번호의 게시글 정보를 불러와 read 객체에 저장
		req.setAttribute("read", cdao.getCommunityPost("notice",communityNoticeNo));
		return "/community/community_notice_read.jsp";
	}

}
