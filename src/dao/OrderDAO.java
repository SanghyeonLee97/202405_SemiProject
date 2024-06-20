package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DTO.OrderDTO;

public class OrderDAO extends DAO{
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//SQL 쿼리문
	private final String GET_CUSTOMER_POINT =
			"select customer_point from customer where customer_no = ?";
	private final String MAKE_ORDER =
			"insert into orderproduct (customer_no, product_no, coupon_no, order_quantity, status, order_date) "
			+ "values(?, ?, ?, ?, ?, ?);";
	private final String NEW_POINT =
			"insert into point (point_status, point_amount, order_no) "
			+ "values (?, ?, ?);";
	private final String UPDATE_CUSTOMER_POINT =
			"update customer set customer_point = ? where customer_no = ?";
	
	//고객 적립금 불러오기
	public int getCustomerPoint(int customerNo) {
		int point = 0;
		
		try {
			openConnection();
			pstmt = conn.prepareStatement(GET_CUSTOMER_POINT);
			pstmt.setInt(1, customerNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				point = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return point;
	}
	
	//주문하기
	public boolean makeOrder(OrderDTO orderDTO) {
		boolean isInserted = false;
		OrderDTO order = new OrderDTO();
		//"insert into orderproduct (customer_no, product_no, coupon_no, order_quantity, status, order_date) "
		//+ "values(?, ?, ?, ?, ?, ?);";
		try {
			openConnection();
			pstmt = conn.prepareStatement(MAKE_ORDER);
			pstmt.setLong(1, order.getCustomer_no());
			pstmt.setLong(2, order.getProduct_no());
			pstmt.setLong(3, order.getCoupon_no());
			pstmt.setLong(4, order.getOrder_quantity());
			pstmt.setInt(5, order.getStatus());
			pstmt.setDate(6, (Date)order.getOrder_date());
			
			int result = pstmt.executeUpdate();
			if (result > 0) {
				isInserted = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return isInserted;
	}
	
	//새로운 적립금 내역
	public boolean newPoint(int point_status, long point_amount, long order_no) {
		boolean isInserted = false;
		
		try {
			openConnection();
			pstmt = conn.prepareStatement(NEW_POINT);
			//"insert into point (point_status, point_amount, order_no) "
			//+ "values (?, ?, ?);";
			pstmt.setInt(1, point_status);
			pstmt.setLong(2, point_amount);
			pstmt.setLong(3, order_no);
			
			int result = pstmt.executeUpdate();
			
			if (result > 0) {
				isInserted = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return isInserted;
	}
	
	//고객 적립금 수정
	public boolean updatePoint(int customer_point, long customer_no) {
		boolean isUpdated = false;
		
		try {
			openConnection();
			pstmt = conn.prepareStatement(UPDATE_CUSTOMER_POINT);
			//"update customer set customer_point = ? where customer_no = ?";
			pstmt.setInt(1, customer_point);
			pstmt.setLong(2, customer_no);
			
			int result = pstmt.executeUpdate();
			if (result > 0) {
				isUpdated = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return isUpdated;
	}
	
}
