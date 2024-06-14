package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommunityDAO;
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
		CommunityDAO cdao = new CommunityDAO();
		
		//탈퇴회원이라면
		if(mdao.customerQuitChk(loginId)) {
			return "/member/login_success.jsp?quit=1";
		}
		
		
		//로그인 확인이 true라면
		if(mdao.customerLoginChk(loginId, loginPassword)==true) {
			HttpSession session = req.getSession();
			session.setAttribute("id", loginId);
			session.setAttribute("no", Integer.toString(cdao.getCustomerNo(loginId)));
		}
		return "/member/login_success.jsp";
	}

}
