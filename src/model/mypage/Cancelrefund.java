package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CommandProsessor;

public class Cancelrefund implements CommandProsessor{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("테스트");
		return "/mypage/mypage_cancel_refund.jsp";
	}

}
