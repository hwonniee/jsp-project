package com.board.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BbsDAO;
import com.board.vo.BbsVO;

public class BbsCheckPassAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = null;
		
		String bbsID = request.getParameter("bbsID");
		
		BbsDAO bDao = BbsDAO.getInstance();
		BbsVO bVo = bDao.selectOneBoardByBbsID(bbsID);
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
