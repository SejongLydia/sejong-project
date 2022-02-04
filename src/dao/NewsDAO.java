package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbmanager.DBManager;
import dto.NewsDTO;
import utility.Criteria;


public class NewsDAO {
	
	DBManager dbm = DBManager.getInstance();
	
	
	public void newsInsert(NewsDTO ndto) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String query = "insert into news (bno,name,title,content, imgurl) values(news_seq.nextval,?,?,?,?)";
		
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,ndto.getName());
			pstmt.setString(2, ndto.getTitle());
			pstmt.setString(3, ndto.getContent());
		
			pstmt.setString(4, ndto.getImgurl());
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbm.close(conn, pstmt);
		}
	}
	
	public List<NewsDTO> newsSelect(){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query="select * from news order by bno desc";
		
		List<NewsDTO> list = new ArrayList<NewsDTO>();
		
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				NewsDTO dto = new NewsDTO();
				
				dto.setBno(rs.getInt("bno"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setName(rs.getString("name"));
				dto.setRegdate(rs.getString("regdate"));
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
	
	public int newsCount(String query) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		if(query != "") {
			sql="select count(*) as cnt from news where "+query; //...where title like '%코딩%' 부분조건
		}else {
			sql="select count(*) as cnt from news"; //전부
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
	
	//조회수 증가하기
	
		public void newsViewCount(int bno) {
			
			
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			String query = "update news set viewcount = viewcount + 1 where bno = ?";
			
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
		
		//view
		
		public NewsDTO newsView(int bno) {
			
			newsViewCount(bno);
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String query="select * from news where bno=?";
			
			NewsDTO ndto = null;
			
			try {
				conn = dbm.getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, bno);
				rs = pstmt.executeQuery();
				
				
				while(rs.next()) {
					
					ndto = new NewsDTO();
					
					ndto.setBno(rs.getInt("bno"));
					ndto.setTitle(rs.getString("title"));
					ndto.setContent(rs.getString("content"));
					ndto.setViewcount(rs.getInt("viewcount"));
					ndto.setImgurl(rs.getString("imgurl"));
					ndto.setRegdate(rs.getNString("regdate"));
					ndto.setName(rs.getString("name"));
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				dbm.close(conn, pstmt, rs);
			}
			return ndto;	
			
		}
		
		public void newsDelete(int bno) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			String query="delete from news where bno = ?"; 
			
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
	
		public NewsDTO newsModify(int bno) {
		       //update notice set title=?, content=? where bno=?
		         
		         Connection conn = null;
		         PreparedStatement pstmt = null;
		         ResultSet rs = null;

		         String query="select * from news where bno = ?"; //최근에 등록된 글이 먼저 보이기 위해 desc

		         NewsDTO ndto = null;

		         try {

		            conn = dbm.getConnection();
		            pstmt = conn.prepareStatement(query);
		            pstmt.setInt(1,bno);
		            rs = pstmt.executeQuery();

		            while(rs.next()) {
		               ndto = new NewsDTO();

		               ndto.setBno(rs.getInt("bno"));
		               ndto.setTitle(rs.getString("title"));
		               ndto.setContent(rs.getString("content"));
		               ndto.setName(rs.getString("name"));
		               ndto.setRegdate(rs.getString("regdate"));
		               ndto.setViewcount(rs.getInt("viewcount"));
		               ndto.setImgurl(rs.getString("imgurl"));

		   }

		         }catch(Exception e) {

		            e.printStackTrace();

		         }finally {

		            dbm.close(conn, pstmt, rs);

		         }
		         return ndto;
		    }
		 
		 public void newsModify(NewsDTO dto) { //오버
		       //update notice set title=?, content=? where bno=?
		         
		         Connection conn = null;
		         PreparedStatement pstmt = null;

		         String query="update news set title=?, content=?, imgurl=? where bno=?";

		         try {

		            conn = dbm.getConnection();
		            pstmt = conn.prepareStatement(query);
		            pstmt.setString(1, dto.getTitle());
		            pstmt.setString(2, dto.getContent());
		            pstmt.setString(3, dto.getImgurl());
		            pstmt.setInt(4, dto.getBno());
		           
		            
		           pstmt.executeUpdate();


		         }catch(Exception e) {

		            e.printStackTrace();

		         }finally {

		            dbm.close(conn, pstmt);

		         }
		    }
		 
		 //page
		 public List<NewsDTO> getListWithPaging(Criteria cri, String query){
			 
			 Connection conn = null;
			 PreparedStatement pstmt = null;
			 ResultSet rs = null;
			 
			 String sql = null;
			 
			 List<NewsDTO> list = new ArrayList<NewsDTO>();
			 
			 if(query != "") {
				 sql = "select * from " +
					   "(select /*+ index_desc(news news_pk) */ rownum rn, bno, title, content, regdate, viewcount, imgurl, name from news where ("+ query +") and rownum <= ? * ?) " +
					   " where rn > (?-1) * ?";
			 }else {
				 sql = "select * from " +
					   "(select /*+ index_desc(news news_pk) */ rownum rn, bno, title, content, regdate, viewcount, imgurl, name from news where rownum <= ? * ?) " +
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
					 
					 NewsDTO dto = new NewsDTO();
					 
					 dto.setBno(rs.getInt("bno"));
					 dto.setTitle(rs.getString("title"));
					 dto.setContent(rs.getString("content"));
					 dto.setRegdate(rs.getString("regdate"));
					 dto.setViewcount(rs.getInt("viewcount"));
					 dto.setImgurl(rs.getString("imgurl"));
					 dto.setName(rs.getString("name"));
					 list.add(dto);
					 
				 }
			 }catch(Exception e) {
				 e.printStackTrace();
			 }finally {
				dbm.close(conn, pstmt, rs);
			 }
			 return list;
		 }
		
}//class
