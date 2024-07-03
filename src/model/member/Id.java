package model.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CommandProsessor;

public class Id implements CommandProsessor{
	
	String email;
	
	public Id(String email) {
		
		this.email = email;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		String id = "admin";
		
		req.setAttribute("id", id);
		return "/member/id.jsp";
	}

}
