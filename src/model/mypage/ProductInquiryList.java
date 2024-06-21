package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductInquiryList extends MyPage{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//세션을 생성하고 세션을 이용해 유저no를 받는다
		session = req.getSession();
		userNo = cdao.getCustomerNo((String)session.getAttribute("id"));
		
		//유저no에 맞는 문의리스트를 pidtoArr attribute에 저장
		req.setAttribute("pidtoArr", mdao.getInquiryList(userNo));
		return "/mypage/mypage_product_inquiry.jsp";
	}
	
}
