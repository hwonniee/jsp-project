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

public class UserJoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter script = null;
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String userBirth = request.getParameter("userBirth");
		String userTel = request.getParameter("userTel");
		String userAddr = request.getParameter("userAddr");
		
		UserVO user = new UserVO();
		user.setUserId(userId);
		user.setUserPwd(userPwd);
		user.setUserName(userName);
		user.setUserBirth(userBirth);
		user.setUserTel(userTel);
		user.setUserAddr(userAddr);
		
		
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
		int result = userDAO.join(user);
	
		
		if(result == -1){
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			script.println("<script>");
			script.println("location.href = 'UserServlet?command=user_submit_form'");
			script.println("</script>");	
		}
	}
}