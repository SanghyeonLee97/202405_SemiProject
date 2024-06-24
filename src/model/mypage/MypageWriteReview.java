package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.ReviewDTO;

public class MypageWriteReview extends MyPage{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//rdto attribute가 존재한다면
		if(req.getAttribute("rdto")!=null) {
			//rdto attribute를 받아 rdto 객체에 넣고 리뷰 작성 실행
			ReviewDTO rdto = (ReviewDTO)req.getAttribute("rdto");
			mdao.insertProductReview(rdto);
			
			//리스트페이지로 보낸다
			return "reviewlist.do";
		}
		
		//존재하지 않으면 리뷰작성 페이지로 보낸다
		return "/mypage/mypage_write_review.jsp";
	}
	
}
