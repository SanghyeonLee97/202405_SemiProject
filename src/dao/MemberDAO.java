package dao;

import java.sql.ResultSet;

import com.mysql.jdbc.Statement;

import DTO.CustomerDTO;

public class MemberDAO extends DAO{
	//회원가입
	public void customerRegister(CustomerDTO cdto) {
		Statement stmt = null;
		String query = "";
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
			// TODO: handle exception
		}finally {
			closeConnection();
		}
	}
	
	public boolean customerIdChk(String id) {
		Statement stmt = null;
		String query = "";
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
			// TODO: handle exception
		}finally {
			closeConnection();
		}
		return false;
	}
}
