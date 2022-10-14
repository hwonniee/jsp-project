package com.board.controller;

import com.board.controller.action.Action;
import com.board.controller.action.BbsCheckPassAction;
import com.board.controller.action.BbsCheckPassFormAction;
import com.board.controller.action.BbsDeleteAction;
import com.board.controller.action.BbsListAction;
import com.board.controller.action.BbsUpdateAction;
import com.board.controller.action.BbsUpdateFormAction;
import com.board.controller.action.BbsViewAction;
import com.board.controller.action.BbsWriteAction;
import com.board.controller.action.BbsWriteFormAction;
import com.board.controller.action.BoardCheckPassAction;
import com.board.controller.action.BoardCheckPassFormAction;
import com.board.controller.action.BoardDeleteAction;
import com.board.controller.action.BoardListAction;
import com.board.controller.action.BoardUpdateAction;
import com.board.controller.action.BoardUpdateFormAction;
import com.board.controller.action.BoardViewAction;
import com.board.controller.action.BoardWriteAction;
import com.board.controller.action.BoardWriteFormAction;
import com.board.controller.action.ReplyDeleteAction;
import com.board.controller.action.ReplyWriteAction;
import com.board.controller.action.ReplyWriteFormAction;

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
		
		if(command.equals("board_list")) {
			action = new BoardListAction();
		} else if(command.equals("board_write_form")) {
			action = new BoardWriteFormAction();
		} else if(command.equals("board_write")) {
			action = new BoardWriteAction();
		} else if(command.equals("board_view")) {
			action = new BoardViewAction();
		} else if(command.equals("board_check_pass_form")) {
			// 비밀번호 입력 화면으로 이동하는 액션 클래스
			action = new BoardCheckPassFormAction();	
		} else if(command.equals("board_check_pass")) {
			// 비밀번호 처리 액션 클래스
			action = new BoardCheckPassAction();
		} else if(command.equals("board_update_form")) {
			action = new BoardUpdateFormAction();
		} else if(command.equals("board_update")) {
			action = new BoardUpdateAction();
		} else if(command.equals("board_delete")) {
			action = new BoardDeleteAction();
		} else if(command.equals("reply_write_form")) {
   		    action = new ReplyWriteFormAction(); 
		} else if(command.equals("reply_write")) { 
			action = new ReplyWriteAction(); 
		} else if(command.equals("reply_delete")) {
			action = new ReplyDeleteAction();
		} 
		
		// 공지사항
		 else if(command.equals("bbs_list")) {
			action = new BbsListAction();
		} else if(command.equals("bbs_write_form")) {
			action = new BbsWriteFormAction();
		} else if(command.equals("bbs_write")) {
			action = new BbsWriteAction();
		} else if(command.equals("bbs_view")) {
			action = new BbsViewAction();
		} else if(command.equals("bbs_update_form")) {
			action = new BbsUpdateFormAction();
		} else if(command.equals("bbs_update")) {	
			action = new BbsUpdateAction();
		} else if(command.equals("bbs_delete")) {
			action = new BbsDeleteAction();
		}else if(command.equals("bbs_check_pass_form")) {// 비밀번호 입력 화면으로 이동하는 액션 클래스
			action = new BbsCheckPassFormAction();	
		} else if(command.equals("bbs_check_pass")) {// 비밀번호 처리 액션 클래스
			action = new BbsCheckPassAction();
		} 	
		
		
		return action;
		
		
		  
			 
			 /* else if(command.equals("reply_update_form")) { action = new
			 * ReplyUpdateFormAction(); } else if(command.equals("reply_update")) { action =
			 * new ReplyUpdateAction(); } else if(command.equals("reply_delete")) { action =
			 * new ReplyDeleteAction(); }
			 */
		
		/*
		 * if(command.equals("reply_list")) { action = new ReplyListAction(); }
		 */
		
	}
}
