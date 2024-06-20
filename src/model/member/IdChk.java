package model.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IdChk extends Member{
	String registerId;
	
	public IdChk(String registerId) {
		this.registerId=registerId;
	}
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		req.setAttribute("YN", mdao.customerIdChk(registerId));
		return "/member/idchk.jsp";
	}

}
