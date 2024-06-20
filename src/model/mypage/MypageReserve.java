package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MypageReserve extends MyPage{
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		String status = "";
		session = req.getSession();
		userNo = cdao.getCustomerNo((String)session.getAttribute("id"));
		if(req.getAttribute("status")!=null) {
			status=(String)req.getAttribute("status");
		}
		
		req.setAttribute("reserve", mdao.getMypageReserve(userNo, status));
		return "/mypage/mypage_reserve.jsp";
	}

}
