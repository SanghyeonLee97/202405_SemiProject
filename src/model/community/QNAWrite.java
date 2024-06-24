package model.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.community.CommunityQNADTO;

public class QNAWrite extends Community{
	
	CommunityQNADTO cqdto = new CommunityQNADTO();
	
	//QNA에 입력할 정보객체를 불러오는 생성자
	public QNAWrite(CommunityQNADTO cqdto) {
		this.cqdto = cqdto;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//세션을 호출하고 유저id를 가져온다
		session = req.getSession();
		String customerId = (String) session.getAttribute("id");
		//정보객체의 유저번호에 세션으로 호출한 유저id를 넣는다
		cqdto.setCustomer_no(cdao.getCustomerNo(customerId));
		//정보객체에 담긴 정보를 이용해 notice작성
		cdao.QNAWrite(cqdto);
		
		return "/community/community_QNA.jsp";
	}

}
