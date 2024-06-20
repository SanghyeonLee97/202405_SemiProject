package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Cancelrefund extends MyPage{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		session = req.getSession();
		userNo = cdao.getCustomerNo((String)session.getAttribute("id"));
		
		if(req.getAttribute("order_no")!=null && req.getParameter("category")==null) {
			String order_no = (String)req.getAttribute("order_no");
			mdao.cancelOrder(order_no);
		}
		
		req.setAttribute("cancel", mdao.getMypageCancel(userNo));
		return "/mypage/mypage_cancel_refund.jsp";
	}

}
