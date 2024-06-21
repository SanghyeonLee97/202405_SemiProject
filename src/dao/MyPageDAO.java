package dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;

import DTO.CommunityQNADTO;
import DTO.CustomerDTO;
import DTO.MyPageCancelDTO;
import DTO.MyPageCouponDTO;
import DTO.MyPageHeaderDTO;
import DTO.MyPageMainDTO;
import DTO.MyPageReserveDTO;
import DTO.MyPageReviewDTO;
import DTO.ProductInquiryDTO;
import DTO.ReviewDTO;

public class MyPageDAO extends DAO{
	
	//회원정보수정
	public void customerUpdateInfo(CustomerDTO cdto) {
		Statement stmt = null;
		String query = "";
		openConnection();
		try {
			query = "update customer set customer_pw='"+cdto.getCustomer_pw()+"',customer_name='"+cdto.getCustomer_name()+
					"',customer_tel='"+cdto.getCustomer_tel()+"',postal_code="+cdto.getPostal_code()+
					",address_road='"+cdto.getAddress_road()+"',address_detail='"+cdto.getAddress_detail()+
					"' where customer_id='"+cdto.getCustomer_id()+"';";
			System.out.println(query);
			stmt = (Statement) conn.createStatement();
			stmt.executeUpdate(query);
		}catch (Exception e) {
			System.out.println("회원정보수정 오류발생");
		}finally {
			closeConnection();
		}
	}
	
	//마이페이지 헤더 정보
	public MyPageHeaderDTO getMyPageHeader(String no) {
		MyPageHeaderDTO res = new MyPageHeaderDTO();
		Statement stmt = null;
		String query = "";
		openConnection();
		try {
			query = "SELECT c.customer_point,"+
					"(SELECT count(*) FROM review inner join orderproduct on review.order_no=orderproduct.order_no "+
					"WHERE orderproduct.customer_no = "+no+") AS review_count,"+
					"(SELECT count(*) FROM orderproduct WHERE customer_no = "+no+") AS order_count,"+
					"(SELECT count(*) FROM customercoupon WHERE customer_no = "+no+") AS coupon_count "+
					"FROM customer c WHERE c.customer_no = "+no;
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				res.setCustomer_point(rs.getInt("customer_point"));
				res.setReview_count(rs.getInt("review_count"));
				res.setOrder_count(rs.getInt("order_count"));
				res.setCoupon_count(rs.getInt("coupon_count"));
			}
		}catch (Exception e) {
			System.out.println("마이페이지 헤더 정보 오류발생");
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return res;
	}
	
	//mypage 적립금 조회
	public ArrayList<MyPageReserveDTO> getMypageReserve(int customer_no,String point_status) {
		ArrayList<MyPageReserveDTO> res = new ArrayList<MyPageReserveDTO>();
		Statement stmt = null;
		String query = "";
		openConnection();
		try {
			query = "select point_status,point_amount,product.product_name,orderproduct.order_no "+
					"from point inner join orderproduct on point.order_no=orderproduct.order_no "+
					"inner join product on orderproduct.product_no=product.product_no "+
					"where orderproduct.customer_no="+customer_no;
			if(!point_status.equals("")) {
				query+=" && point_status="+point_status;
			}
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				MyPageReserveDTO mdto = new MyPageReserveDTO();
				mdto.setPoint_status(rs.getInt("point_status"));
				mdto.setPoint_amount(rs.getInt("point_amount"));
				mdto.setProduct_name(rs.getString("product_name"));
				mdto.setOrder_no(rs.getInt("order_no"));
				res.add(mdto);
			}
		}catch (Exception e) {
			System.out.println("mypage 적립금 조회에러");
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return res;
	}
	//취소페이지 조회
	public ArrayList<MyPageCancelDTO> getMypageCancel(int customer_no) {
		ArrayList<MyPageCancelDTO> res = new ArrayList<MyPageCancelDTO>();
		Statement stmt = null;
		String query = "";
		openConnection();
		try {
			query = "select product.product_imgurl,product.product_name,product.product_price,"+
					"orderproduct.order_date,orderproduct.order_quantity,orderproduct.order_no,"+
					"orderproduct.status from orderproduct "+
					"inner join product on orderproduct.product_no = product.product_no "+
					"where customer_no="+customer_no+";";
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				MyPageCancelDTO mdto = new MyPageCancelDTO();
				mdto.setProduct_imgurl(rs.getString("product_imgurl"));
				mdto.setProduct_name(rs.getString("product_name"));
				mdto.setProduct_price(rs.getInt("product_price"));
				mdto.setOrder_date(rs.getDate("order_date"));
				mdto.setOrder_quantity(rs.getInt("order_quantity"));
				mdto.setOrder_no(rs.getInt("order_no"));
				mdto.setStatus(rs.getInt("status"));
				res.add(mdto);
			}
		}catch (Exception e) {
			System.out.println("취소페이지 조회에러");
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return res;
	}
	
