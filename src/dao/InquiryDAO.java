package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbmanager.DBManager;
import dto.InquiryDTO;



public class InquiryDAO {
	
		DBManager dbm = DBManager.getInstance();
	
	public List<InquiryDTO> inquirySelect(String query) { //오버로딩
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		if(query != "") {
			sql="select * from inquiry where "+query+" order by bno desc"; //..where title like '%코딩%' order by...
		}else {
			sql="select * from inquiry order by bno desc"; //최근에 등록된 글이 먼저 보이기 위해 desc
		}
		
		List<InquiryDTO> list = new ArrayList<InquiryDTO>();
		
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				
				InquiryDTO dto = new InquiryDTO();
				
				dto.setBno(rs.getInt("bno"));
				dto.setTitle(rs.getString("title"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setViewcount(rs.getInt("viewcount"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setImgurl(rs.getString("imgurl"));
				dto.setCategory(rs.getString("category"));
				
				//dto.setRegdate(rs.getString("regdate").substring(0,10));
				
				list.add(dto);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbm.close(conn, pstmt, rs);
		}
		return list;		
	}
		
	public int inquiryCount(String query) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "";
			
			if(query != "") {
				sql="select count(*) as cnt from inquiry where "+query; //...where title like '%코딩%' 부분조건
			}else {
				sql="select count(*) as cnt from inquiry"; //전부
			}
			
			
			
			int count = 0; //총 레코드 개수가 저장될 변수
			
			try {
				conn = dbm.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery(); //실행
				
				
				while(rs.next()) {
					
					count = rs.getInt("cnt");
					
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				dbm.close(conn, pstmt, rs);
			}
			return count;	
		}
	
	public void inquiryInsert(InquiryDTO idto) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String query = "insert into inquiry (bno, name, email, category, title, content, imgurl) values (inquiry_seq.nextval,?,?,?,?,?,?)";
		
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, idto.getName());
			pstmt.setString(2, idto.getEmail());
			pstmt.setString(3, idto.getCategory());
			pstmt.setString(4, idto.getTitle());
			pstmt.setString(5, idto.getContent());
			pstmt.setString(6, idto.getImgurl());
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbm.close(conn, pstmt);
		}
	}

}
