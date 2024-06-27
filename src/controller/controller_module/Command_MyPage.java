package controller.controller_module;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CustomerDTO;
import DTO.ReviewDTO;
import DTO.mypage.ProductInquiryDTO;
import model.CommandProsessor;
import model.mypage.Cancelrefund;
import model.mypage.CartList;
import model.mypage.DeleteCart;
import model.mypage.DibsList;
import model.mypage.MypageCoupon;
import model.mypage.MypageReserve;
import model.mypage.MypageReviewList;
import model.mypage.MypageWriteReview;
import model.mypage.ProductInquiry;
import model.mypage.ProductInquiryList;
import model.mypage.UpdateInfo;

//mypage 경로를 처리
public class Command_MyPage extends Command_Parents{
	
	@Override
	public CommandProsessor command_Operate(HttpServletRequest req, HttpServletResponse resp, String servletPath) {
		//경로가 /mypage/updateInfo.do라면
		if(servletPath.equals("/mypage/updateInfo.do")) {
			//id parameter가 존재한다면
			if(req.getParameter("id")!=null) {
				//DTO생성
				CustomerDTO customer = new CustomerDTO();
				//id,password,name,tel,postcode,roadAddress,detailAddress parameter를 받아 customer에 넣는다
				customer.setCustomer_id(req.getParameter("id"));
				customer.setCustomer_pw(req.getParameter("password"));
				customer.setCustomer_name(req.getParameter("name"));
				customer.setCustomer_tel(req.getParameter("tel"));
				customer.setPostal_code(req.getParameter("postcode"));
				customer.setAddress_road(req.getParameter("roadAddress"));
				customer.setAddress_detail(req.getParameter("detailAddress"));
				//customer 객체를 customer attribute에 넣는다
				req.setAttribute("customer", customer);
			}
			//회원 정보 수정 업캐스팅
			processor = new UpdateInfo();
		}
		
		//경로가 /mypage/reserve.do라면
		if(servletPath.equals("/mypage/reserve.do")) {
			//status parameter가 존재한다면
			if(req.getParameter("status")!=null) {
				//status parameter를 status attribute에 넣는다
				req.setAttribute("status", req.getParameter("status"));
			}
			//적립금목록 업캐스팅
			processor = new MypageReserve();
		}
		
		//경로가 /mypage/cancelrefund.do라면
		if(servletPath.equals("/mypage/cancelrefund.do")) {
			//order_no parameter가 존재한다면
			if(req.getParameter("order_no")!=null) {
				//order_no parameter를 order_no attribute에 넣는다
				req.setAttribute("order_no", req.getParameter("order_no"));
			}
			//취소환불목록 업캐스팅
			processor = new Cancelrefund();
		}
		
		//경로가 /mypage/productinquiry.do라면
		if(servletPath.equals("/mypage/productinquiry.do")) {
			//order_no parameter가 존재한다면
			if(req.getParameter("order_no")!=null) {
				//order_no parameter를 order_no attribute에 넣는다
				req.setAttribute("order_no", req.getParameter("order_no"));
			}
			//category parameter가 존재한다면
			if(req.getParameter("category")!=null) {
				//DTO생성
				ProductInquiryDTO pdto = new ProductInquiryDTO();
				//정수변환한 category,정수변환한 order_no,title,content를 pdto에 넣는다
				pdto.setCategory_no(Integer.parseInt(req.getParameter("category")));
				pdto.setOrder_no(Integer.parseInt(req.getParameter("order_no")));
				pdto.setPi_title(req.getParameter("title"));
				pdto.setPi_content(req.getParameter("content"));
				//pdto 객체를 pdto attribute에 넣는다
				req.setAttribute("pdto", pdto);
			}
			//상품문의 업캐스팅
			processor = new ProductInquiry();
		}
		
		//경로가 /mypage/productinquirylist.do라면
		if(servletPath.equals("/mypage/productinquirylist.do")) {
			//상품문의 리스트 업캐스팅
			processor = new ProductInquiryList();
		}
		
		//경로가 /mypage/coupon.do라면
		if(servletPath.equals("/mypage/coupon.do")) {
			//쿠폰 리스트 업캐스팅
			processor = new MypageCoupon();
		}
		
		//경로가 /mypage/reviewlist.do라면
		if(servletPath.equals("/mypage/reviewlist.do")) {
			//리뷰 리스트 업캐스팅
			processor = new MypageReviewList();
		}
		
		//경로가 /mypage/reviewlist.do라면
		if(servletPath.equals("/mypage/mypagewritereview.do")) {
			//order_no parameter가 존재하고 reviewStar parameter가 존재하지 않는다면
			if(req.getParameter("order_no")!=null && req.getParameter("reviewStar")==null) {
				//order_no parameter를 order_no attribute에 넣는다
				req.setAttribute("order_no", req.getParameter("order_no"));
			}
			
			//reviewStar parameter가 존재한다면
			if(req.getParameter("reviewStar")!=null) {
				//DTO생성
				ReviewDTO rdto = new ReviewDTO();
				//정수변환한 order_no,title,content,정수변환한 reviewStar를 rdto에 넣는다
				rdto.setOrder_no(Integer.parseInt(req.getParameter("order_no")));
				rdto.setReview_title(req.getParameter("title"));
				rdto.setReview_content(req.getParameter("content"));
				rdto.setReview_rating(Integer.parseInt(req.getParameter("reviewStar")));
				//rdto 객체를 rdto attribute에 넣는다
				req.setAttribute("rdto", rdto);
			}
			//리뷰 작성 업캐스팅
			processor = new MypageWriteReview();
		}
		//경로가 /mypage/cartList.do라면
		if(servletPath.equals("/mypage/cartList.do")) {
			processor = new CartList();
		}
		//경로가 /mypage/deleteCart.do라면
		if(servletPath.equals("/mypage/deleteCart.do")) {
			processor = new DeleteCart();
		}
		//경로가 /mypage/deleteCart.do라면
		if(servletPath.equals("/mypage/dibsList.do")) {
			processor = new DibsList();
		}
		return processor;
	}

}