	//주문 취소
	public void cancelOrder(String order_no) {
		Statement stmt = null;
		String query = "";
		openConnection();
		try {
			query = "update orderproduct set status=1 where order_no="+order_no;
			stmt = (Statement) conn.createStatement();
			stmt.executeUpdate(query);
		}catch (Exception e) {
			System.out.println("주문 취소 오류발생");
		}finally {
			closeConnection();
		}
	}
	
	//상품문의 등록
	public void insertProductInquiry(ProductInquiryDTO pidto) {
		Statement stmt = null;
		String query = "";
		openConnection();
		try {
			query = "insert into product_inquiry(pi_title,pi_content,pi_date,order_no,category_no) "+
					"values('"+pidto.getPi_title()+"','"+pidto.getPi_content()+
					"',now(),"+pidto.getOrder_no()+","+pidto.getCategory_no()+");";
			System.out.println(query);
			stmt = (Statement) conn.createStatement();
			stmt.executeUpdate(query);
		}catch (Exception e) {
			System.out.println("상품문의 등록 오류발생");
		}finally {
			closeConnection();
		}
	}
	
	//1:1문의
	public ArrayList<ProductInquiryDTO> getInquiryList(int customerNo) {
		ArrayList<ProductInquiryDTO> res = new ArrayList<ProductInquiryDTO>();
		Statement stmt = null;
		String query = "";
		openConnection();
		try {
			query = "select orderproduct.order_no,product_inquiry.pi_title,"+
					"product_inquiry.pi_date,product_inquiry.pi_answer "+
					"from product_inquiry inner join orderproduct "+
					"on product_inquiry.order_no=orderproduct.order_no "+
					"where orderproduct.customer_no="+customerNo;
			System.out.println(query);
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				ProductInquiryDTO pidto = new ProductInquiryDTO();
				pidto.setOrder_no(rs.getInt("order_no"));
				pidto.setPi_title(rs.getString("pi_title"));
				pidto.setPi_date(rs.getTimestamp("pi_date"));
				pidto.setPi_answer(rs.getString("pi_answer"));
				res.add(pidto);
			}
		}catch (Exception e) {
			System.out.println("1:1문의 검색 오류발생");
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return res;
	}
	
	//mypage 쿠폰 조회
	public ArrayList<MyPageCouponDTO> getMypageCoupon(int customer_no) {
		ArrayList<MyPageCouponDTO> res = new ArrayList<MyPageCouponDTO>();
		Statement stmt = null;
		String query = "";
		openConnection();
			try {
			query = "select coupon.coupon_name,coupon.coupon_discount,coupon.coupon_limit,"+
					"customercoupon.coupon_duedate from customercoupon "+
					"inner join coupon on customercoupon.coupon_no=coupon.coupon_no "+
					"where customercoupon.customer_no="+customer_no;
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				MyPageCouponDTO mcdto = new MyPageCouponDTO();
				mcdto.setCoupon_name(rs.getString("coupon_name"));
				mcdto.setCoupon_discount(rs.getInt("coupon_discount"));
				mcdto.setCoupon_limit(rs.getString("coupon_limit"));
				mcdto.setCoupon_duedate(rs.getDate("coupon_duedate"));
				res.add(mcdto);
			}
		}catch (Exception e) {
			System.out.println("mypage 쿠폰 조회");
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return res;
	}
	
