package com.board.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.vo.BoardVO;
import com.reply.dao.ReplyDAO;
import com.reply.vo.ReplyVO;



public class ReplyDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String rNum = request.getParameter("rNum");
		
		ReplyDAO bDao = ReplyDAO.getInstance();
		bDao.deleteReply(rNum);
		
		new BoardViewAction().execute(request, response);
	}

}
