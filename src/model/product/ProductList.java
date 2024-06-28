package model.product;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CategoryDTO;
import DTO.product.CartDTO;
import DTO.product.ProductDTO;
import dao.DibsDAO;
import dao.ProductDAO;

public class ProductList extends Product{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("ProductList.java 실행");
		String pc_parent_no = req.getParameter("pc_parent_no");
		String pc_no = req.getParameter("pc_no");
		session = req.getSession();
		//상품 목록, 세부분류
		productDAO = new ProductDAO();
		List<ProductDTO> productList = null;
		List<CategoryDTO> subCategoryList = null;
		
		//대분류 검색
		if(pc_parent_no != null && pc_no != null) {
			System.out.println(pc_no+"pc_no 실행");
			productList = productDAO.getProductListbyPcNo(Integer.parseInt(pc_no));
			subCategoryList = productDAO.getSubCategoryList(Integer.parseInt(pc_parent_no));
			
			session.setAttribute("pc_no", pc_no);
			session.removeAttribute("pc_parent_no");
			
		//소분류 검색
		} else if(pc_parent_no != null){
			System.out.println("pc_parent_no 실행");
			subCategoryList = productDAO.getSubCategoryList(Integer.parseInt(pc_parent_no));
			productList = productDAO.getProductListByParentNo(Integer.parseInt(pc_parent_no));
			
			session.setAttribute("pc_parent_no", pc_parent_no);
			session.removeAttribute("pc_no");
		}else {
			System.out.println("pc_parent_no 값 없음!");
		}
		req.setAttribute("subCategoryList", subCategoryList);
		req.setAttribute("productList", productList);
		
		
		//최근 본 상품을 출력하는 로직
		List<ProductDTO> recentlyViewedProducts = getRecentlyViewedProducts(req);
		req.setAttribute("recentlyViewedProducts", recentlyViewedProducts);
		
		
		// 로그인한 회원의 찜한 상품 정보 가져오는 로직
		session = req.getSession();
		String customerNo = (String) session.getAttribute("no");
		if(customerNo != null) {
			dibsDAO = new DibsDAO();
			List<CartDTO> dibsList = dibsDAO.getCustomerDibs(Long.parseLong(customerNo));
			req.setAttribute("dibsList", dibsList);
		}
		return "/product/product_list_page.jsp";
	}

	
	private List<ProductDTO> getRecentlyViewedProducts(HttpServletRequest req) {
		List<ProductDTO> recentlyViewedProducts = new ArrayList<ProductDTO>();
		Cookie[] cookies = req.getCookies();
		
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if ("recentlyViewedProducts".equals(cookie.getName())) {
					try {
						String cookieValue = URLDecoder.decode(cookie.getValue(), "utf-8");
						for (String productInfo : cookieValue.split(",")) {
							String[] productDetails = productInfo.split("\\|");
							if (productDetails.length == 3) {
								int productNo = Integer.parseInt(productDetails[0]);
                                String productImgUrl = productDetails[1];
                                String productName = productDetails[2];
								
                                ProductDTO product = new ProductDTO();
                                product.setProduct_no(productNo);
                                product.setProduct_imgurl(productImgUrl);
                                product.setProduct_name(productName);
								
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
