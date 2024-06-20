package model.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DTO.CouponDTO;
import DTO.CustomerDTO;
import DTO.ProductDTO;
import dao.OrderDAO;
import dao.ProductDAO;
import model.CommandProsessor;

public class OrderPayment implements CommandProsessor{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//세션확인
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		String customerNo = (String)session.getAttribute("no");
		
		if (id == null && customerNo == null) {
			return "/member/login.jsp";
		}
		ProductDAO productDAO = new ProductDAO();
		
		//회원정보 불러오기
		CustomerDTO customer = productDAO.getCustomer(Integer.parseInt(customerNo));
		req.setAttribute("customer", customer);
		
		
		//쿠폰정보 불러오기
		List<CouponDTO> coupon = productDAO.getCouponList(Integer.parseInt(customerNo));
		req.setAttribute("coupon", coupon);
		
		
		//적립금 불러오기
		OrderDAO order = new OrderDAO();
		int customerPoint = order.getCustomerPoint(Integer.parseInt(customerNo));
		req.setAttribute("customerPoint", customerPoint);
		
		//상품정보 불러오기
		int productNo = Integer.parseInt(req.getParameter("product_no"));
		int productQuantity = Integer.parseInt(req.getParameter("product_quantity"));
		
		ProductDTO product = productDAO.getProduct(productNo);
		req.setAttribute("product", product);
		req.setAttribute("productQuantity", productQuantity);
		
		return "/product/product_order_payment.jsp";
	}

}
