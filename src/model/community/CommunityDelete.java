package model.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommunityDelete extends Community{
	
	String board;
	int QNANo;
	
	public CommunityDelete(String board,int QNANo) {
		this.board=board;
		this.QNANo=QNANo;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		cdao.communityDelete(board,QNANo);
		if(board.equals("qna")) {
			return "/community/community_QNA.jsp";
		}else if(board.equals("faq")) {
			return "/community/community_FAQ.jsp";
		}else {
			return "/community/community_notice.jsp";
		}
	}

}
