package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;

public class MypageInsertCart extends MyPage{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		session = req.getSession();
		userNo = cdao.getCustomerNo((String)session.getAttribute("id"));
		int productNo = Integer.parseInt(req.getParameter("product_no"));	//product_no
		int productQuantity = 1;
		
		ProductDAO productDAO = new ProductDAO();
		boolean isSuccess = productDAO.addToCart(userNo, productNo, productQuantity);
		if (isSuccess) {
			return "/mypage/dibsList.do";
		}else {
			System.out.println("MyPage 장바구니추가 실패!");
			return null;
		}		
	}
}
