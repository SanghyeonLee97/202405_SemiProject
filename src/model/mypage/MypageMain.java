package model.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DTO.MyPageMainDTO;
import dao.CommunityDAO;
import dao.MyPageDAO;
import model.CommandProsessor;

public class MypageMain implements CommandProsessor{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		MyPageDAO mdao = new MyPageDAO();
		CommunityDAO cdao = new CommunityDAO();
		HttpSession session = req.getSession();
		int userNo = cdao.getCustomerNo((String)session.getAttribute("id"));
		
		ArrayList<MyPageMainDTO> mmdtoArr = mdao.getMypageMain(userNo);
		req.setAttribute("mmdtoArr", mmdtoArr);
		
		return "redirect:/mypage/mypage_main.jsp";
	}

}
