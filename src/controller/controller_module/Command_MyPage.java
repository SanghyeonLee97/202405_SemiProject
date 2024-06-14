package controller.controller_module;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CustomerDTO;
import model.CommandProsessor;
import model.UpdateInfo;

public class Command_MyPage extends Command_Parents{
	
	@Override
	public CommandProsessor command_Operate(HttpServletRequest req, HttpServletResponse resp, String servletPath) {
		if(servletPath.equals("/mypage/updateInfo.do")) {
			if(req.getParameter("id")!=null) {
				System.out.println(req.getParameter("postcode"));
				CustomerDTO customer = new CustomerDTO();
				customer.setCustomer_id(req.getParameter("id"));
				customer.setCustomer_pw(req.getParameter("password"));
				customer.setCustomer_name(req.getParameter("name"));
				customer.setCustomer_tel(req.getParameter("tel"));
				customer.setPostal_code(req.getParameter("postcode"));
				System.out.println(customer.getPostal_code());
				customer.setAddress_road(req.getParameter("roadAddress"));
				customer.setAddress_detail(req.getParameter("detailAddress"));
				req.setAttribute("customer", customer);
			}
			processor = new UpdateInfo();
		}
		return processor;
	}

}
