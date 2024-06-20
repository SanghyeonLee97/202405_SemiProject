package model.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommunityDAO;
import model.CommandProsessor;

public abstract class Community implements CommandProsessor{
	CommunityDAO cdao = new CommunityDAO();
	HttpSession session;
	abstract public String process(HttpServletRequest req, HttpServletResponse resp);
}
