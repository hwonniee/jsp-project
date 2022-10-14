package com.board.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BbsDAO;
import com.board.vo.BbsVO;

public class BbsUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "board/bbsUpdate.jsp";
		
		String bbsID = request.getParameter("bbsID");
		
		BbsDAO bDao = BbsDAO.getInstance();
		
		// 게시글 조회수 증가
		bDao.updateReadCount(bbsID);
				
		// 글번호로 게시글 상세정보 조회
		BbsVO bVo = bDao.selectOneBoardByBbsID(bbsID);
		
		request.setAttribute("bbs", bVo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
