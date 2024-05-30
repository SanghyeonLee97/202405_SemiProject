package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandProsessor {
	public String process(HttpServletRequest req, HttpServletResponse resp);
}
