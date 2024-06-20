package model.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DTO.MyPageMainDTO;
import dao.CommunityDAO;
import dao.MyPageDAO;
import model.CommandProsessor;

public class MypageWriteReview implements CommandProsessor{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		
		
		return "/mypage/mypage_write_review.jsp";
	}

}
