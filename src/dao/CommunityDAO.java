package dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import DTO.CommunityFAQDTO;
import DTO.CommunityNoticeDTO;
import DTO.CommunityQNADTO;

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
			System.out.println("notice 검색 오류발생");
		}finally {
			closeConnection();
		}
		return res;
	}
	
	//notice 특정글 검색
	public CommunityNoticeDTO getNoticePost(String no) {
		CommunityNoticeDTO res = new CommunityNoticeDTO();
		Statement stmt = null;
		String query = "";
		openConnection();
		try {
			query = "select * from notice where notice_No="+no+";";
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				res.setNoticeTitle(rs.getString("notice_title"));
				res.setNoticeContent(rs.getString("notice_content"));
			}
		}catch (Exception e) {
			System.out.println("notice 특정글 검색 오류발생");
		}finally {
			closeConnection();
		}
		return res;
	}
	
	//조회수 상승
	public void communityIncreaseViews(String board,String no) {
		Statement stmt = null;
		String query = "";
		openConnection();
		try {
			query = "update notice set "+board+"_views="+board+"_views+1 where notice_No="+no+";";
			stmt = (Statement) conn.createStatement();
			stmt.executeUpdate(query);
			
		}catch (Exception e) {
			System.out.println("조회수 상승 오류발생");
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
			System.out.println("FAQ검색 오류발생");
		}finally {
			closeConnection();
		}
		return res;
	}
	
	//FAQ 특정글 검색
	public CommunityFAQDTO getFAQPost(String no) {
		CommunityFAQDTO res = new CommunityFAQDTO();
		Statement stmt = null;
		String query = "";
		openConnection();
		try {
			query = "select * from faq where faq_no="+no+";";
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
				
			while(rs.next()) {
				res.setFaqTitle(rs.getString("faq_title"));
				res.setFaqContent(rs.getString("faq_content"));
			}
		}catch (Exception e) {
			System.out.println("FAQ 특정글 검색 오류발생");
		}finally {
			closeConnection();
		}
		return res;
	}
	
	//QNA 검색
	public ArrayList<CommunityQNADTO> getQNAList(String select,String search) {
		ArrayList<CommunityQNADTO> res = new ArrayList<CommunityQNADTO>();
		Statement stmt = null;
		String query = "";
		openConnection();
		try {
			query = "select qna.qna_no,qna.qna_title,qna.qna_date,qna.qna_answer,customer.customer_id,qna.iqc_no from qna inner join customer on qna.customer_no=customer.customer_no where "+select+" like '%"+search+"%';";
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				CommunityQNADTO cqdto = new CommunityQNADTO();
				cqdto.setQna_no(rs.getInt("qna_no"));
				cqdto.setQna_title(rs.getString("qna_title"));
				cqdto.setQna_date(rs.getTimestamp("qna_date"));
				cqdto.setQna_answer(rs.getString("qna_answer"));
				cqdto.setCustomer_id(rs.getString("customer_id"));
				cqdto.setIqc_no(rs.getInt("iqc_no"));
				res.add(cqdto);
			}
		}catch (Exception e) {
			System.out.println("QNA 검색 오류발생");
		}finally {
			closeConnection();
		}
		return res;
	}
}
