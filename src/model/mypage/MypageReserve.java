package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MypageReserve extends MyPage{
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		String status = ""; //검색변수 없으면 전체 0이면 적립 1이면 사용
		//세션을 생성하고 세션을 이용해 유저no를 받는다
		session = req.getSession();
		userNo = cdao.getCustomerNo((String)session.getAttribute("id"));
		
		//status attribute가 비어있지 않다면 status에 status attribute를 받는다
		if(req.getAttribute("status")!=null) {
			status=(String)req.getAttribute("status");
		}
		
		//유저no에 맞는 정보를 불러오고 검색처리를 위한 status를 입력한다
		req.setAttribute("reserve", mdao.getMypageReserve(userNo, status));
		return "/mypage/mypage_reserve.jsp";
	}

}
