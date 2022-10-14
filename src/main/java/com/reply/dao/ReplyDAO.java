package com.reply.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.board.vo.BoardVO;
import com.reply.vo.ReplyVO;
import com.reply.vo.ReplyVO;

import util.DBManager;

public class ReplyDAO {

	private static ReplyDAO instance = new ReplyDAO();
	
	public static ReplyDAO getInstance() {
		return instance;
	}
	
	// 댓글 전체 리스트 조회
	public List<ReplyVO> selectAllReplys(String num) {
		String sql = "SELECT * FROM REPLY WHERE NUM = ? ORDER BY rNum DESC ";
		
		List<ReplyVO> list = new ArrayList<ReplyVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReplyVO bVo = new ReplyVO();

				bVo.setRNum(rs.getInt("rNum"));
				bVo.setNum(rs.getInt("num"));
				bVo.setName(rs.getString("name"));
				bVo.setContent(rs.getString("content"));
				bVo.setWritedate(rs.getTimestamp("writedate"));
				bVo.setImg(rs.getString("img"));
				
				list.add(bVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
	// 댓글 등록
	public void insertReply(ReplyVO bVo) {
		String sql = "INSERT INTO REPLY(NAME, NUM, CONTENT, IMG) " +
				"VALUES(?,?,?,?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bVo.getName());
			pstmt.setInt(2, bVo.getNum());
			pstmt.setString(3, bVo.getContent());
			pstmt.setString(4, bVo.getImg());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// 댓글 수정
	public void updateReply(ReplyVO bVo) {
		String sql = "UPDATE REPLY SET NAME = ?, CONTENT = ?, IMG = ? WHERE RNUM = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bVo.getName());
			pstmt.setString(2, bVo.getContent());
			pstmt.setString(3, bVo.getImg());
			pstmt.setInt(4, bVo.getRNum());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// 댓글 삭제
	public void deleteReply(String rNum) {
		String sql = "DELETE FROM REPLY WHERE RNUM = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rNum);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// 전체 댓글 수
	public int selectAllReplyCount(String num) {
		String sql = "SELECT COUNT(*) FROM REPLY WHERE NUM = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int boardCnt = 0;
		
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				boardCnt = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return boardCnt;
	}
	
	// 댓글 리스트 조회(페이징)
	public List<ReplyVO> selectReplysPaging(int offset, int pageSize, String num) {
		String sql = "SELECT * FROM REPLY WHERE NUM = ? ORDER BY RNUM DESC LIMIT ?, ?";
		
		List<ReplyVO> list = new ArrayList<ReplyVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.setInt(2, offset);
			pstmt.setInt(3, pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReplyVO rVo = new ReplyVO();
				
				rVo.setRNum(rs.getInt("rNum"));
				rVo.setNum(rs.getInt("num"));
				rVo.setName(rs.getString("name"));
				rVo.setContent(rs.getString("content"));
				rVo.setWritedate(rs.getTimestamp("writedate"));
				rVo.setImg(rs.getString("img"));
				
				list.add(rVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
		
	//댓글 상세 내용 보기 : 글번호로 찾아온다. : 실패 null
	public ReplyVO selectOneReplyByNum(String rNum) {
		String sql = "SELECT * FROM REPLY WHERE rNum = ?";
		
		ReplyVO bVo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bVo = new ReplyVO();
				
				bVo.setRNum(rs.getInt("rNum"));
				bVo.setName(rs.getString("name"));
				bVo.setContent(rs.getString("content"));
				bVo.setWritedate(rs.getTimestamp("writedate"));
				bVo.setImg(rs.getString("img"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return bVo;
	}
	
}






