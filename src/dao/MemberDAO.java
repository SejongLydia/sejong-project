package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbmanager.DBManager;
import dto.JoinMemberDTO;

public class MemberDAO {
	
	DBManager dbm = DBManager.getInstance();
	
public int memberIdCheck(String id) { //id 중복체크
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query="select id from joinmember where id = ?"; //최근에 등록된 글이 먼저 보이기 위해 desc
		
		int result = 0;
		
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) { //sql문이 트루일경우
				
				result = 1;
			}else {
				result = -1;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbm.close(conn, pstmt, rs);
		}
		return result;		
	}

public void memberJoin(JoinMemberDTO dto) {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "insert into joinmember (bno, id, pw, name, birth, gender, email, phone) values (joinmember_seq.nextval, ?,?,?,?,?,?,?)";
	
	try {
		conn = dbm.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getPw());
		pstmt.setString(3, dto.getName());
		pstmt.setString(4, dto.getBirth());
		pstmt.setString(5, dto.getGender());
		pstmt.setString(6, dto.getEmail());
		pstmt.setString(7, dto.getPhone());
		pstmt.executeUpdate();
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		dbm.close(conn, pstmt);
	}
}

public int memberIdPwCheck(String id, String pw) {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select pw from joinmember where id=?";
	
	int result = 0;
	
	try {
		conn = dbm.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			if(rs.getString("pw") != null && rs.getString("pw").equals(pw)) {
				result = 1;
			}else {
				result = 0;
			}
		}else {
			result = -1;
		}
			
		
	}catch(Exception e) {
		
	}finally {
		dbm.close(conn, pstmt, rs);
	}
	return result;
}

	public JoinMemberDTO memberOneSelect(String id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from joinmember where id = '"+id+"'";
		
		JoinMemberDTO mdto = null;
		
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mdto = new JoinMemberDTO();
				mdto.setBno(rs.getInt("bno"));
				mdto.setId(rs.getString("id"));
				mdto.setName(rs.getString("name"));
				mdto.setBirth(rs.getString("birth")); //yyyy/MM/dd
				mdto.setGender(rs.getString("gender"));
				mdto.setEmail(rs.getString("email"));
				mdto.setPhone(rs.getString("phone"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbm.close(conn, pstmt, rs);
		}
		return mdto;
		
	}
	
	public void setMemberUpdate(JoinMemberDTO dto) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = null;
		
		try {
			conn = dbm.getConnection();
			
			if(dto.getPw() != "") {
				sql = "update joinmember set pw=?, name=?, birth=?, gender=?, email=?, phone=? where id='"+dto.getId()+"'";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getPw());
				pstmt.setString(2, dto.getName());
				pstmt.setString(3, dto.getBirth());
				pstmt.setString(4, dto.getGender());
				pstmt.setString(5, dto.getEmail());
				pstmt.setString(6, dto.getPhone());
			}else {
				sql = "update joinmember set name=?, birth=?, gender=?, email=?, phone=? where id='"+dto.getId()+"'";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getName());
				pstmt.setString(2, dto.getBirth());
				pstmt.setString(3, dto.getGender());
				pstmt.setString(4, dto.getEmail());
				pstmt.setString(5, dto.getPhone());
			}
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbm.close(conn, pstmt);
		}
	}

}
