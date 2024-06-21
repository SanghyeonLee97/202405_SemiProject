package model.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Logout extends Member{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//세션을 생성하고 id와 no attribute를 삭제
		session = req.getSession();
		session.removeAttribute("id");
		session.removeAttribute("no");
		return "/index.jsp";
	}

}
