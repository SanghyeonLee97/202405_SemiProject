package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DTO.CategoryDTO;
import DTO.ProductDTO;

public class ProductDAO extends DAO{

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//sql쿼리문
	private final String SUBCATEGORY_LIST =
			"select pc_no, pc_name from product_category where pc_parent_no = ?";
	private final String PARENT_NO_LIST =
			"select p.product_no, p.product_imgurl, p.product_name, p.product_price from product p join product_category c on "
			+ "p.pc_no = c.pc_no where c.pc_parent_no = ?";
	private final String GET_PRODUCT =
			"select product_name, product_imgurl, product_price, product_detail, product_size, "
			+ "product_color, maker, product_mfd, product_poo, product_epd from product where product_no = ?;";
	
	//상품리스트 검색 by 부모번호
	public List<ProductDTO> getProductListByParentNo(int pc_parent_no){
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		try {
			openConnection();
			pstmt = conn.prepareStatement(PARENT_NO_LIST);
			pstmt.setInt(1, pc_parent_no);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO product = new ProductDTO();
				product.setProduct_no(rs.getInt("product_no"));
				product.setProduct_imgurl(rs.getString("product_imgurl"));
				product.setProduct_name(rs.getString("product_name"));
				product.setProduct_price(rs.getInt("product_price"));
				
				productList.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return productList;
	}
	
	
	//소분류목록
	public List<CategoryDTO> getSubCategoryList(int parent_no) {
		List<CategoryDTO> subCategoryList = new ArrayList<CategoryDTO>();
		try {
			openConnection();
			pstmt = conn.prepareStatement(SUBCATEGORY_LIST);
			pstmt.setInt(1, parent_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CategoryDTO category = new CategoryDTO();
				category.setPc_no(rs.getInt("pc_no"));
				category.setPc_name(rs.getString("pc_name"));
				subCategoryList.add(category);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return subCategoryList;
	}
	
	//상품정보 가져오기
	public ProductDTO getProduct(int product_no) {
		ProductDTO product = null;
		
		try {
			openConnection();
			pstmt = conn.prepareStatement(GET_PRODUCT);
			pstmt.setInt(1, product_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				product = new ProductDTO();
				product.setProduct_name(rs.getString("product_name"));
				product.setProduct_imgurl(rs.getString("product_imgurl"));
				product.setProduct_price(rs.getInt("product_price"));
				product.setProduct_detail(rs.getString("product_detail"));
				product.setProduct_size(rs.getString("product_size"));
	            product.setProduct_color(rs.getString("product_color"));
	            product.setMaker(rs.getString("maker"));
	            product.setProduct_mfd(rs.getDate("product_mfd"));
	            product.setProduct_poo(rs.getString("product_poo"));
	            product.setProduct_epd(rs.getDate("product_epd"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return product;
	}
	
	
}
