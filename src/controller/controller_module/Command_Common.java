package controller.controller_module;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CommandProsessor;
import model.member.LoginChk;
import model.member.Logout;

//모든 페이지에서 접근이 가능한 페이지를 처리
public class Command_Common extends Command_Parents{

	@Override
	public CommandProsessor command_Operate(HttpServletRequest req, HttpServletResponse resp, String servletPath) {
		//경로에 /login.do이 포함되어 있으면
		if(servletPath.contains("/login.do")) {
			//id parameter를 받고 password parameter를 받아서 로그인 체크를 업캐스팅
			processor = new LoginChk(req.getParameter("id"),req.getParameter("password"));
		}
		
		//경로에 /logout.do이 포함되어 있으면
		if(servletPath.contains("/logout.do")) {
			//로그아웃을 업캐스팅
			processor = new Logout();
		}
		return processor;
	}

}
