package dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;

import DTO.CommunityNoticeDTO;
import DTO.CustomerDTO;
import DTO.MyPageHeaderDTO;
import DTO.MyPageReserveDTO;

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
			query = "select point.point_status,point.point_amount,product.product_name from point inner join product on point.orderproduct_product_no=product.product_no where orderproduct_customer_no="+customer_no;
			if(!point_status.equals("")) {
				query+=" && point_status="+point_status;
			}
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			System.out.println(query);
			while(rs.next()) {
				MyPageReserveDTO mdto = new MyPageReserveDTO();
				mdto.setPoint_status(rs.getInt("point_status"));
				mdto.setPoint_amount(rs.getInt("point_amount"));
				mdto.setProduct_name(rs.getString("product_name"));
				res.add(mdto);
			}
		}catch (Exception e) {
			System.out.println("mypage 적립금 조회");
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return res;
	}

}
