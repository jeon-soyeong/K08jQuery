package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OracleDAO {

	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	public OracleDAO() {
		try {
			Context initCtx = new InitialContext();
			DataSource source = (DataSource)initCtx.lookup("java:comp/env/jdbc/myoracle");
			con = source.getConnection();
			System.out.println("DBCP 연결성공");
		}
		catch (Exception e) {
			System.out.println("DBCP 연결실패");
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
		} catch (Exception e) {
			System.out.println("자원반납시 예외발생");
			e.printStackTrace();
		}
	}
	
	public boolean isMember(String id, String pass) {
			
			String sql = "SELECT COUNT(*) FROM member "
					+" WHERE id=? AND pass=?";
			int isMember = 0;
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, pass);
				rs = psmt.executeQuery();
				rs.next();
				
				isMember = rs.getInt(1);
				System.out.println("affected:" + isMember);
				if(isMember==0) 
					return false;
				}
			catch (Exception e) {
				e.printStackTrace();
				return false;
				}
			return true;
		}
	
}
