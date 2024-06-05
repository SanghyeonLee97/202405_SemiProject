package model;


import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CustomerDTO;
import dao.MemberDAO;

public class Register implements CommandProsessor{
	
	CustomerDTO cdto = new CustomerDTO();
	
	public Register(CustomerDTO cdto) {
		this.cdto = cdto;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		MemberDAO mdao = new MemberDAO();
		mdao.customerRegister(cdto);
		return "/member/register_success.jsp";
	}

}
