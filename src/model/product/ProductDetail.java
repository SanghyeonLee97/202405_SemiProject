package model.product;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Deque;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.ReviewDTO;
import DTO.product.CartDTO;
import DTO.product.ProductDTO;
import DTO.product.ProductQnaDTO;
import dao.MyPageDAO;
import dao.ProductDAO;

public class ProductDetail extends Product{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//세션확인
		session = req.getSession();
		String id = (String)session.getAttribute("id");
		String customerNo = (String)session.getAttribute("no");
		
		
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
		int reviewPage = req.getParameter("reviewPage") != null ? Integer.parseInt(req.getParameter("reviewPage")) : 1;
		int reviewPageSize = 5;
		int reviewStart = (reviewPage-1) *reviewPageSize;
		List<ReviewDTO> reviewList = productDAO.getReviewList(product_no, reviewStart, reviewPageSize);
		int reviewCount = productDAO.getReviewCount(product_no);
		int reviewPageCount = (int)Math.ceil((double)reviewCount / reviewPageSize);
		
		//QNA 목록조회
		int qnaPage = req.getParameter("qnaPage") != null ? Integer.parseInt(req.getParameter("qnaPage")) : 1;
		int qnaPageSize = 5;
		int qnaStart = (qnaPage-1) * qnaPageSize;
		List<ProductQnaDTO> qnaList = productDAO.getQNAList(product_no, qnaStart, qnaPageSize);
		int qnaCount = productDAO.getQNACount(product_no);
		int qnaPageCount = (int)Math.ceil((double)qnaCount / qnaPageSize);
		
		//장바구니 확인
		MyPageDAO mypageDAO = new MyPageDAO();
		if(customerNo != null) {
			List<CartDTO> cartList = mypageDAO.getCartList(Integer.parseInt(customerNo));
			req.setAttribute("cartList", cartList);
		}
		

		
		//지금 클릭하여 조회하는 상품을 최근 본 상품에 추가해야함
		saveProductToCookie(req, resp, cookieProduct);
		
		req.setAttribute("product", product);
		req.setAttribute("avgRating", avgRating);
		
		
		req.setAttribute("reviewList", reviewList);
		req.setAttribute("reviewPage", reviewPage);
		req.setAttribute("reviewPageCount", reviewPageCount);
		
		req.setAttribute("qnaList", qnaList);
		req.setAttribute("qnaPage", qnaPage);
		req.setAttribute("qnaPageCount", qnaPageCount);
		
		return "/product/product_page.jsp";
	}
	
	private void saveProductToCookie(HttpServletRequest req, HttpServletResponse resp, ProductDTO product) {
		String cookieName = "recentlyViewedProducts";
		String productInfo = product.getProduct_no() + "|" + product.getProduct_imgurl() + "|" + product.getProduct_name();
		System.out.println("상품의정보확인: "+productInfo);
		
		Deque<String> productQueue = new LinkedList<>();
		
		//기존의 쿠키 읽기
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookieName.equals(cookie.getName())) {
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
		
		
		//Queue에 상품이 중복되는 경우 제거
		productQueue.remove(productInfo);
		//Queue에 새로운 상품(쿠키) 추가
		productQueue.addFirst(productInfo);
		
		// 크기 제한을 초과할 경우 마지막 항목 제거
		if (productQueue.size() > 3) {
			productQueue.removeLast();
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