package controller.controller_module;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.community.CommunityQNADTO;
import model.CommandProsessor;
import model.community.CommunityDelete;
import model.community.FAQRead;
import model.community.NoticeRead;
import model.community.QNAAnswer;
import model.community.QNARead;
import model.community.QNAWrite;

//community 경로를 처리
public class Command_Community extends Command_Parents{
	
	@Override
	public CommandProsessor command_Operate(HttpServletRequest req, HttpServletResponse resp, String servletPath) {
		//경로가 /community/notice.do라면
		if(servletPath.equals("/community/notice.do")) {
			//no parameter와 board parameter를 받아서 공지리스트를 업캐스팅
			processor = new NoticeRead(req.getParameter("no"),req.getParameter("board"));
		}
		
		//경로가 /community/FAQ.do라면
		if(servletPath.equals("/community/FAQ.do")) {
			//no parameter를 받아서 FAQ리스트를 업캐스팅
			processor = new FAQRead(req.getParameter("no"));
		}
		
		//경로가 /community/QNA.do라면
		if(servletPath.equals("/community/QNA.do")) {
			//no parameter를 받아서 QNA리스트를 업캐스팅
			processor = new QNARead(req.getParameter("no"));
		}
		
		//경로가 /community/QNAWrite.do라면
		if(servletPath.equals("/community/QNAWrite.do")) {
			//DTO생성 
			CommunityQNADTO cqdto = new CommunityQNADTO();
			//title parameter와 content parameter와 정수변환한 category parameter를 받아 cqdto에 넣는다
			cqdto.setQna_title(req.getParameter("title"));
			cqdto.setQna_content(req.getParameter("content"));
			cqdto.setIqc_no(Integer.parseInt(req.getParameter("category")));
			//QNA작성 업캐스팅
			processor = new QNAWrite(cqdto);
		}
		
		//경로가 /community/QNADelete.do라면
		if(servletPath.equals("/community/QNADelete.do")) {
			//board parameter와 정수변환한 no parameter를 받아서 QNA삭제 업캐스팅
			processor = new CommunityDelete(req.getParameter("board"),Integer.parseInt(req.getParameter("no")));
		}
		
		//경로가 /community/QNAAnswer.do라면
		if(servletPath.equals("/community/QNAAnswer.do")) {
			//정수변환한 no parameter와  answer parameter 를 받아서 QNA답변 업캐스팅
			processor = new QNAAnswer(Integer.parseInt(req.getParameter("no")),req.getParameter("answer") );
		}
		return processor;
	}
}
