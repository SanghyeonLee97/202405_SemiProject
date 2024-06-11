package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CommunityFAQDTO;
import dao.CommunityDAO;

public class FAQWrite implements CommandProsessor{
	
	CommunityFAQDTO cfdto = new CommunityFAQDTO();
	
	public FAQWrite(CommunityFAQDTO cfdto) {
		this.cfdto = cfdto;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		CommunityDAO cdao = new CommunityDAO();
		cdao.faqWrite(cfdto);
		return "/admin.jsp";
	}

}
