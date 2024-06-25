package model.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Dibs extends Product{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//세션 확인
		session = req.getSession();
		String id = (String)session.getAttribute("id");
		String customerNo = (String)session.getAttribute("no");
		if (id == null || customerNo == null) {
			resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);	//401에러
			return "/projectdengdeng/member/login.jsp";
		}
		
		long customer_no = Integer.parseInt(customerNo);
		boolean isChecked = Boolean.parseBoolean(req.getParameter("isChecked"));
		long product_no = Integer.parseInt(req.getParameter("product_no"));
		if (isChecked == false) {
			dibsDAO.insertDibs(customer_no, product_no);
		} else if(isChecked == true) {
			dibsDAO.deleteDibs(customer_no, product_no);
		}
		
		return "";
	}

}
