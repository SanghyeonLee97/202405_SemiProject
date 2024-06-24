package model.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommunityDAO;
import model.CommandProsessor;

//모든 커뮤니티 모델의 부모가되는 클래스 
public abstract class Community implements CommandProsessor{
	CommunityDAO cdao = new CommunityDAO();
	HttpSession session;
	abstract public String process(HttpServletRequest req, HttpServletResponse resp);
}
