package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CommandProsessor;

public class ProductInquiryList implements CommandProsessor{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		return "/mypage/mypage_product_inquiry.jsp";
	}

}
