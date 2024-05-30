package dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import DTO.NoticeDTO;

public class NoticeDAO extends DAO{
	
	//전체notice글 불러오기
		public ArrayList<NoticeDTO> getNoticeList(String input) {
			ArrayList<NoticeDTO> res = new ArrayList<NoticeDTO>();
			PreparedStatement pstm = null;
			String query = "";
			openConnection();
			try {
				query = "select * from notice where title like ?;";
				pstm = (PreparedStatement)conn.prepareStatement(query);
					pstm.setString(1, "%"+input+"%");
				ResultSet rs = pstm.executeQuery();
				while(rs.next()) {
					NoticeDTO ndto = new NoticeDTO();
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
		
		//notice 제목 검색
}
