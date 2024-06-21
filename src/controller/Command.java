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
		//경로를 받아서 저장
		String servletPath = req.getServletPath();
		System.out.println(servletPath);
		
		command = new Command_Common(); //부모에 업캐스팅한다. 기본은 Command_Common
		//Command_Common의 command_Operate 메소드를 실행하고 리턴값이 존재하지 않으면 실행한다
		if(command.command_Operate(req, resp, servletPath)==null) {
			if(servletPath.contains("/community/")) { //경로에 /community/가 포함되어 있다면
				command = new Command_Community(); //command에 Command_Communit 업캐스팅
			}else if(servletPath.contains("/member/")) { //경로에 /member/가 포함되어 있다면
				command = new Command_Member(); //command에 Command_Member 업캐스팅
			}else if(servletPath.contains("/mypage/")) { //경로에 /mypage/가 포함되어 있다면
				command = new Command_MyPage(); //command에 Command_MyPage 업캐스팅
			}else if(servletPath.contains("/product/")){ //경로에 /product/가 포함되어 있다면
				command = new Command_Product(); //command에 Command_Product 업캐스팅
			}else { //다 아니라면
				command = new Command_Etc(); //command에 Command_Etc업캐스팅
			}
		}
		//command에 업캐스팅된 객체의 command_operate실행해서 반환된 객체를 processor에 업캐스팅
		processor = command.command_Operate(req, resp, servletPath);
		//업캐스팅된 processor의 process실행해서 반환된 값을 view에 저장
		view=processor.process(req,resp);
		
		//view경로로 이동
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
	}
	
	//doGet과 동일한 작동방식
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
			}else if(servletPath.contains("/product/")){
				command = new Command_Product();
			}
		}
		processor = command.command_Operate(req, resp, servletPath);
		view=processor.process(req,resp);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
	}
	
}
