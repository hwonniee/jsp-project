package com.board.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reply.dao.ReplyDAO;
import com.reply.vo.ReplyVO;
import com.board.vo.SearchVO;

import util.PageHandler;

public class ReplyWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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

		
		ReplyVO rVo = new ReplyVO();
		
		rVo.setNum(Integer.parseInt(request.getParameter("num")));
		rVo.setName(request.getParameter("rName"));
		rVo.setContent(request.getParameter("rContent"));
		rVo.setImg(request.getParameter("rImg"));
		
		// DB에 댓글 등록
		ReplyDAO rDao = ReplyDAO.getInstance();
		rDao.insertReply(rVo);
		
		// insert 후 댓글 목록으로 이동 
		new BoardViewAction().execute(request, response);
	}

}
