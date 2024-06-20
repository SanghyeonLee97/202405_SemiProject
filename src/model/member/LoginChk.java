package model.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginChk extends Member{
	
	String loginId;
	String loginPassword;
	
	public LoginChk(String loginId,String loginPassword) {
		this.loginId=loginId;
		this.loginPassword=loginPassword;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		
		//탈퇴회원이라면
		if(mdao.customerQuitChk(loginId)) {
			return "/member/login_success.jsp?quit=1";
		}
		
		//로그인 확인이 true라면
		if(mdao.customerLoginChk(loginId, loginPassword)==true) {
			session = req.getSession();
			session.setAttribute("id", loginId);
			session.setAttribute("no", Integer.toString(cdao.getCustomerNo(loginId)));
		}
		return "/member/login_success.jsp";
	}

}
