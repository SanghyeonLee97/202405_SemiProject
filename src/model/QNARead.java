package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommunityDAO;

public class QNARead implements CommandProsessor{
	
	String communityQNANo;
	
	public QNARead(String communityQNANo) {
		this.communityQNANo=communityQNANo;
	}
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		CommunityDAO cdao = new CommunityDAO();
		req.setAttribute("read", cdao.getQNAPost(communityQNANo));
		return "/community/community_QNA_read.jsp";
	}

}
