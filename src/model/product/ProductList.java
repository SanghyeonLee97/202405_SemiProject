package model.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CategoryDTO;
import DTO.ProductDTO;
import dao.ProductDAO;
import model.CommandProsessor;

public class ProductList implements CommandProsessor{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("ProductList.java 실행");
		String pc_parent_no = req.getParameter("pc_parent_no");
		String pc_no = req.getParameter("pc_no");
		
		//상품 목록, 세부분류
		ProductDAO productDAO = new ProductDAO();
		List<ProductDTO> productList = null;
		List<CategoryDTO> subCategoryList = null;
		
		
		if(pc_parent_no != null) {
			System.out.println("pc_parent_no 실행");
			subCategoryList = productDAO.getSubCategoryList(Integer.parseInt(pc_parent_no));
			productList = productDAO.getProductListByParentNo(Integer.parseInt(pc_parent_no));
		}else if(pc_no != null){
			System.out.println(pc_no+"pc_no 실행");
			productList = productDAO.getProductListbyPcNo(Integer.parseInt(pc_no));
		}else {
			System.out.println("pc_parent_no 값 없음!");
		}
		req.setAttribute("subCategoryList", subCategoryList);
		req.setAttribute("productList", productList);
		
		return "/product/product_list_page.jsp";
	}

}
