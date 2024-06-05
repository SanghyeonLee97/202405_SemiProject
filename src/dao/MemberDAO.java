package dao;

import com.mysql.jdbc.Statement;

import DTO.CustomerDTO;

public class MemberDAO extends DAO{
	//조회수 상승
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
				System.out.println(query);
			}catch (Exception e) {
				// TODO: handle exception
			}finally {
				closeConnection();
			}
		}
}
