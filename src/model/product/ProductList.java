package model.product;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
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
		
		
		//최근 본 상품을 출력하는 로직
		List<ProductDTO> recentlyViewedProducts = getRecentlyViewedProducts(req);
		req.setAttribute("recentlyViewedProducts", recentlyViewedProducts);
		
		return "/product/product_list_page.jsp";
	}

	
	private List<ProductDTO> getRecentlyViewedProducts(HttpServletRequest req){
		List<ProductDTO> recentlyViewedProducts = new ArrayList<ProductDTO>();
		Cookie [] cookies = req.getCookies();
		
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if ("recentlyViewedProducts".equals(cookie.getName())) {
					try {
						String cookieValue = URLDecoder.decode(cookie.getValue(), "utf-8");
						for (String productInfo : cookieValue.split(",")) {
							String[] productDetails = productInfo.split("\\|");
							if (productDetails.length == 2) {
								int productNo = Integer.parseInt(productDetails[0]);
                                String productImgUrl = productDetails[1];
								
                                ProductDTO product = new ProductDTO();
                                product.setProduct_no(productNo);
                                product.setProduct_imgurl(productImgUrl);
								
                                recentlyViewedProducts.add(product);
							}
						}
					} catch (UnsupportedEncodingException | NumberFormatException e) {
						e.printStackTrace();
					}
				}
			}
		}
	    return recentlyViewedProducts;
	}
}
