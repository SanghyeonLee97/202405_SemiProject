package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteCart extends MyPage{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//세션확인
		session = req.getSession();
		String id = (String)session.getAttribute("id");
		String customerNo = (String)session.getAttribute("no");
		long cartNo = 0;
		boolean isSuccess = false;
		String returnURL = null;
		
		//예외처리(product_page에서 넘어오는 경우 cart_no 없음)
		try {
			//mypage에서 넘어오는 경우
			cartNo = Integer.parseInt(req.getParameter("cart_no"));
			isSuccess =  mdao.deleteCart(cartNo);
			System.out.println("장바구니 번호: "+cartNo);
			if (isSuccess) {
				returnURL = "cartList.do";
			}
		} catch (Exception e) {
			//product_page에서 넘어오는 경우
			long productNo = Long.parseLong(req.getParameter("product_no"));
			cartNo = mdao.getCartNo(productNo, Long.parseLong(customerNo));
			isSuccess = mdao.deleteCart(cartNo);
			if(isSuccess) {
				returnURL = "/product/details.do";
			}
		}
		return returnURL;
	}
}
