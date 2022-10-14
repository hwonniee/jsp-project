package com.user.dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import com.user.vo.UserVO;

public class UserDAO {
	
	private static UserDAO instance = new UserDAO();
	
	public static UserDAO getInstance() {
		return instance;
	}
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String url = "jdbc:mysql://localhost:3306/homeDB";
			String user = "root";
			String password = "0000";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int login(String userId, String userPwd) {
		String SQL = "SELECT USERPWD FROM USER WHERE USERID = ?";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPwd)) 
					return 1; // 로그인 성공
				else 
					return 0;	//비밀번호 불일치
			}
			return -1; //아이디가 없음
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {
					conn.close();}
				} catch (Exception ex) {
					ex.printStackTrace();
					}
			try {
				if(rs != null)   {
					rs.close();}
				}   catch (Exception ex) {
					ex.printStackTrace();
					}
			try {
				if(pstmt != null){
					pstmt.close();}
				}catch (Exception ex) {
					ex.printStackTrace();
					}
}
		return -2; //데이터베이스 오류
	}

// 회원가입
	public int join(UserVO user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPwd());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserBirth());
			pstmt.setString(5, user.getUserTel());
			pstmt.setString(6, user.getUserAddr());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
}