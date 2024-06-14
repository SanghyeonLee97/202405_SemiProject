package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommunityDAO;

public class QNADelete implements CommandProsessor{
	
	String board;
	int QNANo;
	
	public QNADelete(String board,int QNANo) {
		this.board=board;
		this.QNANo=QNANo;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		CommunityDAO cdao = new CommunityDAO();
		cdao.QNADelete(board,QNANo);
		return "/community/community_QNA.jsp";
	}

}
