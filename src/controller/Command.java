package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		command = new Command_Common();
		if(command.command_Operate(req, resp, servletPath)==null) {
			if(servletPath.contains("/community/")) {
				command = new Command_Community();
			}else if(servletPath.contains("/member/")) {
				command = new Command_Member();
			}else if(servletPath.contains("/mypage/")) {
				command = new Command_MyPage();
			}else {
				command = new Command_Etc();
			}
		}
		processor = command.command_Operate(req, resp, servletPath);
		view=processor.process(req,resp);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String servletPath = req.getServletPath();
		
		command = new Command_Common();
		if(command.command_Operate(req, resp, servletPath)==null) {
			if(servletPath.contains("/member/")) {
				command = new Command_Member();
			}else if(servletPath.contains("/mypage/")) {
				command = new Command_MyPage();
			}
		}
		processor = command.command_Operate(req, resp, servletPath);
		view=processor.process(req,resp);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
	}
	
}
