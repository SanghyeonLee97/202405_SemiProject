package model.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommunityDAO;
import dao.MemberDAO;
import model.CommandProsessor;

public abstract class Member implements CommandProsessor{
	MemberDAO mdao = new MemberDAO();
	CommunityDAO cdao = new CommunityDAO();
	HttpSession session;
	abstract public String process(HttpServletRequest req, HttpServletResponse resp);
}
