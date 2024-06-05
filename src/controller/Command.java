package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CommandProsessor;
import model.NoticeRead;

@WebServlet("*.do")
public class Command extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cmd = req.getParameter("cmd");
		String servletPath = req.getServletPath();
		
		CommandProsessor processor = null;		
		String view = null;
		
		
		if("/community/notice.do".equals(servletPath)) {
			processor = new NoticeRead(req.getParameter("no"),req.getParameter("board"));
		}
		view=processor.process(req,resp);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
	}
	
}
