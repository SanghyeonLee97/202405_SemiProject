package controller.controller_module;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.community.CommunityFAQDTO;
import DTO.community.CommunityNoticeDTO;
import model.CommandProsessor;
import model.community.FAQWrite;
import model.community.NoticeWrite;
import model.member.QuitUser;
import model.mypage.UpdateInfo;

public class Command_Etc extends Command_Parents{

	@Override
	public CommandProsessor command_Operate(HttpServletRequest req, HttpServletResponse resp, String servletPath) {
		if(servletPath.equals("/noticeWrite.do")) {
			CommunityNoticeDTO cndto = new CommunityNoticeDTO();
			cndto.setNoticeTitle(req.getParameter("noticeTitle"));
			cndto.setNoticeContent(req.getParameter("noticeContent"));
			processor = new NoticeWrite(cndto);
		}
		if(servletPath.equals("/faqWrite.do")) {
			CommunityFAQDTO cfdto = new CommunityFAQDTO();
			cfdto.setFaqTitle(req.getParameter("title"));
			cfdto.setFaqContent(req.getParameter("content"));
			cfdto.setFaqIQCNo(Integer.parseInt(req.getParameter("category")));
			processor = new FAQWrite(cfdto);
		}
		if(servletPath.equals("/kickUser.do")) {
			processor = new QuitUser(req.getParameter("id"),0);
		}
		if(servletPath.equals("/mypage/updateInfo.do")) {
			processor = new UpdateInfo();
		}
		
		return processor;
	}

}
