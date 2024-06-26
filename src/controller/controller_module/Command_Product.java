package controller.controller_module;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CommandProsessor;
import model.product.Dibs;
import model.product.InsertToCart;
import model.product.MakeOrder;
import model.product.OrderPayment;
import model.product.ProductDetail;
import model.product.ProductList;

public class Command_Product extends Command_Parents{

	@Override
	public CommandProsessor command_Operate(HttpServletRequest req, HttpServletResponse resp, String servletPath) {
		if(servletPath.contains("/product/list.do")) {
			processor = new ProductList();
		}else if(servletPath.contains("/details.do")) {
			processor = new ProductDetail();
		}else if(servletPath.contains("/orderPayment.do")) {
			processor = new OrderPayment();
		}else if(servletPath.contains("/insertCart.do")){
			processor = new InsertToCart();
		}else if(servletPath.contains("/selectDibs.do")){
			processor = new Dibs();
		}else if(servletPath.contains("/makeOrder.do")){
			processor = new MakeOrder();
		}else {
			System.out.println("매칭되는 서블릿 없음");
		}
		return processor;
	}

}
