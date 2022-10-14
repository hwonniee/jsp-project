package com.board.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.vo.BoardVO;
import com.board.vo.SearchVO;
import com.reply.dao.ReplyDAO;
import com.reply.vo.ReplyVO;

import util.PageHandler;

public class BoardViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "boardView.jsp";

		String num = request.getParameter("num");

		BoardDAO bDao = BoardDAO.getInstance();

		// 게시글 조회 수 1 증가
		bDao.updateReadCount(num);

		// 해당 게시글 상세 정보 조회
		BoardVO bVo = bDao.selectOneBoardByNum(num);

		// 현재 페이지
		int currPage = 0;
		String currPageStr = request.getParameter("currPage");
		if(currPageStr == null || currPageStr.equals("")) {
			currPage = 1;
		} else {
			currPage = Integer.parseInt(currPageStr);
		}
		// 검색 파라미터
		String searchType = request.getParameter("searchType");
		String searchText = request.getParameter("searchText");
		SearchVO searchVo = new SearchVO();
		searchVo.setSearchType(searchType);
		searchVo.setSearchText(searchText);
		
		// 현재 페이지(댓글)
		int r_currPage = 0;
		String r_currPageStr = request.getParameter("r_currPage");
		if(r_currPageStr == null || r_currPageStr.equals("")) {
			r_currPage = 1;
		} else {
			r_currPage = Integer.parseInt(r_currPageStr);
		}
		// 화면에 보여줄 댓글 갯수 가져옴
		int r_pageSize = 0;
		String r_pageSizeStr = request.getParameter("r_pageSize");
		if(r_pageSizeStr == null) {
			r_pageSize = 5;
		} else {
			r_pageSize = Integer.parseInt(r_pageSizeStr);
		}
		
		ReplyDAO rDao = ReplyDAO.getInstance();
		// 전체 댓글 수
		int r_totalCnt = rDao.selectAllReplyCount(num);
		
		// 페이징 관련 값 자동계산(댓글)
		PageHandler r_pageHandler = new PageHandler(r_totalCnt, r_currPage, r_pageSize);
		
		// 페이지 시작값 계산(댓글)
		int r_offset = (r_currPage - 1) * r_pageSize;
		
		// 페이징 리스트를 가져옴(댓글)
		List<ReplyVO> replyList = rDao.selectReplysPaging(r_offset, r_pageSize, num);
		
		// replyList를 boardview.jsp에 전달하기 위해 설정
		request.setAttribute("replyList", replyList);
		request.setAttribute("r_pageHandler", r_pageHandler);
		
		
		request.setAttribute("board", bVo);
		request.setAttribute("currPage", currPage);
		request.setAttribute("searchVO", searchVo);
		
		
//		ReplyDAO rDao = ReplyDAO.getInstance();
//		
//		
//		// 페이징 리스트를 가져옴
//		List<ReplyVO> replyList = rDao.selectAllReplys(num);
//		
//		// replyList를 boardView에 가져오기 위함
//		request.setAttribute("replyList", replyList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
