package dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;

import DTO.community.CommunityDTO;
import DTO.community.CommunityQNADTO;

public class CommunityDAO extends DAO{
	
	//community 등록
	public void noticeWrite(CommunityDTO cndto) {
		openConnection();
		try {
			query = "insert into notice(notice_title,notice_content) "+
					"values('"+cndto.getCommunityTitle()+"','"+cndto.getCommunityContent()+"');";
			stmt = (Statement) conn.createStatement();
			stmt.executeUpdate(query);
		}catch (Exception e) {
			System.out.println("notice 등록 오류발생");
		}finally {
			closeConnection();
		}
	}
	
	//community 등록
	public void faqWrite(CommunityDTO cndto) {
		openConnection();
		try {
			query = "insert into faq(faq_title,faq_content,iqc_no) "+
					"values('"+cndto.getCommunityTitle()+"','"+cndto.getCommunityContent()+"','"+cndto.getIQCNo()+"');";
			stmt = (Statement) conn.createStatement();
			stmt.executeUpdate(query);
		}catch (Exception e) {
			System.out.println("notice 등록 오류발생");
		}finally {
			closeConnection();
		}
	}
	
	//community 검색
	public ArrayList<CommunityDTO> getCommunityList(String board,String select,String search) {
		ArrayList<CommunityDTO> res = new ArrayList<CommunityDTO>();
		openConnection();
		try {
			query = "select * from "+board+" where "+select+" like '%"+search+"%';";
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			System.out.println(query);
			while(rs.next()) {
				CommunityDTO ndto = new CommunityDTO();
				ndto.setCommunityNo(rs.getInt(board+"_no"));
				ndto.setCommunityTitle(rs.getString(board+"_title"));
				ndto.setCommunityContent(rs.getString(board+"_content"));
				if(board.equals("notice")) {
					ndto.setCommunityViews(rs.getInt(board+"_views"));
					ndto.setCommunityDate(rs.getTimestamp(board+"_date"));
				}
				if(board.equals("faq")) {
					ndto.setIQCNo(rs.getInt("iqc_No"));
				}
				res.add(ndto);
			}
		}catch (Exception e) {
			System.out.println("community 검색 오류발생");
		}finally {
			closeConnection();
		}
		return res;
	}
	
	//community 특정글 검색
	public CommunityDTO getCommunityPost(String board,String no) {
		CommunityDTO res = new CommunityDTO();
		openConnection();
		try {
			query = "select * from "+board+" where "+board+"_no="+no+";";
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				res.setCommunityNo(rs.getInt(board+"_no"));
				res.setCommunityTitle(rs.getString(board+"_title"));
				res.setCommunityContent(rs.getString(board+"_content"));
			}
		}catch (Exception e) {
			System.out.println("community 특정글 검색");
		}finally {
			closeConnection();
		}
		return res;
	}
	
	//글 삭제
	public void communityDelete(String board,int QNANo) {
		openConnection();
		try {
			query = "delete from "+board+" where "+board+"_no="+QNANo+";";
			System.out.println(query);
			stmt = (Statement) conn.createStatement();
			stmt.executeUpdate(query);
		}catch (Exception e) {
			System.out.println("글 삭제 오류발생");
			e.printStackTrace();
		}finally {
			closeConnection();
		}
	}
	
	//조회수 상승
	public void communityIncreaseViews(String no) {
		openConnection();
		try {
			query = "update notice set notice_views=notice_views+1 where notice_no="+no+";";
			stmt = (Statement) conn.createStatement();
			stmt.executeUpdate(query);
			
		}catch (Exception e) {
			System.out.println("조회수 상승 오류발생");
		}finally {
			closeConnection();
		}
	}
	
	//QNA 검색
	public ArrayList<CommunityQNADTO> getQNAList(String select,String search) {
		ArrayList<CommunityQNADTO> res = new ArrayList<CommunityQNADTO>();
		openConnection();
		try {
			query = "select qna.qna_no,qna.qna_title,qna.qna_date,qna.qna_answer,customer.customer_id,qna.iqc_no "+
					"from qna inner join customer on qna.customer_no=customer.customer_no "+
					"where "+select+" like '%"+search+"%';";
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
	
	//QNA 특정글 검색
	public CommunityQNADTO getQNAPost(String no) {
		CommunityQNADTO res = new CommunityQNADTO();
		openConnection();
		try {
			query = "select qna.qna_no,qna.qna_title,qna.qna_content,qna.qna_date,qna.qna_answer,customer.customer_id "+
					"from qna inner join customer on qna.customer_no=customer.customer_no "+
					"where qna_no="+no+";";
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
					
			while(rs.next()) {
				res.setQna_no(rs.getInt("qna_no"));
				res.setQna_title(rs.getString("qna_title"));
				res.setQna_content(rs.getString("qna_content"));
				res.setQna_date(rs.getTimestamp("qna_date"));
				res.setCustomer_id(rs.getString("customer_id"));
				res.setQna_answer(rs.getString("qna_answer"));
			}
		}catch (Exception e) {
			System.out.println("QNA 특정글 검색 오류발생");
		}finally {
			closeConnection();
		}
		return res;
	}
	
	//QNA 답변 등록
	public void qnaAnswerWrite(int no,String answer) {
		openConnection();
		try {
			query = "update qna set qna_answer='"+answer+"' where qna_no="+no+";";
			System.out.println(query);
			stmt = (Statement) conn.createStatement();
			stmt.executeUpdate(query);
		}catch (Exception e) {
			System.out.println("QNA 답변 등록 오류발생");
		}finally {
			closeConnection();
		}
	}
	
	//고객id>no변환
	public int getCustomerNo(String customerId) {
		int customerNo=0;
		openConnection();
		try {
			query = "select customer_no from customer where customer_id='"+customerId+"';";
			stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				customerNo=rs.getInt("customer_no");
			}
		}catch (Exception e) {
			System.out.println("고객id>no변환 오류발생");
		}finally {
			closeConnection();
		}
		return customerNo;
	}
	
	//QNA글 등록
	public void QNAWrite(CommunityQNADTO cqdto) {
		openConnection();
		try {
			query = "insert into qna(qna_title,qna_content,qna_fileurl,qna_imgurl,qna_date,customer_no,iqc_no) "+
					"values('"+cqdto.getQna_title()+"','"+cqdto.getQna_content()+
					"','','',now(),"+cqdto.getCustomer_no()+","+cqdto.getIqc_no()+");";
			stmt = (Statement) conn.createStatement();
			stmt.executeUpdate(query);
		}catch (Exception e) {
			System.out.println("QNA글 등록 오류발생");
			e.printStackTrace();
		}finally {
			closeConnection();
		}
	}
	
	
	
	
}
