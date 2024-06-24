package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CustomerDTO;


public class UpdateInfo extends MyPage{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//customer attribute가 존재한다면
		if(req.getAttribute("customer")!=null) {
			//customer attribute를 받아 customer 객체에 넣고 정보수정 실행
			CustomerDTO customer = (CustomerDTO)req.getAttribute("customer");
			mdao.customerUpdateInfo(customer);
		}
		return "/mypage/mypage_edit_info.jsp";
	}

}
