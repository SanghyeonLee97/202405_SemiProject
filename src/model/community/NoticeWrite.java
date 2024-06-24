package model.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.community.CommunityNoticeDTO;

public class NoticeWrite extends Community{
	
	CommunityNoticeDTO cndto = new CommunityNoticeDTO();
	
	//notice에 입력할 정보객체를 불러오는 생성자
	public NoticeWrite(CommunityNoticeDTO cndto) {
		this.cndto = cndto;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//정보객체에 담긴 정보를 이용해 notice작성
		cdao.noticeWrite(cndto);
		return "/admin.jsp";
	}

}
