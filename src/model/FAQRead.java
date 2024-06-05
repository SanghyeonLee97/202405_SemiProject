package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CommunityFAQDTO;
import dao.CommunityDAO;

public class FAQRead implements CommandProsessor{
	
	String communityFAQNo;
	
	public FAQRead(String communityFAQNo) {
		this.communityFAQNo=communityFAQNo;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		CommunityDAO cdao = new CommunityDAO();
		CommunityFAQDTO cfdto = cdao.getFAQPost(communityFAQNo);
		req.setAttribute("read", cfdto);
		return "/community/community_FAQ_read.jsp";
	}

}
