package com.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.board.vo.BbsVO;

import util.DBManager;

public class BbsDAO {

	private static BbsDAO instance = new BbsDAO();
	
	public static BbsDAO getInstance() {
		return instance;
	}
	
	// 게시글 전체 리스트 조회
	public List<BbsVO> selectAllBoards() {
		String sql = "SELECT * FROM BBS ORDER BY bbsID DESC";
		
		List<BbsVO> list = new ArrayList<BbsVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				BbsVO bVo = new BbsVO();

				bVo.setBbsID(rs.getInt("bbsID"));
				bVo.setBbsTitle(rs.getString("bbsTitle"));
				bVo.setUserId(rs.getString("userId"));
				bVo.setBbsContent(rs.getString("bbsContent"));
				bVo.setReadcount(rs.getInt("Readcount"));
				bVo.setBbsDate(rs.getTimestamp("bbsDate"));
				list.add(bVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
	}
	
	
	// 게시판 글 상세 내용 보기 : 글번호로 찾아온다. : 실패 null
	public BbsVO selectOneBoardByBbsID(String bbsID) {
		String sql = "SELECT * FROM BBS WHERE BBSID = ?";
		
		BbsVO bVo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bbsID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bVo = new BbsVO();
				
				bVo.setBbsID(rs.getInt("bbsID"));
				bVo.setBbsTitle(rs.getString("bbsTitle"));
				bVo.setUserId(rs.getString("userId"));
				bVo.setBbsContent(rs.getString("bbsContent"));
				bVo.setReadcount(rs.getInt("Readcount"));
				bVo.setBbsDate(rs.getTimestamp("bbsDate"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return bVo;
	}
	
	// 게시글 보면 조회수 1증가
	public void updateReadCount(String bbsID) {
		String sql = "UPDATE BBS SET READCOUNT = READCOUNT + 1 WHERE BBSID = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bbsID);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// 게시글 등록
		public void insertBoard(BbsVO bVo) {
			String sql = "INSERT INTO BBS(userId, bbsTitle, bbsContent) VALUES(?,?,?)";
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, bVo.getUserId());
				pstmt.setString(2, bVo.getBbsTitle());
				pstmt.setString(3, bVo.getBbsContent());
				
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt);
			}
		}
		
	
	// 게시글 수정
	public void updateBoard(BbsVO bVo) {
		String sql = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ? ";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bVo.getBbsTitle());
			pstmt.setString(2, bVo.getBbsContent());
			pstmt.setInt(3, bVo.getBbsID());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	
	// 게시물 삭제
	public void deleteBoard(String bbsID) {
		String sql = "DELETE FROM BBS WHERE bbsID = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bbsID);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// 전체 게시글 수
	public int selectAllBoardCount(String searchType, String searchText) {
		//String sql = "SELECT COUNT(*) FROM bbsID";
		String sql = "";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int boardCnt = 0;
		
		try {
			conn = DBManager.getConnection();
			
			if(searchText != null && searchText.length() > 0) {
				if(searchType.equals("all")) {		// 제목+내용
					sql = "SELECT COUNT(*) FROM BBS WHERE bbsTitle LIKE ? OR bbsContent LIKE ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + searchText + "%");
					pstmt.setString(2, "%" + searchText + "%");
				} else {
					switch(searchType) {
						case "title":		// 제목
							sql = "SELECT COUNT(*) FROM BBS WHERE bbsTitle LIKE ?";
							break;						
						case "content":		// 내용
							sql = "SELECT COUNT(*) FROM BBS WHERE bbsContent LIKE ?";
							break;
						
					}
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + searchText + "%");
				}
			} else {
				sql = "SELECT COUNT(*) FROM BBS";
				pstmt = conn.prepareStatement(sql);
			}
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
	
	// 게시글 리스트 조회(페이징)
	public List<BbsVO> selectBoardsPaging(int offset, int pageSize, String searchType, String searchText) {
		//String sql = "SELECT * FROM BBS ORDER BY bbsID DESC LIMIT ?, ?";
		String sql = "";
		
		List<BbsVO> bbsList = new ArrayList<BbsVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			
			if(searchText != null && searchText.length() > 0) {
				if(searchType.equals("all")) {
					sql = "SELECT * FROM BBS WHERE BBSTITLE LIKE ? OR BBSCONTENT LIKE ? "
							+ "ORDER BY BBSID DESC LIMIT ?, ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + searchText + "%");
					pstmt.setString(2, "%" + searchText + "%");
					pstmt.setInt(3, offset);
					pstmt.setInt(4, pageSize);
				} else {
					switch(searchType) {
						case "bbsTitle":
							sql = "SELECT * FROM BBS WHERE BBSTITLE LIKE ?  "
									+ "ORDER BY BBSID DESC LIMIT ?, ?";
							break;
						case "bbsContent":
							sql = "SELECT * FROM BBS WHERE BBSCONTENT LIKE ?  "
									+ "ORDER BY BBSID DESC LIMIT ?, ?";
							break;
						
					}
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + searchText + "%");
					pstmt.setInt(2, offset);
					pstmt.setInt(3, pageSize);
				}
			} else {
				sql = "SELECT * FROM BBS ORDER BY BBSID DESC LIMIT ?, ?";
			
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, offset);
				pstmt.setInt(2, pageSize);
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BbsVO bVo = new BbsVO();
				
				bVo.setBbsID(rs.getInt("bbsID"));
				bVo.setBbsTitle(rs.getString("bbsTitle"));
				bVo.setUserId(rs.getString("userId"));
				bVo.setBbsContent(rs.getString("bbsContent"));
				bVo.setReadcount(rs.getInt("Readcount"));
				bVo.setBbsDate(rs.getTimestamp("bbsDate"));
				
				bbsList.add(bVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return bbsList;
	}
	
}






