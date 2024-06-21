package model.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommunityDAO;
import dao.MemberDAO;
import model.CommandProsessor;

//모든 멤버 모델의 부모가되는 클래스 
public abstract class Member implements CommandProsessor{
	MemberDAO mdao = new MemberDAO();
	CommunityDAO cdao = new CommunityDAO();
	HttpSession session;
	abstract public String process(HttpServletRequest req, HttpServletResponse resp);
}
