package model.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FAQRead extends Community{
	
	String communityFAQNo;
	
	//읽을 게시글 번호 생성자
	public FAQRead(String communityFAQNo) {
		this.communityFAQNo=communityFAQNo;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//게시글 번호에 맞는 faq글을 불러와서 read attribute에 넣는다
		req.setAttribute("read", cdao.getFAQPost(communityFAQNo));
		return "/community/community_FAQ_read.jsp";
	}

}
