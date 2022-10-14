package com.board.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BbsDAO;
import com.board.vo.BbsVO;
import com.board.vo.SearchVO;

public class BbsViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "board/bbsView.jsp";
		
		String bbsID = request.getParameter("bbsID");
		
		BbsDAO bDao = BbsDAO.getInstance();
		
		// 게시글 조회 수 1 증가
		bDao.updateReadCount(bbsID);
		
		// 해당 게시글 상세 정보 조회
		BbsVO bVo = bDao.selectOneBoardByBbsID(bbsID);
		
		// 현재 페이지
		String currPage = request.getParameter("currPage");
		// 검색 파라미터
		String searchType = request.getParameter("searchType");
		String searchText = request.getParameter("searchText");
		SearchVO searchVo = new SearchVO();
		searchVo.setSearchType(searchType);
		searchVo.setSearchText(searchText);
		
		request.setAttribute("bbs", bVo);
		request.setAttribute("currPage", currPage);
		request.setAttribute("searchVO", searchVo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
