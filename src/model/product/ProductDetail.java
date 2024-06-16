package model.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.ProductDTO;
import dao.ProductDAO;
import model.CommandProsessor;

public class ProductDetail implements CommandProsessor{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		int product_no = Integer.parseInt(req.getParameter("product_no"));
		
		ProductDAO productDAO = new ProductDAO();
		ProductDTO product = productDAO.getProduct(product_no);
		
		req.setAttribute("product", product);
		return "/product/product_page.jsp";
	}

}
