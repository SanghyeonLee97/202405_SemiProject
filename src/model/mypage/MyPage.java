package model.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommunityDAO;
import dao.MyPageDAO;
import model.CommandProsessor;

//모든 마이페이지 모델의 부모가되는 클래스 
public abstract class MyPage implements CommandProsessor{
	MyPageDAO mdao = new MyPageDAO();
	CommunityDAO cdao = new CommunityDAO();
	HttpSession session;
	int userNo;
	abstract public String process(HttpServletRequest req, HttpServletResponse resp);
}
