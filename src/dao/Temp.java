package dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;

import DTO.product.ProductDTO;

public class Temp extends DAO{
	//mypage 메인조회,주문배송 조회
		public ArrayList<ProductDTO> getMypageMain(int pc_parent_no) {
			ArrayList<ProductDTO> res = new ArrayList<ProductDTO>();
			openConnection();
			try {
				query = "select product_no,product_imgurl,product_name,product_price from product "+
						"inner join product_category on product.pc_no=product_category.pc_no "+
						"where pc_parent_no="+pc_parent_no;
				stmt = (Statement) conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next()) {
					ProductDTO pdto = new ProductDTO();
					pdto.setProduct_no(rs.getInt("product_no"));
					pdto.setProduct_imgurl(rs.getString("product_imgurl"));
					pdto.setProduct_name(rs.getString("product_name"));
					pdto.setProduct_price(rs.getInt("product_price"));
					res.add(pdto);
				}
			}catch (Exception e) {
				System.out.println("mypage 메인조회,주문배송 조회");
				e.printStackTrace();
			}finally {
				closeConnection();
			}
			return res;
		}

}
