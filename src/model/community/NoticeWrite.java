package model.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CommunityNoticeDTO;

public class NoticeWrite extends Community{
	
	CommunityNoticeDTO cndto = new CommunityNoticeDTO();
	
	public NoticeWrite(CommunityNoticeDTO cndto) {
		this.cndto = cndto;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		cdao.noticeWrite(cndto);
		return "/admin.jsp";
	}

}
