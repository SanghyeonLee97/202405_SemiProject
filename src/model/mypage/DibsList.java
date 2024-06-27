package model.mypage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.product.CartDTO;
import dao.DibsDAO;

public class DibsList extends MyPage{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		session = req.getSession();		//세션
		userNo = cdao.getCustomerNo((String)session.getAttribute("id"));	//customer_no
		
		DibsDAO dibsDAO = new DibsDAO();
		List<CartDTO> dibsList = dibsDAO.getCustomerDibs(userNo);
		
		req.setAttribute("dibsList", dibsList);

		return "/mypage/mypage_dibs.jsp";
	}

}
