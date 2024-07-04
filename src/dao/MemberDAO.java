package dao;

import java.sql.ResultSet;

import com.mysql.jdbc.Statement;

import DTO.CustomerDTO;

public class MemberDAO extends DAO{
	//회원가입
	public void customerRegister(CustomerDTO cdto) {
		openConnection();
		try {
			query = "insert into customer(customer_id,customer_pw,customer_name,customer_tel,"+
					"postal_code,address_road,address_detail,customer_email,reg_date)"+
					" values('"+cdto.getCustomer_id()+"','"+cdto.getCustomer_pw()+"','"+cdto.getCustomer_name()+
					"','"+cdto.getCustomer_tel()+"','"+cdto.getPostal_code()+"','"+cdto.getAddress_road()+
					"','"+cdto.getAddress_detail()+"','"+cdto.getCustomer_email()+"',now());";
			stmt = (Statement) conn.createStatement();
			stmt.executeUpdate(query);
		}catch (Exception e) {
			System.out.println("회원가입 오류발생");
		}finally {
			closeConnection();
		}
	}
	
	//회원탈퇴
	public void quitCustomer(String id) {
		openConnection();
		try {
			query = "update customer set quit_date=now() where customer_id='"+id+"';";
			System.out.println(query);
			stmt = (Statement) conn.createStatement();
			stmt.executeUpdate(query);
		}catch (Exception e) {
			System.out.println("회원탈퇴 오류발생");
		}finally {
			closeConnection();
		}
	}
	
	//존재하는 회원인지 체크
	public boolean customerIdChk(String id) {
		openConnection();
		try {
			query = "select customer_id from customer where customer_id='"+id+"';";
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next()) {
				return true;
			}else {
				return false;
			}
	    }catch (Exception e) {
			System.out.println("존재하는 회원인지 체크 오류발생");
		}finally {
			closeConnection();
		}
		return false;
	}
	
	//탈퇴회원 체크
	public boolean customerQuitChk(String id) {
		openConnection();
		try {
			query = "select * from customer where customer_id='"+id+"' && quit_date is not null;";
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next()) {
				return true;
			}else {
				return false;
			}
		}catch (Exception e) {
			   System.out.println("탈퇴회원체크 오류발생");
		}finally {
			closeConnection();
		}
		return false;
	}
	
	//로그인체크
	public boolean customerLoginChk(String id,String pw) {
		openConnection();
		try {
			query = "select * from customer where customer_id='"+id+"' && customer_pw='"+pw+"';";
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next()) {
				return true;
			}else {
				return false;
			}
		}catch (Exception e) {
			System.out.println("로그인체크 오류발생");
		}finally {
			closeConnection();
		}
		return false;
	}
	
	//어드민체크
	public boolean adminChk(String id) {
		openConnection();
		try {
			query = "select * from customer where customer_id='"+id+"' && admin=1;";
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next()) {
				return true;
			}else {
				return false;
			}
		}catch (Exception e) {
			System.out.println("어드민체크 오류발생");
		}finally {
			closeConnection();
		}
		return false;
	}
	//비밀번호 찾기
	public String findPW(String id) {
		String password = null;
		openConnection();
		try {
			query = "select customer_pw from customer where customer_id='"+id+"';";
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next()) {
				password=rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return password;
	}
	//아이디 찾기
	public String findId(String email) {
		String id = null;
		openConnection();
		try {
			query = "select customer_id from customer where customer_email = '"+email+"';";
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next()) {
				id=rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return id;
	}
	
	
	
	
}
