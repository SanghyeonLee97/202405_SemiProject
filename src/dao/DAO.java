package dao;

import java.sql.DriverManager;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class DAO {
	protected Connection conn = null;
	private String url = "jdbc:mysql://localhost:3306/projectdb";
	private String user = "root";
	private String pass = "mysql";
	protected Statement stmt = null;
	protected String query = "";
	
	//연결 메소드
	protected Connection openConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection) DriverManager.getConnection(url,user,pass);
		}catch (Exception e) {
			// TODO: handle exception
		}
		return conn;
	}
	//닫기 메소드
	protected void closeConnection() {
		try {
			if(conn != null) {
				conn.close();
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
}
