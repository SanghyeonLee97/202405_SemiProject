package dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import DTO.CommunityNoticeDTO;
import DTO.CommunitySearchDTO;

public class NoticeDAO extends DAO{
	
	//전체notice글 불러오기
		public ArrayList<CommunityNoticeDTO> getNoticeList(CommunitySearchDTO csdto) {
			ArrayList<CommunityNoticeDTO> res = new ArrayList<CommunityNoticeDTO>();
			Statement stmt = null;
			String query = "";
			openConnection();
			try {
				query = "select * from "+csdto.getCommunitySearchDTOBoard()+
						" where "+csdto.getCommunitySearchDTOSelect()+
						" like '%"+csdto.getCommunitySearchDTOSearch()+"%';";
				stmt = (Statement) conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next()) {
					CommunityNoticeDTO ndto = new CommunityNoticeDTO();
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
