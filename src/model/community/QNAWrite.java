package model.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.community.CommunityQNADTO;

public class QNAWrite extends Community{
	
	CommunityQNADTO cqdto = new CommunityQNADTO();
	
	public QNAWrite(CommunityQNADTO cqdto) {
		this.cqdto = cqdto;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		session = req.getSession();
		String customerId = (String) session.getAttribute("id");
		cqdto.setCustomer_no(cdao.getCustomerNo(customerId));
		cdao.QNAWrite(cqdto);
		
		return "/community/community_QNA.jsp";
	}

}
