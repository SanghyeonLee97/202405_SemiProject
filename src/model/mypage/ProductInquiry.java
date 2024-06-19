package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.ProductInquiryDTO;
import dao.MyPageDAO;
import model.CommandProsessor;

public class ProductInquiry implements CommandProsessor{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		if(req.getAttribute("pdto")!=null) {
			ProductInquiryDTO pdto = (ProductInquiryDTO)req.getAttribute("pdto");
			MyPageDAO mdao = new MyPageDAO();
			mdao.insertProductInquiry(pdto);
			
			return "cancelrefund.do";
		}else {
			return "/mypage/temp.jsp";
		}
	}

}
