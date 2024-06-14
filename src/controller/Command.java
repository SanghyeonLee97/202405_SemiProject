package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.CommunityFAQDTO;
import DTO.CommunityNoticeDTO;
import DTO.CustomerDTO;
import model.CommandProsessor;
import model.FAQWrite;
import model.IdChk;
import model.LoginChk;
import model.Logout;
import model.NoticeWrite;
import model.QuitUser;
import model.Register;
import model.UpdateInfo;

@WebServlet("*.do")
public class Command extends HttpServlet{
	CommandProsessor processor = null;		
	String view = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String servletPath = req.getServletPath();
		System.out.println(servletPath);
		
		if(servletPath.contains("/community/")) {
			Command_Community cc = new Command_Community();
			processor = cc.commandCommunity(req, resp, servletPath);
		}else if(servletPath.contains("/member/")) {
			Command_Member cm = new Command_Member();
			processor = cm.commandMember(req, resp, servletPath);
		}else if(servletPath.contains("/mypage/")) {
			Command_MyPage cmp = new Command_MyPage();
			processor = cmp.commandMyPage(req, resp, servletPath);
		}else {
			Command_Etc ce = new Command_Etc();
			processor = ce.commandEtc(req, resp, servletPath);
		}
		Command_Common ccm = new Command_Common();
		if(ccm.commandCommon(req, resp, servletPath)!=null) {
			processor = ccm.commandCommon(req, resp, servletPath);
		}
		
		view=processor.process(req,resp);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String servletPath = req.getServletPath();
		
		if(servletPath.contains("/member/")) {
			Command_Member cm = new Command_Member();
			processor = cm.commandMember(req, resp, servletPath);
		}else if(servletPath.contains("/mypage/")) {
			Command_MyPage cmp = new Command_MyPage();
			processor = cmp.commandMyPage(req, resp, servletPath);
		}
		Command_Common ccm = new Command_Common();
		if(ccm.commandCommon(req, resp, servletPath)!=null) {
			processor = ccm.commandCommon(req, resp, servletPath);
		}
		
		view=processor.process(req,resp);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
	}
	
}
