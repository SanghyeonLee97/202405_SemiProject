package model.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QuitUser extends Member{
	
	String id;
	int sw;//작동구분 0번-어드민페이지 강퇴
	
	public QuitUser(String id,int sw) {
		this.id=id;
		this.sw=sw;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		if(sw==0) {
			session = req.getSession();
			
			//내가 아니고 존재하는 회원이고 탈퇴한회원이 아니라면
			if(!id.equals(session.getAttribute("id")) && mdao.customerIdChk(id)==true && mdao.customerQuitChk(id)==false ) {
				mdao.quitCustomer(id);//탈퇴
			}
		}
		return "/admin.jsp";
	}

}
