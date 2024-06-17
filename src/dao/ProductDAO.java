package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DTO.CategoryDTO;
import DTO.ProductDTO;
import DTO.ReviewDTO;

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
	private final String REVIEW_AVG = 
			"select avg(review_rating) from review where product_no=?";
	private final String REVIEW_LIST =
			"select r.review_title, r.review_content, r.review_rating, r.purchase_date, c.customer_name "
			+ "from review r join customer c on r.customer_no = c.customer_no where c.customer_no = ?;";
	
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
	
	
	//리뷰평점
	public float getProductRating(long product_no) {
		float rating = 0;
		
		try {
			openConnection();
			pstmt = conn.prepareStatement(REVIEW_AVG);
			pstmt.setLong(1, product_no);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rating = rs.getLong(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return rating;
	}
	
	
	//리뷰목록
	public List<ReviewDTO> getReviewList(long product_no){
		List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		//"select r.review_title, r.review_content, r.review_rating, r.purchase_date, c.customer_name "
		//+ "from review r join customer c on r.customer_no = c.customer_no where c.customer_no = ?;";
		try {
			openConnection();
			pstmt = conn.prepareStatement(REVIEW_LIST);
			pstmt.setLong(1, product_no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewDTO review = new ReviewDTO();
				review.setReview_title(rs.getString("review_title"));
				review.setReview_content(rs.getString("review_content"));
				review.setReview_rating(rs.getInt("review_rating"));
				review.setPurchase_date(rs.getDate("purchase_date"));
				review.setCustomer_name(rs.getString("customer_name"));
				
				reviewList.add(review);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return reviewList;
	}
}
