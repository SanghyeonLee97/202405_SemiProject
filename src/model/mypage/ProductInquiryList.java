package model.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DTO.ProductInquiryDTO;
import dao.CommunityDAO;
import dao.MyPageDAO;
import model.CommandProsessor;

public class ProductInquiryList implements CommandProsessor{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		MyPageDAO mdao = new MyPageDAO();
		CommunityDAO cdao = new CommunityDAO();
		HttpSession session = req.getSession();
		int userNo = cdao.getCustomerNo((String)session.getAttribute("id"));
		
		ArrayList<ProductInquiryDTO> pidtoArr = mdao.getInquiryList(userNo);
		req.setAttribute("pidtoArr", pidtoArr);
		return "/mypage/mypage_product_inquiry.jsp";
	}

}
