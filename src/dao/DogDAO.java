package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import dbmanager.DBManager;
import dto.DogDTO;
import dto.NewsDTO;
import utility.Criteria;

public class DogDAO {
	
	DBManager dbm = DBManager.getInstance();
	
	public void dogInsert(DogDTO ddto) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String query = "insert into dog (bno,name,kind,age,gender,enterdate,imgurl) values(dog_seq.nextval,?,?,?,?,?,?)";
		
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1,ddto.getName());
			pstmt.setString(2,ddto.getKind());
			pstmt.setInt(3,ddto.getAge());
			pstmt.setString(4,ddto.getGender());
			pstmt.setString(5, ddto.getEnterdate());
			pstmt.setString(6, ddto.getImgurl());
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbm.close(conn, pstmt);
		}
	}
	
	public void dogDelete(int bno) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String query="delete from dog where bno = ?"; 
		
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbm.close(conn, pstmt);
		}
	}
	
	//page
	 public List<DogDTO> getListWithPaging(Criteria cri, String word){
		 
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 
		 String sql = null;
		 
		 List<DogDTO> list = new ArrayList<DogDTO>();
		 
		 if(word != "") {
			 sql = "select * from " +
				   "(select /*+ index_desc(dog dog_pk) */ rownum rn, bno, name, kind, age, gender, enterdate, imgurl from dog where ("+ word +") and rownum <= ? * ?) " +
				   " where rn > (?-1) * ?";
		 }else {
			 sql = "select * from " +
				   "(select /*+ index_desc(dog dog_pk) */ rownum rn, bno, name, kind, age, gender, enterdate, imgurl from dog where rownum <= ? * ?) " +
				   " where rn > (?-1) * ?";
		 }
		 
		 try {
			 conn = dbm.getConnection();
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1,  cri.getPageNum());
			 pstmt.setInt(2, cri.getAmount());
			 pstmt.setInt(3, cri.getPageNum());
			 pstmt.setInt(4, cri.getAmount());
			 
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
				 
				 DogDTO ddto = new DogDTO();
				 
				 ddto.setBno(rs.getInt("bno"));
				 ddto.setName(rs.getString("name"));
				 ddto.setKind(rs.getString("kind"));
				 ddto.setAge(rs.getInt("age"));
				 ddto.setGender(rs.getString("gender"));
				 ddto.setEnterdate(rs.getString("enterdate"));
				 ddto.setImgurl(rs.getString("imgurl"));
				 list.add(ddto);
				 
			 }
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			dbm.close(conn, pstmt, rs);
		 }
		 return list;
	 }
	 
	 public int dogCount(String word) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String query="select count(*) as cnt from dog"; //최근에 등록된 글이 먼저 보이기 위해 desc
			
			int count = 0; //총 레코드 개수가 저장될 변수
			
			try {
				conn = dbm.getConnection();
				pstmt = conn.prepareStatement(query);
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
	 
	 public DogDTO getDogImage(String bno) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select * from dog where bno=?";
			
			DogDTO ddto = null;
			
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bno);
				rs = pstmt.executeQuery();
			
				while(rs.next()) {
					ddto = new DogDTO();
					ddto.setBno(rs.getInt("bno"));
					ddto.setName(rs.getString("name"));
					ddto.setKind(rs.getString("kind"));
					ddto.setAge(rs.getInt("age"));
					ddto.setGender(rs.getString("gender"));
					ddto.setImgurl(rs.getString("imgurl"));
					
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				dbm.close(conn, pstmt, rs);
			}
			return ddto;
		}

}
