package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DTO.CommunityQNADTO;
import dao.CommunityDAO;

public class QNAWrite implements CommandProsessor{
	
	CommunityQNADTO cqdto = new CommunityQNADTO();
	
	public QNAWrite(CommunityQNADTO cqdto) {
		this.cqdto = cqdto;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		CommunityDAO cdao = new CommunityDAO();
		HttpSession session = req.getSession();
		String customerId = (String) session.getAttribute("id");
		cqdto.setCustomer_no(cdao.getCustomerNo(customerId));
		cdao.QNAWrite(cqdto);
		
		return "/community/community_QNA.jsp";
	}

}
