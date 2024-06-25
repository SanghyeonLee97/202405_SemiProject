package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DTO.product.CartDTO;

public class DibsDAO extends DAO{
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//sql쿼리문
	private final String INSERT_DIBS =
			"insert into dibs (customer_no, product_no) value (?, ?)";
	private final String DELETE_DIBS =
			"delete from dibs where customer_no = ? and product_no= ?";
	private final String GET_CUSTOMER_DIB =
			"select p.product_name, p.product_imgurl, p.product_price, d.customer_no, d.product_no "
			+ "from dibs d join product p on d.product_no = p.product_no where d.customer_no = ?";
	
	
	public boolean insertDibs(long customer_no, long product_no) {
		boolean isInserted = false;
		try {
			openConnection();
			
			pstmt = conn.prepareStatement(INSERT_DIBS);
			pstmt.setLong(1, customer_no);
			pstmt.setLong(2, product_no);
			
			int result = pstmt.executeUpdate();
			if(result > 0) {
				isInserted = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return isInserted;
	}
	
	public boolean deleteDibs(long customer_no, long product_no) {
		boolean isDeleted = false;
		try {
			openConnection();
			
			pstmt = conn.prepareStatement(DELETE_DIBS);
			pstmt.setLong(1, customer_no);
			pstmt.setLong(2, product_no);
			
			int result = pstmt.executeUpdate();
			if(result > 0) {
				isDeleted = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return isDeleted;
	}
	
	public List<CartDTO> getCustomerDibs(long customer_no){
		List<CartDTO> dibsList = new ArrayList<CartDTO>();
		try {
			openConnection();
			pstmt = conn.prepareStatement(GET_CUSTOMER_DIB);
			pstmt.setLong(1, customer_no);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CartDTO dibs = new CartDTO();
				dibs.setProduct_name(rs.getString("product_name"));
				dibs.setProduct_imgurl(rs.getString("product_imgurl"));
				dibs.setProduct_price(rs.getInt("product_price"));
				dibs.setCustomer_no(rs.getLong("customer_no"));
				dibs.setProduct_no(rs.getLong("product_no"));
				
				dibsList.add(dibs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return dibsList;
	}
}
