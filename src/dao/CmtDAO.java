package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbmanager.DBManager;
import dto.CmtDTO;

public class CmtDAO {
	
	DBManager dbm = DBManager.getInstance();
	
public int cmtInsert(CmtDTO cvo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int rst = 0;
		
		String query = "insert into comments (num,bno,writer,content) values(cmt_seq.nextval,?,?,?)";
		
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, cvo.getBno());
			pstmt.setString(2, cvo.getWriter());
			pstmt.setString(3, cvo.getContent());
			rst = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbm.close(conn, pstmt);
		}
		return rst;
	}

public List<CmtDTO> selectCmt(int bno){
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String query = "select * from comments where bno = ? order by num desc";
	
	List<CmtDTO> clist = new ArrayList<CmtDTO>();
	
	try {
		conn = dbm.getConnection();
		pstmt = conn.prepareStatement(query);
		
		pstmt.setInt(1, bno);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			CmtDTO cvo = new CmtDTO();
			cvo.setBno(rs.getInt("bno"));
			cvo.setNum(rs.getInt("num"));
			cvo.setWriter(rs.getString("writer"));
			cvo.setWdate(rs.getString("wdate").substring(0,10));
			cvo.setContent(rs.getString("content"));
			
			clist.add(cvo);
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		dbm.close(conn, pstmt, rs);
	}
	return clist;
}

public int commentCount(int bno) {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql="SELECT COUNT(*) AS CNT FROM comments where bno ="+bno+""; //전부
	
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

public int cmtDelete(int num) {
	
	Connection conn = null;
	PreparedStatement pstmt = null;

	int cmt = 0;
	
	String query = "delete comments where num=?";
	
	try {
		conn = dbm.getConnection();
		pstmt = conn.prepareStatement(query);
		
		pstmt.setInt(1, num);
	
		cmt = pstmt.executeUpdate();
		
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		dbm.close(conn, pstmt);
	}
	return cmt;
}

public int cmtExistCheck(int num) {//update불러오기
    
    
    
    
    PreparedStatement ptt =null;
    Connection con=null;
    ResultSet rs = null;
    String sql="select*from comments where num="+num+"";
    
    
    int result=0;
    
    try {
    
       
       con=dbm.getConnection();
       ptt=con.prepareStatement(sql);
       rs=ptt.executeQuery();
       
       
       
       if(rs.next()) {
          result = 1;
       }
       
    
       
       
    }catch(Exception e) {
       e.printStackTrace();
    }finally {
       dbm.close(con, ptt, rs);
    }
    return result;
 } // 댓글불러오기

	public int cmtmodify(int num, String content) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String query="update comments set content=? where num=?";
		
		int result = 0;
		
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, content);
			pstmt.setInt(2, num);
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbm.close(conn, pstmt);
		}
		return result;
	}

}
