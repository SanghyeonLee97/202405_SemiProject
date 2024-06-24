package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.mypage.ProductInquiryDTO;

public class ProductInquiry extends MyPage{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//pdto attribute가 존재한다면
		if(req.getAttribute("pdto")!=null) {
			//pdto attribute를 받아 pdto 객체에 넣고 문의 작성 실행
			ProductInquiryDTO pdto = (ProductInquiryDTO)req.getAttribute("pdto");
			mdao.insertProductInquiry(pdto);
			
			//문의취소페이지로 보낸다
			return "cancelrefund.do";
		}else {
			//존재하지 않으면 리뷰작석 페이지로 보낸다
			return "/mypage/mypage_withdraw_order_inquiry.jsp";
		}
	}
	
}
