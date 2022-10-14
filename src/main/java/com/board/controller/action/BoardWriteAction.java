package com.board.controller.action;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.vo.BoardVO;
import com.board.vo.SearchVO;

public class BoardWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardVO bVo = new BoardVO();
		
		bVo.setNickname(request.getParameter("nickname"));
		bVo.setPass(request.getParameter("pass"));
		bVo.setTitle(request.getParameter("title"));
		bVo.setContent(request.getParameter("content"));
		bVo.setImg(request.getParameter("img"));
		
		// DB에 게시글 등록
		BoardDAO bDao = BoardDAO.getInstance();
		bDao.insertBoard(bVo);
		
		// 현재 페이지
		String currPage = request.getParameter("currPage");
		if(currPage == null) {
			currPage = "1";
		}
		// 검색 파라미터
		String searchType = request.getParameter("searchType");
		String searchText = request.getParameter("searchText");
		SearchVO searchVo = new SearchVO();
		searchVo.setSearchType(searchType);
		searchVo.setSearchText(searchText);
		
		request.setAttribute("currPage", currPage);
		request.setAttribute("searchVO", searchVo);
		
		// insert 후 게시글 목록으로 이동 
		new BoardListAction().execute(request, response);
		
		
	}

	
}