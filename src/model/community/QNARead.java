package model.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QNARead extends Community{
	
	String communityQNANo;
	
	public QNARead(String communityQNANo) {
		this.communityQNANo=communityQNANo;
	}
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		req.setAttribute("read", cdao.getQNAPost(communityQNANo));
		return "/community/community_QNA_read.jsp";
	}

}
