package controller.controller_module;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CustomerDTO;
import DTO.ProductInquiryDTO;
import DTO.ReviewDTO;
import model.CommandProsessor;
import model.UpdateInfo;
import model.mypage.Cancelrefund;
import model.mypage.MypageCoupon;
import model.mypage.MypageReserve;
import model.mypage.MypageReviewList;
import model.mypage.MypageWriteReview;
import model.mypage.ProductInquiry;
import model.mypage.ProductInquiryList;

public class Command_MyPage extends Command_Parents{
	
	@Override
	public CommandProsessor command_Operate(HttpServletRequest req, HttpServletResponse resp, String servletPath) {
		if(servletPath.equals("/mypage/updateInfo.do")) {
			if(req.getParameter("id")!=null) {
				CustomerDTO customer = new CustomerDTO();
				customer.setCustomer_id(req.getParameter("id"));
				customer.setCustomer_pw(req.getParameter("password"));
				customer.setCustomer_name(req.getParameter("name"));
				customer.setCustomer_tel(req.getParameter("tel"));
				customer.setPostal_code(req.getParameter("postcode"));
				customer.setAddress_road(req.getParameter("roadAddress"));
				customer.setAddress_detail(req.getParameter("detailAddress"));
				req.setAttribute("customer", customer);
			}
			processor = new UpdateInfo();
		}
		
		if(servletPath.equals("/mypage/reserve.do")) {
			if(req.getParameter("status")!=null) {
				req.setAttribute("status", req.getParameter("status"));
			}
			processor = new MypageReserve();
		}
		if(servletPath.equals("/mypage/cancelrefund.do")) {
			if(req.getParameter("order_no")!=null) {
				req.setAttribute("order_no", req.getParameter("order_no"));
			}
			processor = new Cancelrefund();
		}
		if(servletPath.equals("/mypage/productinquiry.do")) {
			if(req.getParameter("order_no")!=null) {
				req.setAttribute("order_no", req.getParameter("order_no"));
			}
			if(req.getParameter("category")!=null) {
				ProductInquiryDTO pdto = new ProductInquiryDTO();
				pdto.setCategory_no(Integer.parseInt(req.getParameter("category")));
				pdto.setOrder_no(Integer.parseInt(req.getParameter("order_no")));
				pdto.setPi_title(req.getParameter("title"));
				pdto.setPi_content(req.getParameter("content"));
				req.setAttribute("pdto", pdto);
			}
			processor = new ProductInquiry();
		}
		if(servletPath.equals("/mypage/productinquirylist.do")) {
			processor = new ProductInquiryList();
			
		}
		if(servletPath.equals("/mypage/coupon.do")) {
			processor = new MypageCoupon();
			
		}
		if(servletPath.equals("/mypage/reviewlist.do")) {
			processor = new MypageReviewList();
		}
		if(servletPath.equals("/mypage/mypagewritereview.do")) {
			if(req.getParameter("order_no")!=null && req.getParameter("reviewStar")==null) {
				req.setAttribute("order_no", req.getParameter("order_no"));
			}
			if(req.getParameter("reviewStar")!=null) {
				ReviewDTO rdto = new ReviewDTO();
				rdto.setOrder_no(Integer.parseInt(req.getParameter("order_no")));
				rdto.setReview_title(req.getParameter("title"));
				rdto.setReview_content(req.getParameter("content"));
				rdto.setReview_rating(Integer.parseInt(req.getParameter("reviewStar")));
				req.setAttribute("rdto", rdto);
			}
			processor = new MypageWriteReview();
		}
		return processor;
	}

}
