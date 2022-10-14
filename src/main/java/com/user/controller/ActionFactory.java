package com.user.controller;

import com.user.controller.action.Action;
import com.user.controller.action.UserIndexAction;
import com.user.controller.action.UserJoinAction;
import com.user.controller.action.UserJoinFormAction;
import com.user.controller.action.UserLoginCheckAction;
import com.user.controller.action.UserLogoutAction;
import com.user.controller.action.UserSubmitAction;
import com.user.controller.action.UserSubmitFormAction;

/*
 * 컨트롤러에서는 직접 모델(액션 객체)을 생성하지 않는 대신 액션 객체를 생성해내는 팩토리(공장) 역할을 하는
 * 클래스(class ActionFactory)를 통해서 생성함.
 * 팩토리 패턴 - 객체를 생성해내는 클래스를 따로 설계해서 작업하는 것.
 *            요청이 들어오면 이에 해당하는 액션 객체를 생성해 줌. 
 */
public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();
	
	private ActionFactory() {
		super();
	}
	
	// 싱글톤 패턴으로 한 개의 객체만 생성하고 getInstance()로 호출하여 사용
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		System.out.println("ActionFactory :" + command);
	
		
		
		if(command.equals("user_submit_form")) {
			action = new UserSubmitFormAction(); //로그인
		} else if(command.equals("user_submit")) { 
			action = new UserSubmitAction();
		} else if(command.equals("index")) {
			action = new UserIndexAction(); //index(메인화면)
		}else if(command.equals("user_join_form")) {
			action = new UserJoinFormAction(); //회원가입
		}else if(command.equals("user_join")) {
			action = new UserJoinAction();
		}else if(command.equals("user_login_check")) { //
			action = new UserLoginCheckAction();
		}else if(command.equals("user_logout")) { //
			action = new UserLogoutAction();
		}
		
		return action;
	}
}
