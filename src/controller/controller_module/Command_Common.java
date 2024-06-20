package controller.controller_module;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CommandProsessor;
import model.LoginChk;
import model.Logout;
import model.mypage.MypageWriteReview;

public class Command_Common extends Command_Parents{

	@Override
	public CommandProsessor command_Operate(HttpServletRequest req, HttpServletResponse resp, String servletPath) {
		if(servletPath.contains("/login.do")) {
			processor = new LoginChk(req.getParameter("id"),req.getParameter("password"));
		}
		if(servletPath.contains("/logout.do")) {
			processor = new Logout();
		}
		return processor;
	}

}
