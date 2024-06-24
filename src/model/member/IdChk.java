package model.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//회원가입시 중복 id를 체크
public class IdChk extends Member{
	String registerId;
	
	//입력한 id 생성자
	public IdChk(String registerId) {
		this.registerId=registerId;
	}
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//입력한 id를 체크한 결과를 YN attribute에 넣는다
		req.setAttribute("YN", mdao.customerIdChk(registerId));
		return "/member/idchk.jsp";
	}

}
