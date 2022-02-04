package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbmanager.DBManager;
import dto.EnterDTO;

public class EnterDAO {
	
	DBManager dbm = DBManager.getInstance();
	
	public void enterInsert(EnterDTO edto) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String query = "insert into enter (bno, name, title, content, imgurl) values (enter_seq.nextval, ?,?,?,?)";
		
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, edto.getName());
			pstmt.setString(2, edto.getTitle());
			pstmt.setString(3, edto.getContent());
			pstmt.setString(4, edto.getImgurl());
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbm.close(conn, pstmt);
		}
	}
	
	public List<EnterDTO> enterSelect(){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "select * from enter order by bno desc";
		
		List<EnterDTO> list = new ArrayList<EnterDTO>();
		
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				EnterDTO edto = new EnterDTO();
				
				edto.setBno(rs.getInt("bno"));
				edto.setName(rs.getString("name"));
				edto.setTitle(rs.getString("title"));
				edto.setContent(rs.getString("content"));
				edto.setImgurl(rs.getString("imgurl"));
				edto.setViewcount(rs.getInt("viewcount"));
				edto.setRegdate(rs.getString("regdate"));
				
				list.add(edto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbm.close(conn, pstmt, rs);
		}
		return list;
	}

}
