package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ZipcodeDAO {
	
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	public ZipcodeDAO() {
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
	
	//우편번호 테이블에서 시/도 가져오기
	public ArrayList<String> getSido(){
		
		ArrayList<String> sidoAddr = new ArrayList<String>();
		
		String sql = "SELECT sido FROM zipcode WHERE 1=1 GROUP BY sido ORDER BY sido ASC";
				
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				sidoAddr.add(rs.getString(1));
			}
		} catch (Exception e) {}
		return sidoAddr;
	}
	
	//우편번호 테이블에서 각 시/도에 해당하는 구/군 가져오기
	public ArrayList<String> getGugun(String sido){
		
		ArrayList<String> gugunAddr = new ArrayList<String>();
		
		String sql = "select distinct gugun from zipcode where sido = ? order by gugun desc";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, sido);
			rs = psmt.executeQuery();
			while(rs.next()) {
				gugunAddr.add(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return gugunAddr;
	}
	
	
	
}
