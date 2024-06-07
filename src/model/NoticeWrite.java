package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CommunityNoticeDTO;
import dao.CommunityDAO;

public class NoticeWrite implements CommandProsessor{
	
	CommunityNoticeDTO cndto = new CommunityNoticeDTO();
	
	public NoticeWrite(CommunityNoticeDTO cndto) {
		this.cndto = cndto;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		CommunityDAO cdao = new CommunityDAO();
		cdao.noticeWrite(cndto);
		return "/admin.jsp";
	}

}
