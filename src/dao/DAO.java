package dao;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import DTO.noticeDTO;

public class DAO {
	Connection conn = null;
	String url = "jdbc:mysql://localhost:3306/projectdb";
	String user = "root";
	String pass = "mysql";
	
	//연결 메소드
	private Connection openConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection) DriverManager.getConnection(url,user,pass);
		}catch (Exception e) {
			// TODO: handle exception
		}
		return conn;
	}
	//닫기 메소드
	private void closeConnection() {
		try {
			if(conn != null) {
				conn.close();
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	//전체notice 불러오기
	public ArrayList<noticeDTO> test() {
		ArrayList<noticeDTO> res = new ArrayList<noticeDTO>();
		Statement stmt;
		PreparedStatement pstm = null;
		String query = "select * from notice;";
		openConnection();
		try {
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				noticeDTO ndto = new noticeDTO();
				ndto.setNoticeNoticeNo(rs.getInt("noticeNo"));
				ndto.setNoticeCategoryNo(rs.getInt("categoryNo"));
				ndto.setNoticeTitle(rs.getString("title"));
				ndto.setNoticeContent(rs.getString("content"));
				ndto.setNoticeRegistrationDate(rs.getTimestamp("registrationDate"));
				ndto.setNoticeViews(rs.getInt("views"));
				res.add(ndto);
			}
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			closeConnection();
		}
		
		
		return res;
	}
}
