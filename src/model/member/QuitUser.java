package model.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QuitUser extends Member{
	
	String id;
	int sw;//작동구분 변수. 0번은 어드민페이지 강퇴
	
	//입력한 id값과 작동구분 변수를 받는 생성자
	public QuitUser(String id,int sw) {
		this.id=id;
		this.sw=sw;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		if(sw==0) {
			session = req.getSession();
			
			//입력받은 id값이 내가 아니고 존재하는 회원이고 탈퇴한회원이 아니라면
			if(!id.equals(session.getAttribute("id")) && mdao.customerIdChk(id)==true && mdao.customerQuitChk(id)==false ) {
				//입력받은 id를 탈퇴처리 시킨다
				mdao.quitCustomer(id);
			}
		}
		return "/admin.jsp";
	}

}
