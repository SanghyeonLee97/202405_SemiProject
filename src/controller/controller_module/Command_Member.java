package controller.controller_module;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CustomerDTO;
import model.CommandProsessor;
import model.member.Id;
import model.member.IdChk;
import model.member.Register;

//member 경로를 처리
public class Command_Member extends Command_Parents{

	@Override
	public CommandProsessor command_Operate(HttpServletRequest req, HttpServletResponse resp, String servletPath) {
		//경로가 /member/idchk.do라면
		if(servletPath.equals("/member/idchk.do")) {	//회원가입 중복체크
			//id parameter를 받아 중복체크를 업캐스팅
			processor = new IdChk(req.getParameter("id"));
		}
		
		//경로가 /member/register.do라면
		if(servletPath.equals("/member/register.do")) {
			//DTO생성
			CustomerDTO customer = new CustomerDTO();
			//id,password,name,tel,email,postcode,roadAddress,detailAddress parameter를 받아 customer에 넣는다
			customer.setCustomer_id(req.getParameter("id"));
			customer.setCustomer_pw(req.getParameter("password"));
			customer.setCustomer_name(req.getParameter("name"));
			customer.setCustomer_tel(req.getParameter("tel"));
			customer.setCustomer_email(req.getParameter("email"));
			customer.setPostal_code(req.getParameter("postcode"));
			customer.setAddress_road(req.getParameter("roadAddress"));
			customer.setAddress_detail(req.getParameter("detailAddress"));
			//회원가입 업캐스팅
			processor = new Register(customer);
		}
		if(servletPath.equals("/member/id.do")) {
			processor = new Id(req.getParameter("member_email"));
		}
		return processor;
	}
}
