package model.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.MyPageReserveDTO;

public class MypageReserve extends MyPage{
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		String status = "";
		session = req.getSession();
		userNo = cdao.getCustomerNo((String)session.getAttribute("id"));
		if(req.getAttribute("status")!=null) {
			status=(String)req.getAttribute("status");
		}
		
		ArrayList<MyPageReserveDTO> msdtoarr = mdao.getMypageReserve(userNo, status);
		req.setAttribute("reserve", msdtoarr);
		return "/mypage/mypage_reserve.jsp";
	}

}
