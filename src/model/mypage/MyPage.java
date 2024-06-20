package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommunityDAO;
import dao.MyPageDAO;
import model.CommandProsessor;

public abstract class MyPage implements CommandProsessor{
	MyPageDAO mdao = new MyPageDAO();
	CommunityDAO cdao = new CommunityDAO();
	HttpSession session;
	int userNo;
	abstract public String process(HttpServletRequest req, HttpServletResponse resp);
}
