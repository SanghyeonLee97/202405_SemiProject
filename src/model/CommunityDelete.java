package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommunityDAO;

public class CommunityDelete implements CommandProsessor{
	
	String board;
	int QNANo;
	
	public CommunityDelete(String board,int QNANo) {
		this.board=board;
		this.QNANo=QNANo;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		CommunityDAO cdao = new CommunityDAO();
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
