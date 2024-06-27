package model.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QNAAnswer extends Community{
	
	int QNANO;
	String answer;
	
	//답변을 작성할 게시글 번호와 답변내용 생성자
	public QNAAnswer(int QNANO,String answer) {
		this.QNANO=QNANO;
		this.answer=answer;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		//답변 작성
		cdao.qnaAnswerWrite(QNANO, answer);
		//이 메소드를 호출한 게시글 정보를 불러와 read 객체에 저장
		req.setAttribute("read", cdao.getCommunityPost("qna",Integer.toString(QNANO)));
		return "/community/community_QNA_read.jsp";
	}

}
