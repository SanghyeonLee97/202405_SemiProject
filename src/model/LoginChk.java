package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;

public class LoginChk implements CommandProsessor{
	
	String loginId;
	String loginPassword;
	
	public LoginChk(String loginId,String loginPassword) {
		this.loginId=loginId;
		this.loginPassword=loginPassword;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		MemberDAO mdao = new MemberDAO();
		if(mdao.customerLoginChk(loginId, loginPassword)==true) {
			HttpSession session = req.getSession();
			session.setAttribute("id", loginId);
		}
		return "/member/login_success.jsp";
	}

}
