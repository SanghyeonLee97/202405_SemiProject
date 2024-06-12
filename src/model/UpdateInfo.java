package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CustomerDTO;
import dao.MemberDAO;


public class UpdateInfo implements CommandProsessor{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		if(req.getAttribute("customer")!=null) {
			MemberDAO mdao = new MemberDAO();
			CustomerDTO customer = (CustomerDTO)req.getAttribute("customer");
			System.out.println(customer.getPostal_code());
			mdao.customerUpdateInfo(customer);
		}
		return "/mypage/mypage_edit_info.jsp";
		
	}

}
