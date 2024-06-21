package model.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.community.CommunityFAQDTO;

public class FAQWrite extends Community{
	
	CommunityFAQDTO cfdto = new CommunityFAQDTO();
	
	public FAQWrite(CommunityFAQDTO cfdto) {
		this.cfdto = cfdto;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		cdao.faqWrite(cfdto);
		return "/admin.jsp";
	}

}
