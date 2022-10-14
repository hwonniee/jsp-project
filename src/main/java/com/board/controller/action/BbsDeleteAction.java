package com.board.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BbsDAO;

public class BbsDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bbsID = request.getParameter("bbsID");
		
		BbsDAO bDao = BbsDAO.getInstance();
		bDao.deleteBoard(bbsID);
		
		new BbsListAction().execute(request, response);
	}

}
