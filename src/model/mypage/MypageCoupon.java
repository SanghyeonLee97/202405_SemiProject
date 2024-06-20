package model.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DTO.MyPageCouponDTO;
import dao.CommunityDAO;
import dao.MyPageDAO;
import model.CommandProsessor;

public class MypageCoupon implements CommandProsessor{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		CommunityDAO cdao = new CommunityDAO();
		MyPageDAO mdao = new MyPageDAO();
		HttpSession session = req.getSession();
		String uId = (String)session.getAttribute("id");
		int uNo = cdao.getCustomerNo(uId);
		
		ArrayList<MyPageCouponDTO> mcdtoArr = mdao.getMypageCoupon(uNo);
		
		req.setAttribute("mcdtoArr", mcdtoArr);
		
		return "/mypage/mypage_coupon.jsp";
	}

}
