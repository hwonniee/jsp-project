package com.board.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BbsDAO;
import com.board.vo.BbsVO;

public class BbsUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BbsVO bVo = new BbsVO();
		
		bVo.setBbsID(Integer.parseInt(request.getParameter("bbsID")));
		bVo.setBbsTitle(request.getParameter("bbsTitle"));
		bVo.setBbsContent(request.getParameter("bbsContent"));
		
		// DB에서 수정(Update문 실행)
		BbsDAO bDao = BbsDAO.getInstance();
		bDao.updateBoard(bVo);
		
		// 수정 후 게시판 목록 페이지로 이동
		new BbsListAction().execute(request, response);
	}

}
