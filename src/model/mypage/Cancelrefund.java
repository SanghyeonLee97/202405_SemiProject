package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Cancelrefund extends MyPage{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//세션을 생성하고 세션을 이용해 유저no를 받는다
		session = req.getSession();
		userNo = cdao.getCustomerNo((String)session.getAttribute("id"));
		
		//order_no attribute에 값이 있고 category parameter이 비어있다면
		if(req.getAttribute("order_no")!=null && req.getParameter("category")==null) {
			//order_no attribute값을 받고 order_no를 취소처리한다
			String order_no = (String)req.getAttribute("order_no");
			mdao.cancelOrder(order_no);
		}
		
		//유저no의 취소페이지의 정보를 받아 cancle attribute에 저장
		req.setAttribute("cancel", mdao.getMypageCancel(userNo));
		return "/mypage/mypage_cancel_refund.jsp";
	}

}
