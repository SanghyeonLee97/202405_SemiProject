package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.controller_module.Command_Common;
import controller.controller_module.Command_Community;
import controller.controller_module.Command_Etc;
import controller.controller_module.Command_Member;
import controller.controller_module.Command_MyPage;
import controller.controller_module.Command_Parents;
import controller.controller_module.Command_Product;
import model.CommandProsessor;


@WebServlet("*.do")
public class Command extends HttpServlet{
	Command_Parents command = null;
	CommandProsessor processor = null;		
	String view = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String servletPath = req.getServletPath();
		System.out.println(servletPath);
		
		command = new Command_Common(); //부모에 업캐스팅 기본은 common객체
		if(command.command_Operate(req, resp, servletPath)==null) { //common의 리턴값이 존재하지 않으면
			if(servletPath.contains("/community/")) { //경로에 community가 포함되어 있다면
				command = new Command_Community(); //community 객체생성
			}else if(servletPath.contains("/member/")) { //경로에 member가 포함되어 있다면
				command = new Command_Member(); //member 객체생성
			}else if(servletPath.contains("/mypage/")) { //경로에 mypage가 포함되어 있다면
				command = new Command_MyPage(); //mypage 객체생성
			}else if(servletPath.contains("/product/")){ //경로에 product가 포함되어 있다면
				command = new Command_Product();
			}else { //다 아니라면
				command = new Command_Etc(); //etc객체생성
			}
		}
		processor = command.command_Operate(req, resp, servletPath); //업캐스팅된 객체의 command_operate실행
		view=processor.process(req,resp);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String servletPath = req.getServletPath();
		System.out.println(servletPath);
		command = new Command_Common();
		if(command.command_Operate(req, resp, servletPath)==null) {
			if(servletPath.contains("/member/")) {
				command = new Command_Member();
			}else if(servletPath.contains("/mypage/")) {
				command = new Command_MyPage();
			}else if(servletPath.contains("/product/")){ //경로에 product가 포함되어 있다면
				command = new Command_Product();
			}
		}
		processor = command.command_Operate(req, resp, servletPath);
		view=processor.process(req,resp);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
	}
	
}
