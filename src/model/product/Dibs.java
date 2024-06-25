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
		String pc_parent_no = (String) session.getAttribute("pc_parent_no");
		String pc_no = (String) session.getAttribute("pc_no");
		
		if (id == null || customerNo == null) {
			return "/projectdengdeng/member/login.jsp";
		}
		
		try {
			long customer_no = Long.parseLong(customerNo);
			boolean isChecked = Boolean.parseBoolean(req.getParameter("isChecked"));
			long product_no = Long.parseLong(req.getParameter("product_no"));
			
			if (!isChecked) {
				dibsDAO.insertDibs(customer_no, product_no);
			} else {
				dibsDAO.deleteDibs(customer_no, product_no);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		String redirectUrl = "list.do";
		if (pc_parent_no != null) {
			redirectUrl += "?pc_parent_no=" + pc_parent_no;
		} else if (pc_no != null) {
			redirectUrl += "?pc_no=" + pc_no;
		}
	    
	    return redirectUrl;
	}
}