package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CustomerDTO;
import dao.MyPageDAO;


public class UpdateInfo implements CommandProsessor{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		if(req.getAttribute("customer")!=null) {
			MyPageDAO mdao = new MyPageDAO();
			CustomerDTO customer = (CustomerDTO)req.getAttribute("customer");
			mdao.customerUpdateInfo(customer);
		}
		return "/mypage/mypage_edit_info.jsp";
		
		
	}

}
