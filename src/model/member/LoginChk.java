package model.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginChk extends Member{
	
	String loginId;
	String loginPassword;
	
	//입력한 아이디,비밀번호를 받는 생성자
	public LoginChk(String loginId,String loginPassword) {
		this.loginId=loginId;
		this.loginPassword=loginPassword;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		
		//입력받은 id이 탈퇴회원인지 체크
		if(mdao.customerQuitChk(loginId)) {
			return "/member/login_success.jsp?quit=1";
		}
		
		//입력받은 id,password가 일지하는지 체크하고 값이 true라면
		if(mdao.customerLoginChk(loginId, loginPassword)==true) {
			//세션 생성후 id에 id값을 no에 id와 일치하는 유저no를 저장
			session = req.getSession();
			session.setAttribute("id", loginId);
			session.setAttribute("no", Integer.toString(cdao.getCustomerNo(loginId)));
		}
		return "/member/login_success.jsp";
	}

}
