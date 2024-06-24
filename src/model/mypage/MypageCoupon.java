package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MypageCoupon extends MyPage{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//세션을 생성하고 세션을 이용해 유저no를 받는다
		session = req.getSession();
		userNo = cdao.getCustomerNo((String)session.getAttribute("id"));
		
		//유저no에 해당하는 리스트를 받아와 mcdtoArr attribute에 저장
		req.setAttribute("mcdtoArr", mdao.getMypageCoupon(userNo));
		return "/mypage/mypage_coupon.jsp";
	}

}
