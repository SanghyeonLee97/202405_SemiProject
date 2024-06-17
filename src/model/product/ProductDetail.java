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
		
		ProductDAO productDAO = new ProductDAO();
		ProductDTO product = productDAO.getProduct(product_no);
		float avgRating = productDAO.getProductRating(product_no);
		List<ReviewDTO> reviewList = productDAO.getReviewList(product_no);
		
		req.setAttribute("product", product);
		req.setAttribute("avgRating", avgRating);
		req.setAttribute("reviewList", reviewList);
		return "/product/product_page.jsp";
	}

}
