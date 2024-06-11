package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommunityDAO;

public class QNADelete implements CommandProsessor{
	
	int QNANo;
	
	public QNADelete(int QNANo) {
		this.QNANo=QNANo;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		CommunityDAO cdao = new CommunityDAO();
		cdao.QNADelete(QNANo);
		return "/community/community_QNA.jsp";
	}

}
