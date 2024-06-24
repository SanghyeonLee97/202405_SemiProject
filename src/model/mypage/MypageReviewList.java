package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MypageReviewList extends MyPage{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//세션을 생성하고 세션을 이용해 유저no를 받는다
		session = req.getSession();
		userNo = cdao.getCustomerNo((String)session.getAttribute("id"));
		
		//유저no에 맞는 리스트를 불러와 mrdtoArr attribute에 넣는다
		req.setAttribute("mrdtoArr", mdao.getMypageReview(userNo));
		return "/mypage/mypage_review.jsp";
	}

}
