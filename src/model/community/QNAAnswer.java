package model.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QNAAnswer extends Community{
	
	int QNANO;
	String answer;
	
	public QNAAnswer(int QNANO,String answer) {
		this.QNANO=QNANO;
		this.answer=answer;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		cdao.qnaAnswerWrite(QNANO, answer);
		req.setAttribute("read", cdao.getQNAPost(Integer.toString(QNANO)));
		return "/community/community_QNA_read.jsp";
	}

}
