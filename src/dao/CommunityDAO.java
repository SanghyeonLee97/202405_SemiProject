package dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import DTO.CommunityFAQDTO;
import DTO.CommunityNoticeDTO;

public class CommunityDAO extends DAO{
	
	//notice 검색
	public ArrayList<CommunityNoticeDTO> getNoticeList(String select,String search) {
		ArrayList<CommunityNoticeDTO> res = new ArrayList<CommunityNoticeDTO>();
		Statement stmt = null;
		String query = "";
		openConnection();
		try {
			query = "select * from notice where "+select+" like '%"+search+"%';";
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				CommunityNoticeDTO ndto = new CommunityNoticeDTO();
				ndto.setNoticeNo((rs.getInt("notice_No")));
				ndto.setNoticeTitle(rs.getString("notice_title"));
				ndto.setNoticeContent(rs.getString("notice_content"));
				ndto.setNoticeViews(rs.getInt("notice_views"));
				ndto.setNoticeDate(rs.getTimestamp("notice_date"));
				res.add(ndto);
			}
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			closeConnection();
		}
		return res;
	}
	
	//notice 조회수 상승
	public void noticeIncreaseViews(String board,String no) {
		Statement stmt = null;
		String query = "";
		openConnection();
		try {
			query = "update notice set "+board+"_views="+board+"_views+1 where notice_No="+no+";";
			stmt = (Statement) conn.createStatement();
			stmt.executeUpdate(query);
			System.out.println(query);
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			closeConnection();
		}
	}

	//FAQ검색
	public ArrayList<CommunityFAQDTO> getFAQList(String select,String search) {
		ArrayList<CommunityFAQDTO> res = new ArrayList<CommunityFAQDTO>();
		Statement stmt = null;
		String query = "";
		openConnection();
		try {
			query = "select * from faq where "+select+" like '%"+search+"%';";
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				CommunityFAQDTO ndto = new CommunityFAQDTO();
				ndto.setFaqNo((rs.getInt("faq_no")));
				ndto.setFaqTitle(rs.getString("faq_title"));
				ndto.setFaqContent(rs.getString("faq_content"));
				ndto.setFaqIQCNo(rs.getInt("iqc_No"));
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
