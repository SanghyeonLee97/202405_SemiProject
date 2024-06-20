package model.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.ProductInquiryDTO;

public class ProductInquiryList extends MyPage{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		session = req.getSession();
		userNo = cdao.getCustomerNo((String)session.getAttribute("id"));
		
		ArrayList<ProductInquiryDTO> pidtoArr = mdao.getInquiryList(userNo);
		req.setAttribute("pidtoArr", pidtoArr);
		return "/mypage/mypage_product_inquiry.jsp";
	}
	
}
