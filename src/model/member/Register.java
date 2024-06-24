package model.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CustomerDTO;

public class Register extends Member{
	
	CustomerDTO cdto = new CustomerDTO();
	
	//가입할 유저의 정보를 받는 메소드
	public Register(CustomerDTO cdto) {
		this.cdto = cdto;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//유저 가입 처리
		mdao.customerRegister(cdto);
		return "/member/register_success.jsp";
	}

}
