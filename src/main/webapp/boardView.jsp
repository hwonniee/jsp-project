<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="script/jquery-3.6.0.js"></script>
<script type="text/javascript" src="script/reply.js"></script>

    <!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
.container{
	margin: 0px auto;
	width: 720px;
	position:relative;
}

#view span{
	width:720px;
	font-size: 16px;
    line-height: 20px;
    color: rgb(101, 110, 117);
    -webkit-box-direction: normal;
}

#view h1{
	height: 42px;
	margin-top: 15px;
    font-size: 32px;
    line-height: 42px;
    color: rgb(47, 52, 56);
    font-weight: 700;
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

#view .board_img{
	margin: 30px 0px;
    display: block;
    width: 100%;
}

#view table{
	font-size: 16px;
    line-height: 32px;
}

#view table .board_name{
	font-size: 20px;
    line-height: 32px;
    font-weight: 700;
    color: rgb(47, 52, 56);
    text-align: left;
}

#view table .board_writedate{
	margin-top: -15px;
	width: 130px;
	margin-left: 55px;
    font-size: 14px;
    line-height: 18px;
    display: block;
    color: rgb(130, 140, 148);
    
}

#navi_button{
	position: fixed;
  	margin-top: 100px;
  	text-align:center;
  	font-size: 14px;
    line-height: 30px;
    color: rgb(130, 140, 148);
}

#navi_button .share_bar_img{
	margin-top:10px;
	height: 60px;
	width:60px;
	border-radius: 100%;
}


#reply .reply_input_bar{
	-webkit-box-align: center;
    align-items: center;
    line-height: 0;
    box-sizing: border-box;
    border: 1px solid rgb(194, 200, 204);
    border-radius: 4px;
    display: block;
    padding: 0px 16px;
    cursor: text;
    position: relative;
    width: 490px;
    height: 46px;
}

#reply .reply_writedate{
	align-items: center;
    padding: 0px;
    font-size: 12px;
    line-height: 20px;
    font-weight: 500;
    font-family: inherit;
    color: rgb(130, 140, 148);
    border: 0px;
    background: none;
}

#reply .heart_button:hover{
	color:red;
}

#reply .heart_button{
	color: white;
	border: black;
}

#reply .reply_attr{
	align-items: center;
    padding: 0px;
    font-size: 12px;
    line-height: 20px;
    font-weight: 500;
    font-family: inherit;
    color: rgb(130, 140, 148);
    border: 0px;
    background: none;
    cursor:pointer;
}


</style>
</head>

