package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductInquiryList extends MyPage{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		session = req.getSession();
		userNo = cdao.getCustomerNo((String)session.getAttribute("id"));
		
		req.setAttribute("pidtoArr", mdao.getInquiryList(userNo));
		return "/mypage/mypage_product_inquiry.jsp";
	}
	
}
