package model.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommunityDelete extends Community{
	
	String board;
	int communityNo;
	
	//게시판종류와 삭제할 게시글번호 생성자
	public CommunityDelete(String board,int communityNo) { 
		this.board=board;
		this.communityNo=communityNo;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//삭제 실행
		cdao.communityDelete(board,communityNo);
		//게시판 종류가 qna라면
		if(board.equals("qna")) {
			//qna로
			return "/community/community_qna.jsp";
		}else if(board.equals("faq")) {
			return "/community/community_faq.jsp";
		}else {
			return "/community/community_notice.jsp";
		}
	}

}
