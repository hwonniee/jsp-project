package com.user.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserLoginCheckAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter script = null;
		
		HttpSession session = request.getSession();
		String Id = (String)session.getAttribute("userId");
		
		if(Id != null){
			String userId = (String)session.getAttribute("userId");
		}
		if(Id == null){
			script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href = 'UserServlet?command=user_submit_form'");
			script.println("</script>");	
		}
		
		
	}
}