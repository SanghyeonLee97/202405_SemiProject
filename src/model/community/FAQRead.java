package model.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FAQRead extends Community{
	
	String communityFAQNo;
	
	public FAQRead(String communityFAQNo) {
		this.communityFAQNo=communityFAQNo;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		req.setAttribute("read", cdao.getFAQPost(communityFAQNo));
		return "/community/community_FAQ_read.jsp";
	}

}
