package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CommunityQNADTO;
import model.CommandProsessor;
import model.FAQRead;
import model.NoticeRead;
import model.QNADelete;
import model.QNARead;
import model.QNAWrite;

public class Command_Community extends Command_Parents{
	
	@Override
	public CommandProsessor command_Operate(HttpServletRequest req, HttpServletResponse resp, String servletPath) {
		if(servletPath.equals("/community/notice.do")) {
			processor = new NoticeRead(req.getParameter("no"),req.getParameter("board"));
		}
		if(servletPath.equals("/community/FAQ.do")) {
			processor = new FAQRead(req.getParameter("no"));
		}
		if(servletPath.equals("/community/QNA.do")) {
			processor = new QNARead(req.getParameter("no"));
		}
		if(servletPath.equals("/community/QNAWrite.do")) {
			CommunityQNADTO cqdto = new CommunityQNADTO();
			cqdto.setQna_title(req.getParameter("title"));
			cqdto.setQna_content(req.getParameter("content"));
			cqdto.setIqc_no(Integer.parseInt(req.getParameter("category")));
			processor = new QNAWrite(cqdto);
		}
		if(servletPath.equals("/community/QNADelete.do")) {
			processor = new QNADelete(Integer.parseInt(req.getParameter("no")));
		}
		return processor;
	}
}
