package model.product;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.ReviewDTO;
import DTO.product.ProductDTO;
import DTO.product.ProductQnaDTO;
import dao.ProductDAO;

public class ProductDetail extends Product{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		int product_no = Integer.parseInt(req.getParameter("product_no"));
		
		//상품정보 조회
		productDAO = new ProductDAO();
		ProductDTO product = productDAO.getProduct(product_no);
		
		//쿠키에게 전달할 정보
		ProductDTO cookieProduct = new ProductDTO();
		cookieProduct.setProduct_no(product_no);
		cookieProduct.setProduct_imgurl(product.getProduct_imgurl());
		cookieProduct.setProduct_name(product.getProduct_name());
		
		//리뷰평점 조회
		float avgRating = productDAO.getProductRating(product_no);
		
		//리뷰리스트 조회
		List<ReviewDTO> reviewList = productDAO.getReviewList(product_no);
		
		//QNA 목록조회
		List<ProductQnaDTO> qnaList = productDAO.getQNAList(product_no);
		
		//지금 클릭하여 조회하는 상품을 최근 본 상품에 추가해야함
		saveProductToCookie(req, resp, cookieProduct);
		
		req.setAttribute("product", product);
		req.setAttribute("avgRating", avgRating);
		req.setAttribute("reviewList", reviewList);
		req.setAttribute("qnaList", qnaList);
		return "/product/product_page.jsp";
	}
	
	private void saveProductToCookie(HttpServletRequest req, HttpServletResponse resp, ProductDTO product) {
		String cookieName = "recentlyViewedProducts";
		String productInfo = product.getProduct_no() + "|" + product.getProduct_imgurl() + "|" + product.getProduct_name();
		System.out.println("상품의정보확인: "+productInfo);
		Queue<String> productQueue = new LinkedList<>();
		
		//기존의 쿠키 읽기
		Cookie[] cookies = req.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookieName.equals(cookie.getName())) {
					try {
						String cookieValue = URLDecoder.decode(cookie.getValue(), "utf-8");
						for (String item : cookieValue.split(",")) {
							productQueue.add(item);
						}
					}catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		//Queue에 새로운 상품(쿠키) 추가
		if(!productQueue.contains(productInfo)) {
			if(productQueue.size() >= 3) {
				productQueue.poll();
			}
			productQueue.add(productInfo);
		}
		
		//Queue를 쿠키에 저장
		StringBuilder sb = new StringBuilder();
		for (String item : productQueue) {
			if (sb.length() > 0) {
				sb.append(",");
			}
			sb.append(item);
		}

		String cookieValue = "";
		try {
			cookieValue = URLEncoder.encode(sb.toString(), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}


		Cookie cookie = new Cookie(cookieName, cookieValue);
		cookie.setMaxAge(60 * 60 * 24 * 7);
		cookie.setPath("/");
		resp.addCookie(cookie);
	}
}