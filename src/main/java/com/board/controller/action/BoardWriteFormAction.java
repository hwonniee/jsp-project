package com.board.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.vo.SearchVO;

public class BoardWriteFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "boardWrite.jsp";
		
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
				
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
