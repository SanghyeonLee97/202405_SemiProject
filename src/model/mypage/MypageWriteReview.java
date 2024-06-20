package model.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DTO.MyPageMainDTO;
import DTO.ReviewDTO;
import dao.CommunityDAO;
import dao.MyPageDAO;
import model.CommandProsessor;

public class MypageWriteReview implements CommandProsessor{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		if(req.getAttribute("rdto")!=null) {
			MyPageDAO mdao = new MyPageDAO();
			ReviewDTO rdto = (ReviewDTO)req.getAttribute("rdto");
			mdao.insertProductReview(rdto);
			return "reviewlist.do";
		}
		
		return "/mypage/mypage_write_review.jsp";
	}

}
