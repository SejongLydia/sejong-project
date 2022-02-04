package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbmanager.DBManager;
import dto.NewsDTO;
import dto.ReviewDTO;
import utility.Criteria;

public class ReviewDAO {
	
	DBManager dbm = DBManager.getInstance();
	
	//page
		 public List<ReviewDTO> getListWithPaging(Criteria cri, String query){
			 
			 Connection conn = null;
			 PreparedStatement pstmt = null;
			 ResultSet rs = null;
			 
			 String sql = null;
			 
			 List<ReviewDTO> list = new ArrayList<ReviewDTO>();
			 
			 if(query != "") {
				 sql = "select * from " +
					   "(select /*+ index_desc(review review_pk) */ rownum rn, bno, writer, regdate, content, imgurl, title, viewcount from review where ("+ query +") and rownum <= ? * ?) " +
					   " where rn > (?-1) * ?";
			 }else {
				 sql = "select * from " +
					   "(select /*+ index_desc(review review_pk) */ rownum rn, bno, writer, regdate, content, imgurl, title, viewcount from review where rownum <= ? * ?) " +
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
					 
					 ReviewDTO rdto = new ReviewDTO();
					 
					 rdto.setBno(rs.getInt("bno"));
					 rdto.setWriter(rs.getString("writer"));
					 rdto.setRegdate(rs.getString("regdate"));
					 rdto.setContent(rs.getString("content"));
					 rdto.setImgurl(rs.getString("imgurl"));
					 rdto.setTitle(rs.getString("title"));
					 rdto.setViewcount(rs.getInt("viewcount"));
					 
					 list.add(rdto);
					 
				 }
			 }catch(Exception e) {
				 e.printStackTrace();
			 }finally {
				dbm.close(conn, pstmt, rs);
			 }
			 return list;
		 }
		 
		 public int reviewCount(String query) {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "";
				
				if(query != "") {
					sql="select count(*) as cnt from review where "+query; //...where title like '%코딩%' 부분조건
				}else {
					sql="select count(*) as cnt from review"; //전부
				}
				System.out.println(sql);
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
		 
		 public void reviewInsert(ReviewDTO rdto) {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				
				String query = "insert into review (bno,content,writer,title,imgurl) values(review_seq.nextval,?,?,?,?)";
				
				try {
					conn = dbm.getConnection();
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, rdto.getContent());
					pstmt.setString(2, rdto.getWriter());
					pstmt.setString(3, rdto.getTitle());
					pstmt.setString(4, rdto.getImgurl());

				
					pstmt.executeUpdate();
					
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					dbm.close(conn, pstmt);
				}
			}
		 
		 public ReviewDTO reviewView(int bno) {
				
				reviewViewCount(bno);
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String query="select * from review where bno=?"; //최근에 등록된 글이 먼저 보이기 위해 desc
				
				ReviewDTO rdto = null;
				
				try {
					conn = dbm.getConnection();
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, bno);
					rs = pstmt.executeQuery();
					
					
					while(rs.next()) {
						
						rdto = new ReviewDTO();
						
						rdto.setBno(rs.getInt("bno"));
						rdto.setTitle(rs.getString("title"));
						rdto.setContent(rs.getString("content"));
						rdto.setWriter(rs.getString("writer"));
						rdto.setRegdate(rs.getString("regdate"));
						//dto.setRegdate(rs.getString("regdate").substring(0,10));
						rdto.setViewcount(rs.getInt("viewcount"));
						rdto.setImgurl(rs.getString("imgurl"));
					}
					
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					dbm.close(conn, pstmt, rs);
				}
				return rdto;	
				
			}
		 
		//조회수 증가하기
			
			public void reviewViewCount(int bno) {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				
				String query = "update review set viewcount = viewcount + 1 where bno = ?";
				
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
			
			//이전글
			
			public ReviewDTO prevByBno(int bno) {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String query="select bno,title from review where bno = (select max(bno) from review where bno < ?)"; //최근에 등록된 글이 먼저 보이기 위해 desc
				
				ReviewDTO rdto = null;
				
				try {
					conn = dbm.getConnection();
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, bno);
					rs = pstmt.executeQuery();
					
					
					while(rs.next()) {
						
						rdto = new ReviewDTO();
						
						rdto.setBno(rs.getInt("bno"));
						rdto.setTitle(rs.getString("title"));
						
					}
					
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					dbm.close(conn, pstmt, rs);
				}
				return rdto;	
			}
			//다음글
			public ReviewDTO nextByBno(int bno) {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String query="select bno,title from review where bno = (select min(bno) from review where bno > ?)"; 
				
				ReviewDTO rdto = null;
				
				try {
					conn = dbm.getConnection();
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, bno);
					rs = pstmt.executeQuery();
					
					
					while(rs.next()) {
						
						rdto = new ReviewDTO();
						
						rdto.setBno(rs.getInt("bno"));
						rdto.setTitle(rs.getString("title"));
						
					}
					
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					dbm.close(conn, pstmt, rs);
				}
				return rdto;	
			}
			
			public void reviewDelete(int bno) {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				
				String query = "delete review where bno=?";
				
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
			
			public ReviewDTO reviewUpdateSelect(int bno) {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String query = "select * from review where bno = ?";
				
				ReviewDTO rdto = null;
				
				try {
					conn = dbm.getConnection();
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, bno);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						rdto = new ReviewDTO();
						
						rdto.setBno(rs.getInt("bno"));
			            rdto.setTitle(rs.getString("title"));
			            rdto.setContent(rs.getString("content"));
			            rdto.setWriter(rs.getString("writer"));
			            rdto.setRegdate(rs.getString("regdate"));
			            rdto.setViewcount(rs.getInt("viewcount"));
			            rdto.setImgurl(rs.getString("imgurl"));
					}
					
					
					
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					dbm.close(conn, pstmt, rs);
				}
				return rdto;
			}

}