	//mypage 리뷰 조회
	public ArrayList<MyPageReviewDTO> getMypageReview(int customer_no) {
		ArrayList<MyPageReviewDTO> res = new ArrayList<MyPageReviewDTO>();
		Statement stmt = null;
		String query = "";
		openConnection();
			try {
			query = "select product.product_imgurl,product.product_name,product.product_price,"+
					"orderproduct.order_quantity,orderproduct.order_no,review.review_rating,"+
					"review.review_title,review.review_content,review.review_date "+
					"from review inner join orderproduct on review.order_no=orderproduct.order_no "+
					"inner join product on orderproduct.product_no=product.product_no "+
					"where orderproduct.customer_no="+customer_no;
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				MyPageReviewDTO mrdto = new MyPageReviewDTO();
				mrdto.setProduct_imgurl(rs.getString("product_imgurl"));
				mrdto.setProduct_name(rs.getString("product_name"));
				mrdto.setProduct_price(rs.getInt("product_price"));
				mrdto.setOrder_quantity(rs.getInt("order_quantity"));
				mrdto.setOrder_no(rs.getInt("order_no"));
				mrdto.setReview_rating(rs.getInt("review_rating"));
				mrdto.setReview_title(rs.getString("review_title"));
				mrdto.setReview_content(rs.getString("review_content"));
				mrdto.setReview_date(rs.getTimestamp("review_date"));
				res.add(mrdto);
			}
		}catch (Exception e) {
			System.out.println("mypage 리뷰 조회");
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return res;
	}
	
	//mypage 메인조회,주문배송 조회
	public ArrayList<MyPageMainDTO> getMypageMain(int customer_no) {
		ArrayList<MyPageMainDTO> res = new ArrayList<MyPageMainDTO>();
		Statement stmt = null;
		String query = "";
		openConnection();
		try {
			query = "select product.product_imgurl,product.product_name,product.product_price,"+
					"orderproduct.order_quantity,orderproduct.order_no,orderproduct.status "+
					"from orderproduct inner join product on orderproduct.product_no=product.product_no "+
					"where orderproduct.customer_no="+customer_no;
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				MyPageMainDTO mmdto = new MyPageMainDTO();
				mmdto.setProduct_imgurl(rs.getString("product_imgurl"));
				mmdto.setProduct_name(rs.getString("product_name"));
				mmdto.setProduct_price(rs.getInt("product_price"));
				mmdto.setOrder_quantity(rs.getInt("order_quantity"));
				mmdto.setOrder_no(rs.getInt("order_no"));
				mmdto.setStatus(rs.getInt("status"));
				res.add(mmdto);
			}
		}catch (Exception e) {
			System.out.println("mypage 메인조회,주문배송 조회");
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return res;
	}
	
	//리뷰 등록
	public void insertProductReview(ReviewDTO rdto) {
		Statement stmt = null;
		String query = "";
		openConnection();
		try {
			query = "insert into review(review_title,review_content,review_rating,review_date,order_no) "+
					"values('"+rdto.getReview_title()+"','"+rdto.getReview_content()+
					"',"+rdto.getReview_rating()+",now(),"+rdto.getOrder_no()+");";
			stmt = (Statement) conn.createStatement();
			stmt.executeUpdate(query);
		}catch (Exception e) {
			System.out.println("리뷰 등록 오류발생");
		}finally {
			closeConnection();
		}
	}
	
}
