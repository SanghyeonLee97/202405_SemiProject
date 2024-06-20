package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MypageReviewList extends MyPage{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		session = req.getSession();
		userNo = cdao.getCustomerNo((String)session.getAttribute("id"));
		
		req.setAttribute("mrdtoArr", mdao.getMypageReview(userNo));
		return "/mypage/mypage_review.jsp";
	}

}
