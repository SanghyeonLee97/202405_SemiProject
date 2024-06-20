package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.ReviewDTO;

public class MypageWriteReview extends MyPage{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		if(req.getAttribute("rdto")!=null) {
			ReviewDTO rdto = (ReviewDTO)req.getAttribute("rdto");
			mdao.insertProductReview(rdto);
			return "reviewlist.do";
		}
		return "/mypage/mypage_write_review.jsp";
	}
	
}
