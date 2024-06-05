package dao;

import com.mysql.jdbc.Statement;

import DTO.CustomerDTO;

public class MemberDAO extends DAO{
	//조회수 상승
		public void communityIncreaseViews(CustomerDTO cdto) {
			Statement stmt = null;
			String query = "";
			openConnection();
			try {
				query = "insert into customer(customer_id,customer_pw,customer_name,customer_tel,postal_code,address_road,address_detail,customer_email,reg_date)"
						+ values('test','1324','홍길동','010-1111-2222','02233','서울시 구로구','코오롱','test@test.com',now());";
				stmt = (Statement) conn.createStatement();
				stmt.executeUpdate(query);
				
			}catch (Exception e) {
				// TODO: handle exception
			}finally {
				closeConnection();
			}
		}
}
