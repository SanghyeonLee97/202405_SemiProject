package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateInfo implements CommandProsessor{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		return "/mypage/mypage_edit_info.jsp";
	}

}
