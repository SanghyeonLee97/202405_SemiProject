package model.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.ProductDTO;
import DTO.ReviewDTO;
import dao.ProductDAO;
import model.CommandProsessor;

public class ProductDetail implements CommandProsessor{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		int product_no = Integer.parseInt(req.getParameter("product_no"));
		
		//상품정보 조회
		ProductDAO productDAO = new ProductDAO();
		ProductDTO product = productDAO.getProduct(product_no);
		
		//리뷰평점 조회
		float avgRating = productDAO.getProductRating(product_no);
		
		//리뷰리스트 조회
		List<ReviewDTO> reviewList = productDAO.getReviewList(product_no);
		
		req.setAttribute("product", product);
		req.setAttribute("avgRating", avgRating);
		req.setAttribute("reviewList", reviewList);
		
		return "/product/product_page.jsp";
	}

}
