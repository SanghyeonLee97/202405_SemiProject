package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CommandProsessor;

public class MypageCoupon implements CommandProsessor{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {

		return "/mypage/mypage_coupon.jsp";
	}

}
