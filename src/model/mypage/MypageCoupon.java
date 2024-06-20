package model.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.MyPageCouponDTO;

public class MypageCoupon extends MyPage{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		session = req.getSession();
		userNo = cdao.getCustomerNo((String)session.getAttribute("id"));
		
		ArrayList<MyPageCouponDTO> mcdtoArr = mdao.getMypageCoupon(userNo);
		req.setAttribute("mcdtoArr", mcdtoArr);
		return "/mypage/mypage_coupon.jsp";
	}

}
