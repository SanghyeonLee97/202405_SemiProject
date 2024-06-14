package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CustomerDTO;
import model.CommandProsessor;
import model.IdChk;
import model.Register;

public class Command_Member {
	CommandProsessor processor = null;	
	
	public CommandProsessor commandMember(HttpServletRequest req, HttpServletResponse resp,String servletPath){
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