<body>
	<header>
	<%@ include file="include_header2.jsp" %>  
	</header>
	<div class="container">
	  <div class="row">
	    <div class="col-11">
			<section class="py-5 fw-bold" id="view">
				<div>
					<span>질문과 답변</span>
					<h1 name="title">${board.title }</h1>
					<table class="table ">
						<tr class="border-white">
							<td>
								<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="#D8D8D8" class="bi bi-person-circle" viewBox="0 0 16 16">
									  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
									  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
								</svg>
								<span class="board_name" name="nickname">${board.nickname}</span>
								<span class="board_writedate" name="writedate"><fmt:formatDate value="${board.writedate }"/></span>
							</td>
							<td>
								<input class="btn btn-info pull-right fw-bold " style="color:white; margin:10px;" type="button" value="+ 팔로우" >
							</td>
						</tr>
						<tr class="border-white" >
							<c:choose>
								<c:when test="${board.img != ''}" >
									<td colspan="2"><img class="board_img" src="${board.img }" alt="첨부사진" name="img">
						   		</c:when>
				  			</c:choose>
							</td>
						</tr>
						<tr class="border-white" colspan="2">
							<td colspan="2" name="content">
							${board.content }
							</td>
						</tr>
						<tr class="text-secondary">
							<th>조회 ${board.readcount }</th>
							<td style="text-align:right; ">
								신고하기
							</td>
						</tr>
					</table>
					
					<c:choose>
						<c:when test="${userId != null && userId == board.nickname }" >
						<input class="btn btn-light btn-outline-info pull-right fw-bold " style="margin:10px;" type="button" value="목록" 
							onclick="location.href=encodeURI('BoardServlet?command=board_list&currPage=${currPage}&searchType=${searchVO.searchType }&searchText=${searchVO.searchText }')">
							<input class="btn btn-danger pull-right fw-bold" style="margin:10px;" type="button" value="삭제" 
							onclick="open_win('BoardServlet?command=board_check_pass_form&num=${board.num}', 'delete')">
							<input class="btn btn-info pull-right fw-bold " style="color:white; margin:10px;" type="button" value="수정" 
							onclick="open_win('BoardServlet?command=board_check_pass_form&num=${board.num}', 'update')">
				   		</c:when>
						<c:otherwise>
				  			<input class="btn btn-light btn-outline-info pull-right fw-bold " style="margin:10px;" type="button" value="목록" 
										onclick="location.href=encodeURI('BoardServlet?command=board_list&currPage=${currPage}&searchType=${searchVO.searchType }&searchText=${searchVO.searchText }')">
						</c:otherwise>
					</c:choose>
			</section>
			<section id="reply">
				<table class="table border-white">
				  <tbody>
				  	<tr>
				      <th scope="col">댓글</th>
				    </tr>
				  	<tr>
					  <td>
					  	<img class="reply_icon" alt="댓글프로필 사진" src="images/reply.png">
					  </td>
				      <td scope="row">
					    <%
			    			if(userId == null) {
					    %>
							<form class="col-sm-2" name="frm" method="post" action="UserServlet?command=user_login_check">
						      		<input class="reply_input_bar" type="text" placeholder="댓글을 남겨보세요." name="rContent">
						      		<input type="submit" class="submit_btn btn btn-info fw-bold btn-outline-light" style="margin-top: -70px; margin-left:500px;" value="확인" 
						      		onclick="location.href=encodeURI('BoardServlet?command=reply_list&currPage=${currPage}&searchType=${searchVO.searchType }&searchText=${searchVO.searchText }')">
							</form>
				    	<%
				    		} else {
				    	%>
				    		<form name="frm" method="post" action="BoardServlet?command=reply_write&num=${board.num }&currPage=${r_pageHandler.currPage}&searchType=${searchVO.searchType}&searchText=${searchVO.searchText}">
									<input type="hidden" name="rName" value="${userId}">
									<input type="hidden" name="num" value="${board.num}">
						      		<input class="reply_input_bar" type="text" placeholder="댓글을 남겨보세요." name="rContent">
						      		<input type="submit" class="submit_btn btn btn-info pull-right fw-bold btn-outline-light" style="margin-top: -45px;" onclick="return replyCheck()" value="확인">
						    </form>
				    	<%
				    		}
				    	%>
				      </td>
				    </tr>
				    <c:forEach var="reply" items="${replyList }">
					    <tr>
					      <td scope="row">
					      	<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="#D8D8D8" class="bi bi-person-circle" viewBox="0 0 16 16">
								<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
								<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
							</svg>
					      </td>
					      <td>
			      			<div class="reply_name">${reply.name}</div>
			      			<div class="reply_content">${reply.content }</div>
			      			<span class="reply_writedate"><fmt:formatDate value="${reply.writedate }"/></span>
			      			<span class="heart">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="red" id="heart2_${reply.RNum }" class="bi bi-heart-fill" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
								</svg>
							</span>
			      			<span class="reply_attr">좋아요</span>
			      			<c:choose>
								<c:when test="${userId != null && userId == reply.name}" >
								<a class="reply_attr" href="BoardServlet?command=reply_delete&num=${board.num }&currPage=${currPage }&searchType=${searchVO.searchType}&searchText=${searchVO.searchText}&rNum=${reply.RNum}">・삭제</a>
						   		</c:when>	
							</c:choose>
					      </td>
					    </tr>
				    </c:forEach>
				  </tbody>
				</table>
				<div class="paging">
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
					<li class="page-item">			    	
						<c:if test="${r_pageHandler.showPrev }">
							<a class="page-link" href="BoardServlet?command=board_view&num=${board.num }&currPage=${currPage }&searchType=${searchVO.searchType}&searchText=${searchVO.searchText}&r_currPage=${r_pageHandler.beginPage - 1 }&r_pageSize=${r_pageHandler.pageSize}" data-page="${r_pageHandler.beginPage - 1 }">Previous
							</a>
						</c:if>
					</li>			    
					<c:forEach var="i" begin="${r_pageHandler.beginPage }" end="${r_pageHandler.endPage }">
					<li class="page-item">
						<a class="page-link" href="BoardServlet?command=board_view&num=${board.num }&currPage=${currPage }&searchType=${searchVO.searchType}&searchText=${searchVO.searchText}&r_currPage=${i }&r_pageSize=${r_pageHandler.pageSize}" data-page="${i }">${i }
						</a>
					</li>
					</c:forEach>
					<li class="page-item">			    	
						<c:if test="${r_pageHandler.showNext }">
							<a class="page-link" href="BoardServlet?command=board_view&num=${board.num }&currPage=${currPage }&searchType=${searchVO.searchType}&searchText=${searchVO.searchText}&r_currPage=${r_pageHandler.endPage + 1 }&r_pageSize=${r_pageHandler.pageSize}" data-page="${r_pageHandler.endPage + 1 }">Next
							</a>
						</c:if>
					</li>
				  </ul>
				</nav>
			</div>
			</section>	
		</div>
	</div>	
</div>
<%@ include file="include_footer.jsp" %> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>







