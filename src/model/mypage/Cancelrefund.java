package model.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DTO.MyPageCancelDTO;
import dao.CommunityDAO;
import dao.MyPageDAO;
import model.CommandProsessor;

public class Cancelrefund implements CommandProsessor{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		MyPageDAO mdao = new MyPageDAO();
		if(req.getAttribute("order_no")!=null && req.getParameter("category")==null) {
			String order_no = (String)req.getAttribute("order_no");
			mdao.cancelOrder(order_no);
		}
		CommunityDAO cdao = new CommunityDAO();
		HttpSession session = req.getSession();
		String customerId = (String)session.getAttribute("id");
		ArrayList<MyPageCancelDTO> mcdtoArr = mdao.getMypageCancel(cdao.getCustomerNo(customerId));
		req.setAttribute("cancel", mcdtoArr);
		return "/mypage/mypage_cancel_refund.jsp";
	}

}
