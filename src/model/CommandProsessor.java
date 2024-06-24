package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//모든 모델의 인터페이스
public interface CommandProsessor {
	public String process(HttpServletRequest req, HttpServletResponse resp);
}
