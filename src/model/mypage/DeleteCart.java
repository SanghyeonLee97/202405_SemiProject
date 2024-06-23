package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteCart extends MyPage{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		session = req.getSession();
		
		
		long cart_no = Integer.parseInt(req.getParameter("cart_no"));
		boolean isSuccess =  mdao.deleteCart(cart_no);
		System.out.println("장바구니 번호: "+cart_no);
		if (isSuccess) {
			return "cartList.do";
		}else {
			System.out.println("장바구니 삭제 실패!");
			return null;
		}
	}
}
