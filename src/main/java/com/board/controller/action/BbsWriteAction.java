package com.board.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BbsDAO;
import com.board.vo.BbsVO;
import com.board.vo.SearchVO;


public class BbsWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BbsVO bVo = new BbsVO();
		
		bVo.setUserId(request.getParameter("userId"));
		bVo.setBbsTitle(request.getParameter("bbsTitle"));
		bVo.setBbsContent(request.getParameter("bbsContent"));
		
		// DB에 게시글 등록
		BbsDAO bDao = BbsDAO.getInstance();
		bDao.insertBoard(bVo);
		
		// 현재 페이지
		String currPage = request.getParameter("currPage");
		// 검색 파라미터
		String searchType = request.getParameter("searchType");
		String searchText = request.getParameter("searchText");
		SearchVO searchVo = new SearchVO();
		searchVo.setSearchType(searchType);
		searchVo.setSearchText(searchText);
		
		request.setAttribute("currPage", currPage);
		request.setAttribute("searchVO", searchVo);
		
		// insert 후 게시글 목록으로 이동 
		new BbsListAction().execute(request, response);
		
		
	}

		

}