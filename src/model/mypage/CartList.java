package model.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.product.CartDTO;

public class CartList extends MyPage {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		session = req.getSession();
		userNo = cdao.getCustomerNo((String)session.getAttribute("id"));
		
		List<CartDTO> cartList = mdao.getCartList(userNo);
		req.setAttribute("cartList", cartList);
		return "/mypage/mypage_cart.jsp";
	}

}
