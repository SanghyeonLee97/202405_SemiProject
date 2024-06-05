package model;


import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Register implements CommandProsessor{
	String customer_id;
	String customer_pw;
	String customer_name;
	String customer_tel;
	int postal_code;
	String address_road;
	String address_detail;
	String customer_email;
	Date reg_date;
	Date quit_date;
	
	public Register() {
		
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		return "/member/test.jsp";
	}

}
