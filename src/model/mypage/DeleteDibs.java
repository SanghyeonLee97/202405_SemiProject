package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DibsDAO;

public class DeleteDibs extends MyPage{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		session = req.getSession();
		userNo = cdao.getCustomerNo((String)session.getAttribute("id"));
		int productNo = Integer.parseInt(req.getParameter("product_no"));	//product_no
		
		DibsDAO dibsDAO = new DibsDAO();
		boolean isSuccess = dibsDAO.deleteDibs(userNo, productNo);
		if(isSuccess) {
			return "/mypage/dibsList.do";
		}else {
			System.out.println("MyPage 찜하기 취소 실패!");
			return null;
		}	
	}

}
