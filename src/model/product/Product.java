package model.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DibsDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import model.CommandProsessor;

public abstract class Product implements CommandProsessor{
	ProductDAO productDAO = new ProductDAO();
	OrderDAO orderDAO = new OrderDAO();
	DibsDAO dibsDAO = new DibsDAO();
	HttpSession session;
	abstract public String process(HttpServletRequest req, HttpServletResponse resp);
}
