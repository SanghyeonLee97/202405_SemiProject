package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CustomerDTO;


public class UpdateInfo extends MyPage{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		if(req.getAttribute("customer")!=null) {
			CustomerDTO customer = (CustomerDTO)req.getAttribute("customer");
			mdao.customerUpdateInfo(customer);
		}
		return "/mypage/mypage_edit_info.jsp";
	}

}
