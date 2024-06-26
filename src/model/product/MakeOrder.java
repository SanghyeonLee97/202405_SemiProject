package model.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.product.OrderDTO;
import dao.OrderDAO;

public class MakeOrder extends Product{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//세션확인
		session = req.getSession();
		String id = (String)session.getAttribute("id");
		String customerNo = (String)session.getAttribute("no");						//회원번호
		System.out.println("received customerNo: "+customerNo);		
		if (id == null && customerNo == null) {
			return "/member/login.jsp";
		}
		
		//필요한 데이터 받아오기
		long productNo = Long.parseLong(req.getParameter("product_no"));			//상품번호
		long couponNo = Long.parseLong(req.getParameter("coupon_no"));				//쿠폰번호
		long orderQuantity = Long.parseLong(req.getParameter("order_quantity"));	//구매수량
		System.out.println("received productNo: "+productNo);
		System.out.println("received couponNo: "+couponNo);
		System.out.println("received orderQuantity: "+orderQuantity);
		
		//OrderDTO 객체에 받아온 데이터 담기
		OrderDTO order = new OrderDTO();
		order.setCustomer_no(Long.parseLong(customerNo));
		order.setProduct_no(productNo);
		order.setCoupon_no(couponNo);
		order.setOrder_quantity(orderQuantity);
		
		//주문내역에 추가
		orderDAO = new OrderDAO();
		boolean isSuccess = orderDAO.makeOrder(order);
		if (isSuccess) {
			return "/index.jsp";	//성공시 메인페이지로
		}else {
			System.out.println("결제 실패");
			return null;
		}
	}
}
