package dao;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import DTO.NoticeDTO;

public class DAO {
	Connection conn = null;
	String url = "jdbc:mysql://localhost:3306/projectdb";
	String user = "root";
	String pass = "mysql";
	
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
