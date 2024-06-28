package model.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import model.CommandProsessor;

public class Password2 implements CommandProsessor{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		MemberDAO mdao = new MemberDAO();
		
		String id = req.getParameter("id");
		String password = mdao.findPW(id);
		req.setAttribute("password", password);
		System.out.println("비밀번호찾기1");
		if(password !=null) {
			System.out.println("비밀번호찾기2");
			System.out.println(id+"님의 비밀번호는"+mdao.findPW(id)+"입니다");
			return "password.jsp";
		}else {
			
			System.out.println("입력하신 아이디가 없습니다");
			//request.getattribute
			return "password.jsp";
		}
	}

}
