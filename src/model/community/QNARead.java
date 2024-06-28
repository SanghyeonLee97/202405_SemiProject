package model.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QNARead extends Community{
	
	String communityQNANo;
	
	//읽을 게시글 번호 생성자
	public QNARead(String communityQNANo) {
		this.communityQNANo=communityQNANo;
	}
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//읽을 게시글 번호의 게시글 정보를 불러와 read 객체에 저장
		req.setAttribute("read", cdao.getCommunityPost("qna",communityQNANo));
		return "/community/community_QNA_read.jsp";
	}

}
