<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.98.0">
    <title>Carousel Template · Bootstrap v5.2</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/carousel/">

<!-- css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">

<script src="script/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function(){
		$form = $("form[name='searchForm']");
		// 페이지 번호 클릭 시 검색결과 유지하기 위함
		$(".page-item > a").on("click", function(e){
			e.preventDefault();	// 이벤트 전파 방지, <a>의 기본 클릭 이벤트 막기위함
			// 현재 페이지번호 설정
			$form.find("input[name='currPage']").val($(this).data("page"));
			$form.submit();			
		});
		
		// 검색 버튼 클릭 시 페이지 번호 1부터 시작하기 위함
		$form.find("input[type='submit']").on("click", function(e){
			e.preventDefault();
			$form.find("input[name='currPage']").val(1);
			$form.submit();
		});
		
		// eclipse 내부 브라우저 한글처리 오류때문에 인코딩해서 이동시킴
		$(".record").find("a").on("click", function(e){
			e.preventDefault();
			var uri = $(this).attr("href");
			location.href = encodeURI(uri);
		});
	});
</script>
 <style>
   .bd-placeholder-img {
     font-size: 1.125rem;
     text-anchor: middle;
     -webkit-user-select: none;
     -moz-user-select: none;
     user-select: none;
   }

   @media (min-width: 768px) {
     .bd-placeholder-img-lg {
       font-size: 3.5rem;
     }
   }
      
	
   section{
    	width: 100%;
    	background-color:  #F7F9FA;
    } 
    
    
    
    h1, p{
    	color: #2F3438;
    } 

    .contents{
    	width:750px;
    	margin: 30px auto;
    	position: relative;
    }
	
    .my-1{
    	display: block;
    	height:40px;
    	background-color: #FFFFFF;
    	border: 1px solid #EAEDEF;
    	box-shadow: 0 2px 5px rgb(63 71 77 / 5%);
    	width: 100%;
    	
    }
    
    .searchBox{
    	width: 400px;
    }
    
   
    
  	table{
  		margin-top: 30px;
  		width:750px;
  		height:126px;
  	}
  	
  	table tr .notice{
  		width:750px;
  		height:60px;
  		padding: 18px;
  	}
  	
  	
  	.notice_icon{
		width:20px;
		height:20px;
		border-radius:0px;
		margin-top:-8px
  	}
  	
  	table tr .QnA{
  		width:718px;
  		height:126px;
  	}
  	
	img{
		border-radius:8px;
		width:110px;
		height:110px;
	}
	
	 .info{
    	margin: 16px 8px -5px 0;
    	font-size: 12px;
    	line-height: 16px;
    	color: #828C94;
    }
    
    .my-2{
    	font-size: 12px;
	    line-height: 20px;
	    color: #2F3438;
	    background-color: #FFFFFF;
	    border: 1px solid #EAEDEF;
    	border-radius:50px;
    	padding: 2px 8px;
    }
    
    .tag1{
    	margin: 1px 10px 0 0;
    	color: #35C5F0;
    	background-color: #EFFBFF;
    	font-weight: 700;
    	border:none;
    }
	
	
    </style>

    
    <!-- Custom styles for this template -->
    <link href="carousel.css" rel="stylesheet">
    
	<header>
		<%@ include file="include_header2.jsp" %>  
	</header>

   <main>
	<!-- 검색 -->
	  <section class="py-5 text-center ">
		<div class="row py-lg-5">
		  <div class="col-lg-6 col-md-8 mx-auto">
			<h1 class="fs-3 py-lg-2 fw-bold">질문과 답변</h1>
			<p class="fs-8 py-lg-2 ">오늘의집 인테리어 고수들과 전문가들에게 조언을 받아보세요</p>
			  <div class="search py-lg-3">
				<form name="searchForm" action="BoardServlet" method="post">
				 	<input type="hidden" name="command" value="board_list">
					<input type="hidden" name="currPage" value="${pageHandler.currPage }">
					<div class="container">
					  <div class="row">
					   <div class="col-md-2"></div>
					    <div class="col-md-2" style="padding-right: 0;">
							<select class="my-1" name="searchType">
								<option value="title" 
								${searchVO.searchType == "title" ? "selected='selected'" : "" }>
								제목</option>
								<option value="content"
								${searchVO.searchType == "content" ? "selected='selected'" : "" }>
								내용</option>
								<option value="all"
								${searchVO.searchType == "all" ? "selected='selected'" : "" }>
								제목+내용</option>
								<option value="author"
								${searchVO.searchType == "author" ? "selected='selected'" : "" }>
								작성자</option>
							</select> 
					    </div>
					    <div class="col-md-8">
					      <input class="my-1 searchBox" type="text" name="searchText" value="${searchVO.searchText }">
					    </div>
					  </div>
					</div>
				</form>
			</div>
			<p>
			  <a href="#" class="btn btn-light my-2 " >#리모델링/올수리</a>
			  <a href="#" class="btn btn-light my-2 ">#20평대</a>
			  <a href="#" class="btn btn-light my-2 ">#아파트</a>
			  <a href="#" class="btn btn-light my-2 ">#도배</a>
			</p>
		  </div>
		</div>
	  </section>
	  
	<!-- 최신순, 미답변, 질문하기 버튼 -->
	  <div class="container contents">
		<!-- START THE FEATURETTES -->
		  <div class="row">
			<div class="col-sm-8">
				<div class="dropdown">
				  <button class="btn btn-light btn-outline-secondary dropdown-toggle fw-bold" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
					인기순
				  </button>
				  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					<li><a class="dropdown-item" href="#">최신순</a></li>
					<li><a class="dropdown-item" href="#">최근답변수</a></li>
				  </ul>
				</div>
			</div>
			<div class="col-sm-2">
				<button type="button" class="btn btn-light btn-outline-secondary fw-bold">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
				  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
				  <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
				</svg>
				 미답변 
				</button>
			</div>
			<%
		    	if(userId == null) {
		    %>
			<form class="col-sm-2" name="frm" method="post" action="UserServlet?command=user_login_check">
				<div>
					<button type="submit" class="btn btn-info fw-bold" style="color:white;">질문하기</button>
				</div>
			</form>
		    <%
		    	} else {
		    %>
		    	<div class="col-sm-2">
					<a href="BoardServlet?command=board_write_form"><button type="submit" class="btn btn-info fw-bold" style="color:white;">질문하기</button></a>
				</div>
		    <%
		    	}
		    %>
		  </div>
		 
	<!-- 공지, QnA 테이블 -->
	   <table class="table table-hover">
			 <tbody>
			 <tr class=" notice">
			  <td class="py-lg-3">  
				 <span class="my-2 tag1">공지</span>
				 <span class="fw-bold fs-6">답변 이벤트 안내 및 활동 주의사항 <img class="notice_icon" src="images/notice01.png" alt="확성기" ></span>
			  </td>
			  <td>
			  </td>
			</tr>
			   <tr class="py-lg-3 notice">
			  <td class="py-lg-3">  
				 <span class="my-2 tag1">공지</span>
				 <span class="fw-bold fs-6">빠르고 정확한 인테리어 답변을 받는 방법은?</span>
			  </td>
			  <td>
			  </td>
			</tr>
			<tr class="py-lg-3 notice">
			  <td class="py-lg-3">  
				 <span class="my-2 tag1">공지</span>
				 <span class="fw-bold fs-6">다시 돌아온 7월 멘토 모집 <img class="notice_icon" src="images/notice02.png" alt="발표하는 사람" ></span>
			  </td>
			  <td>
			  </td>
			</tr>
			
			<c:forEach var="board" items="${boardList }">
			 <tr class="QnA">
			
			  <td class="py-lg-4">  
				  <div>
					<a href="BoardServlet?command=board_view&num=${board.num }&currPage=${pageHandler.currPage}&searchType=${searchVO.searchType}&searchText=${searchVO.searchText}">
					<h2 class="lead py-lg-2 fw-bold">${board.title }</h2>
					<p class="featurette-heading fw-normal py-lg-1 lh-base">
					  ${fn:substring(board.content,0,100) }
					</p>
					<span class="info">${board.nickname}</span>
					<span class="info">날짜<fmt:formatDate value="${board.writedate }"/></span>
					<span class="info">조회${board.readcount }</span>
					</a>
					<div>
						<a href="#" class="btn btn-light my-2">#도배</a>
						<a href="#" class="btn btn-light my-2" >#리모델링/올수리</a>
						<a href="#" class="btn btn-light my-2">#20평대</a>
					</div>
				  </div>
			  </td>
			  <td class="py-lg-4">
			  <c:choose>
				<c:when test="${board.img != ''}" >
					<img src="${board.img }" alt="첨부사진" >
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
					<c:if test="${pageHandler.showPrev }">
						<a class="page-link" href="BoardServlet?command=board_list&currPage=${pageHandler.beginPage - 1 }&pageSize=${pageHandler.pageSize}" data-page="${pageHandler.beginPage - 1 }">Previous</a>
					</c:if>
				</li>			    
				<c:forEach var="i" begin="${pageHandler.beginPage }" 
									end="${pageHandler.endPage }">
				<li class="page-item">
					<a class="page-link" href="BoardServlet?command=board_list&currPage=${i }&pageSize=${pageHandler.pageSize}"data-page="${i }">${i }</a>
				</li>
				</c:forEach>
				<li class="page-item">			    	
					<c:if test="${pageHandler.showNext }">
						<a class="page-link" href="BoardServlet?command=board_list&currPage=${pageHandler.endPage + 1 }&pageSize=${pageHandler.pageSize}" data-page="${pageHandler.endPage + 1 }">Next
						</a>
					</c:if>
				</li>
			  </ul>
			</nav>
		</div>
	  </div>
	  <!-- /공지,QnA 테이블 끝-->
	</main>
	
	<footer>
		<%@ include file="include_footer.jsp" %> 
	</footer>
	
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>