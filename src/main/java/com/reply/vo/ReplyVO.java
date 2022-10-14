package com.reply.vo;

import java.sql.Timestamp;

public class ReplyVO {
	private int rNum; 					//댓글 고유번호
	private int num; 					//댓글이 속한 게시판 번호
	private String name; 				//작성자
	private String content; 			//댓글 내용
	private Timestamp writedate; 		//댓글 쓴 날짜
	private String img;					//댓글에 첨부될 이미지
	
	public int getRNum() {
		return rNum;
	}
	public void setRNum(int string) {
		this.rNum = string;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getWritedate() {
		return writedate;
	}
	public void setWritedate(Timestamp writedate) {
		this.writedate = writedate;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
}