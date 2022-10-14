<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>오늘의 집 참고 jsp 구현</title>
<meta charset="UTF-8">
<script src="js/jquery-3.6.0.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<!-- font awesome-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript" src="js/fnq.js"></script>

<link rel="stylesheet" href="css/style.css">

</head>

<body>
	
<%
	String userId = null;
	if (session.getAttribute("userId") != null){
		userId = (String) session.getAttribute("userId");
	}
%>

<!-- Nav -->

<header id="fixed2">
    <div class="wrap">
    
    <div id="head">
      <div class="logo"><a href="UserServlet?command=index">오늘의 집</a></div>
      <ul class="navigation">
       <div class="naviLeft">
        <li class="nav"><a href="UserServlet?command=index#icons">오늘의 딜</a></li>
        <li class="nav"><a href="BoardServlet?command=board_list">질문과 답변</a></li>
        <li class="nav"><a href="BoardServlet?command=bbs_list">공지사항</a></li>
       </div>
       <div class="naviRight">
           <%
    	if(userId == null) {
   			 %>
		      <ul>
		        <li class="active"><a href="UserServlet?command=index">홈</a></li>
		        <li><a href="UserServlet?command=user_submit_form">로그인</a></li>
		        <li><a href="UserServlet?command=user_join_form">회원가입</a></li>
		      </ul>
	    <%
	    	} else {
	    %>
		      <ul>
		        <li class="active"><a href="UserServlet?command=index">홈</a></li>
		        <!--  <li><a href="BoardServlet?command=board_list">질문과 답변</a></li> -->
		        <li><a href="UserServlet?command=user_logout">로그아웃</a></li>
		      </ul>
	    <%
	    	}
	    %>
       </div>
      </ul>
    </div>
  </div>
</header>