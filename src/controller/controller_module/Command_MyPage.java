package controller.controller_module;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CustomerDTO;
import model.CommandProsessor;
import model.UpdateInfo;
import model.mypage.Cancelrefund;
import model.mypage.MypageReserve;
import model.mypage.ProductInquiry;

public class Command_MyPage extends Command_Parents{
	
	@Override
	public CommandProsessor command_Operate(HttpServletRequest req, HttpServletResponse resp, String servletPath) {
		if(servletPath.equals("/mypage/updateInfo.do")) {
			if(req.getParameter("id")!=null) {
				CustomerDTO customer = new CustomerDTO();
				customer.setCustomer_id(req.getParameter("id"));
				customer.setCustomer_pw(req.getParameter("password"));
				customer.setCustomer_name(req.getParameter("name"));
				customer.setCustomer_tel(req.getParameter("tel"));
				customer.setPostal_code(req.getParameter("postcode"));
				customer.setAddress_road(req.getParameter("roadAddress"));
				customer.setAddress_detail(req.getParameter("detailAddress"));
				req.setAttribute("customer", customer);
			}
			processor = new UpdateInfo();
		}
		
		if(servletPath.equals("/mypage/reserve.do")) {
			if(req.getParameter("status")!=null) {
				req.setAttribute("status", req.getParameter("status"));
			}
			processor = new MypageReserve();
		}
		if(servletPath.equals("/mypage/cancelrefund.do")) {
			if(req.getParameter("order_no")!=null) {
				req.setAttribute("order_no", req.getParameter("order_no"));
			}
			processor = new Cancelrefund();
		}
		if(servletPath.equals("/mypage/productinquiry.do")) {
			if(req.getParameter("order_no")!=null) {
				req.setAttribute("order_no", req.getParameter("order_no"));
			}
			processor = new ProductInquiry();
		}
		return processor;
	}

}
