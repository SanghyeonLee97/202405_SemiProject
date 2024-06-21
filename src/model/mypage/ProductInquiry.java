package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.mypage.ProductInquiryDTO;

public class ProductInquiry extends MyPage{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		if(req.getAttribute("pdto")!=null) {
			ProductInquiryDTO pdto = (ProductInquiryDTO)req.getAttribute("pdto");
			mdao.insertProductInquiry(pdto);
			return "cancelrefund.do";
		}else {
			return "/mypage/temp.jsp";
		}
	}
	
}
