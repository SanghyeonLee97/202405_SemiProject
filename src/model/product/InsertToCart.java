package model.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;

public class InsertToCart extends Product{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//세션 확인
		session = req.getSession();
		String id = (String)session.getAttribute("id");
		String customerNo = (String)session.getAttribute("no");
		
		if (id == null || customerNo == null) {
			return "/member/login.jsp";
		}
		
		//파라미터 가져오기
		int productNo = Integer.parseInt(req.getParameter("product_no"));
		int productQuantity = Integer.parseInt(req.getParameter("product_quantity"));
		
		//장바구니에 추가
		productDAO = new ProductDAO();
		boolean isSuccess = productDAO.addToCart(Integer.parseInt(customerNo), productNo, productQuantity);
		
		if(isSuccess) {
			return "details.do?product_no="+productNo;
		}else {
			System.out.println("장바구니에 추가 실패");
			return null;
		}
	}
}
