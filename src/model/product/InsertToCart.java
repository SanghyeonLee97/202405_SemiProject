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
		int productQuantity = 0;
		boolean isSuccess = false;
		String returnURL = null;
		if (id == null || customerNo == null) {
			resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);	//401에러
			return "/member/login.jsp";
		}
		
		//예외처리 (mypage에서 오는경우 수량을 받아오지 못해 NullPointerException 발생)
		try {
			//product_page에서 요청된 경우
			int productNo = Integer.parseInt(req.getParameter("product_no"));
			productQuantity = Integer.parseInt(req.getParameter("product_quantity"));
			if(productQuantity >= 1) {
				isSuccess = productDAO.addToCart(Integer.parseInt(customerNo), productNo, productQuantity);
				if(isSuccess) {
					returnURL = "details.do?product_no="+productNo;
				}
			}
		} catch (Exception e) {
			int productNo = Integer.parseInt(req.getParameter("product_no"));
			//mypage 찜하기에서 오는 요청일 경우(수량 없음)
			productQuantity = 1;
			isSuccess = productDAO.addToCart(Integer.parseInt(customerNo), productNo, productQuantity);
			if(isSuccess) {
				returnURL = "/mypage/dibsList.do";
			}
		}
		return returnURL;
	}
}