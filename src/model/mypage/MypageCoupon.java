package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MypageCoupon extends MyPage{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		session = req.getSession();
		userNo = cdao.getCustomerNo((String)session.getAttribute("id"));
		
		req.setAttribute("mcdtoArr", mdao.getMypageCoupon(userNo));
		return "/mypage/mypage_coupon.jsp";
	}

}
