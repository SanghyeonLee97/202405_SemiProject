package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommunityDAO;

public class QNAAnswer implements CommandProsessor{
	
	int QNANO;
	String answer;
	
	public QNAAnswer(int QNANO,String answer) {
		this.QNANO=QNANO;
		this.answer=answer;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		CommunityDAO cdao = new CommunityDAO();
		cdao.qnaAnswerWrite(QNANO, answer);
		req.setAttribute("read", cdao.getQNAPost(Integer.toString(QNANO)));
		return "/community/community_QNA_read.jsp";
	}

}
