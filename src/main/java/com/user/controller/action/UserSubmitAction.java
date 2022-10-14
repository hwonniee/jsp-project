package com.user.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.vo.UserVO;

import com.user.dao.UserDAO;

public class UserSubmitAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter script = null;
		
		String userId = request.getParameter("userId");
		String userpwd = request.getParameter("userPwd");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") != null){
			script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
		
		script = response.getWriter();
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(userId, userpwd);		
		if(result == 1){
			session.setAttribute("userId", userId);
			script.println("<script>");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}else if(result == 0){
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");	
		}else if(result == -1){
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");	
		}else if(result == -2){
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");	
		}
	}
}
