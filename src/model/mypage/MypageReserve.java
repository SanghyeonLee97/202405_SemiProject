package model.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DTO.MyPageReserveDTO;
import dao.CommunityDAO;
import dao.MyPageDAO;
import model.CommandProsessor;

public class MypageReserve implements CommandProsessor{
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		String status = "";
		MyPageDAO mdao = new MyPageDAO();
		CommunityDAO cdao = new CommunityDAO();
		HttpSession session = req.getSession();
		if(req.getAttribute("status")!=null) {
			status=(String)req.getAttribute("status");
		}
		
		int cno = cdao.getCustomerNo((String)session.getAttribute("id"));
		ArrayList<MyPageReserveDTO> msdtoarr = mdao.getMypageReserve(cno, status);
		req.setAttribute("reserve", msdtoarr);
		return "/mypage/mypage_reserve.jsp";
	}

}
