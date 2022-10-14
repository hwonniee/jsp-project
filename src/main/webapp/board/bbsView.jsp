<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.PrintWriter" %>
<%@ page import=" com.board.dao.BbsDAO" %>
<%@ page import=" com.board.vo.BbsVO" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="css/board.css">
<script src="script/jquery-3.6.0.js"></script>
<script type="text/javascript" src="script/bbs.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<%@ include file="../include_header2.jsp" %> 
 

<body>
	<div id="warp " align="center" style="padding-bottom: 70px;">
		<div class="contents writeTable">
		<table class="table marginTable ">
			
			<tr>
				<td><h1>${bbs.bbsTitle }</h1></td>
			</tr>
			<tr>
				<td><p class="viewP">${bbs.bbsContent }</p></td>
			</tr>
		</table>
		
		<c:choose>
			<c:when test="${userId != null && userId == 'admin'}" >
			<input class="btn btn-light btn-outline-info pull-right fw-bold " style="margin:10px;" type="button" value="목록" 
				onclick="location.href='BoardServlet?command=bbs_list'">
				<input class="btn btn-danger pull-right fw-bold" style="margin:10px;" type="button" value="삭제"  
				onclick="location.href='BoardServlet?command=bbs_delete&bbsID=${bbs.bbsID}'">
				<input class="btn btn-info pull-right fw-bold " style="color:white; margin:10px;" type="button" value="수정" 
				onclick="location.href='BoardServlet?command=bbs_update_form&bbsID=${bbs.bbsID}'">
	   		</c:when>
	   		
			<c:otherwise>
	  			<input class="btn btn-light btn-outline-info pull-right fw-bold " style="margin:10px;" type="button" value="목록" 
							onclick="location.href='BoardServlet?command=bbs_list'">
			</c:otherwise>
		</c:choose>
	</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 <%@ include file="../include_footer.jsp" %>






