package model.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CustomerDTO;

public class Register extends Member{
	
	CustomerDTO cdto = new CustomerDTO();
	
	public Register(CustomerDTO cdto) {
		this.cdto = cdto;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		mdao.customerRegister(cdto);
		return "/member/register_success.jsp";
	}

}
