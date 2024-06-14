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
import model.product.ProductFilter;
import model.product.ProductList;

@WebServlet("*.pdo")
public class ProductCommand extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		//String cmd = req.getParameter("cmd");
		
		String servletPath = req.getServletPath();
		System.out.println("ProductCommand.java실행"+servletPath);
		CommandProsessor processor = null;		
		String view = null;

		if(servletPath.equals("/productList.pdo")) {
			processor = new ProductList();
		}else {
			System.out.println("매칭되는 서블릿 없음");
		}

		
		view=processor.process(req,resp);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		//String cmd = req.getParameter("cmd");
		String servletPath = req.getServletPath();
		CommandProsessor processor = null;		
		String view = null;
		System.out.println(servletPath);
		
		switch (servletPath) {
		case "#":
			processor = null;
			break;

		default:
			break;
		}
		
		view=processor.process(req,resp);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
	}
}
