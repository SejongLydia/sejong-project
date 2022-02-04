package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbmanager.DBManager;
import dto.NewsDTO;


public class MainDAO {
	
	DBManager dbm = DBManager.getInstance();
	
	public List<NewsDTO> getNoticeSelect(){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query="select * from (select * from news order by bno desc) where rownum < 4";
		
		List<NewsDTO> list = new ArrayList<NewsDTO>();
		
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				
				NewsDTO dto = new NewsDTO();
				
				dto.setBno(rs.getInt("bno"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content")); //30글자만 보여주기
				dto.setName(rs.getString("name"));
				dto.setRegdate(rs.getString("regdate").substring(0,10)); //10글자만 보여주기
				//dto.setRegdate(rs.getString("regdate").substring(0,10));
				dto.setViewcount(rs.getInt("viewcount"));
				dto.setImgurl(rs.getString("imgurl"));
				
				list.add(dto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbm.close(conn, pstmt, rs);
		}
		return list;		
	}

}
