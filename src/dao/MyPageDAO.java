package dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;

import DTO.CommunityQNADTO;
import DTO.CustomerDTO;
import DTO.MyPageCancelDTO;
import DTO.MyPageHeaderDTO;
import DTO.MyPageReserveDTO;
import DTO.ProductInquiryDTO;

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
					"(SELECT count(*) FROM review WHERE customer_no = c.customer_no) AS review_count,"+
					"(SELECT count(*) FROM orderproduct WHERE customer_no = c.customer_no) AS order_count,"+
					"(SELECT count(*) FROM customercoupon WHERE customer_no = c.customer_no) AS coupon_count "+
					"FROM customer c WHERE c.customer_no = "+no+";";
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

}
