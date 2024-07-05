package model.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import model.CommandProsessor;

public class Id implements CommandProsessor{
	
	String email;
	
	public Id(String email) {
		
		this.email = email;
		}
	
		@Override
		public String process(HttpServletRequest req, HttpServletResponse resp) {
			MemberDAO memberDao = new MemberDAO();
			
			if(memberDao.findId(email) != null) {
				req.setAttribute("id", memberDao.findId(email));
				return "/member/id.jsp";
			}else {
				req.setAttribute("id", "");
				return "/member/id.jsp"; }
	}
}
