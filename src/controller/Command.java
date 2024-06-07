package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CustomerDTO;
import model.CommandProsessor;
import model.FAQRead;
import model.IdChk;
import model.LoginChk;
import model.Logout;
import model.NoticeRead;
import model.Register;

@WebServlet("*.do")
public class Command extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cmd = req.getParameter("cmd");
		String servletPath = req.getServletPath();
		System.out.println(servletPath);
		CommandProsessor processor = null;		
		String view = null;
		
		if(servletPath.equals("/community/notice.do")) {
			processor = new NoticeRead(req.getParameter("no"),req.getParameter("board"));
		}else if(servletPath.equals("/community/FAQ.do")) {
			processor = new FAQRead(req.getParameter("no"));
		}else if(servletPath.equals("/member/idchk.do")) {	//회원가입 중복체크
			processor = new IdChk(req.getParameter("id"));
		}else if(servletPath.contains("/logout.do")) {
			processor = new Logout();
		}
		view=processor.process(req,resp);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cmd = req.getParameter("cmd");
		String servletPath = req.getServletPath();
		
		CommandProsessor processor = null;		
		String view = null;
		
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
		}else if(servletPath.equals("/member/login.do")) {
			processor = new LoginChk(req.getParameter("id"),req.getParameter("password"));
		}
		view=processor.process(req,resp);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
	}
	
}
