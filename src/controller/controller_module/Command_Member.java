package controller.controller_module;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CustomerDTO;
import model.CommandProsessor;
import model.member.IdChk;
import model.member.Register;

public class Command_Member extends Command_Parents{

	@Override
	public CommandProsessor command_Operate(HttpServletRequest req, HttpServletResponse resp, String servletPath) {
		if(servletPath.equals("/member/idchk.do")) {	//회원가입 중복체크
			processor = new IdChk(req.getParameter("id"));
		}
		if("/member/register.do".equals(servletPath)) {
			CustomerDTO customer = new CustomerDTO();
			customer.setCustomer_id(req.getParameter("id"));
			customer.setCustomer_pw(req.getParameter("password"));
			customer.setCustomer_name(req.getParameter("name"));
			customer.setCustomer_tel(req.getParameter("tel"));
			customer.setCustomer_email(req.getParameter("email"));
			customer.setPostal_code(req.getParameter("postcode"));
			customer.setAddress_road(req.getParameter("roadAddress"));
			customer.setAddress_detail(req.getParameter("detailAddress"));
			processor = new Register(customer);
		}
		
		return processor;
	}
}
