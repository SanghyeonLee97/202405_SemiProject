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
			String email = req.getParameter("email");
			String id = memberDao.findId(email);
			req.setAttribute("id", id);
			System.out.println("아이디찾기1");
			if(id != null) {
				System.out.println("아아디찾기2");
				System.out.println(email+"님의 아이디는"+memberDao.findId(email)+"입니다");
				return "/member/id.jsp";
			}else {
				System.out.println("입력하신 이메일이 없습니다");
				return "/member/id.jsp";
		}
	}
}
