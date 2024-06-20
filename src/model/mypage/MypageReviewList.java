package model.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.MyPageReviewDTO;

public class MypageReviewList extends MyPage{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		session = req.getSession();
		userNo = cdao.getCustomerNo((String)session.getAttribute("id"));
		
		ArrayList<MyPageReviewDTO> mrdtoArr = mdao.getMypageReview(userNo);
		req.setAttribute("mrdtoArr", mrdtoArr);
		
		return "/mypage/mypage_review.jsp";
	}

}
