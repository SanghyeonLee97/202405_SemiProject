package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

public class IdChk implements CommandProsessor{
	String registerId;
	
	public IdChk(String registerId) {
		this.registerId=registerId;
	}
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		MemberDAO mdao = new MemberDAO();
		req.setAttribute("YN", mdao.customerIdChk(registerId));
		return "/member/idchk.jsp";
	}

}
