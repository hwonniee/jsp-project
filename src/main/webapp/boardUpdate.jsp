<%@page import="com.user.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>

<script src="script/jquery-3.6.0.js"></script>

<script>
//Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  var forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.prototype.slice.call(forms)
    .forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }

        form.classList.add('was-validated')
      }, false)
    })
})()
</script>


<!-- css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


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
      
    </style>

    
  </head>
<body>
    
<header>
<%@ include file="include_header2.jsp" %>  
</header>
</head>
<body>
<section class="py-5 container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto card">
      <div class="card-body">
      <h1 class="fw-bold text-left fs-5" >
    	<img src="images/QnA_icon.png">
        질문과 답변 글 작성 가이드</h1>
        <p class="text-left py-lg-2 ">
        <li class="py-lg-1"> 참고가 되는 사진을 같이 공유해주시면 더 좋은 답변을 얻을 수 있습니다. </li>
        <li class="py-lg-1"> 비슷한 어려움을 겪는 유저를 위해 답변자에게 포인트를 지급하며, 답변이 달린 질문글은 삭제할 수 없습니다.</li>
        <li class="py-lg-1"> 인테리어와 관련 없는 질문은 숨김 및 삭제될 수 있습니다. </li>
        <li class="py-lg-1"> 상품/배송 등 쇼핑 관련 문의는 고객센터에서 요청해주세요. </li>
        </p>
        </div>
      </div>
    </div>
  </section>
  
  <div class="container">
	<div class="row">
	<div id="wrap" align="center" >
		
		<form name="frm" method="post" action="BoardServlet">
			<input type="hidden" name="command" value="board_update">
			<input type="hidden" name="num" value="${board.num }">
			<input type="hidden" name="nickname" value="<%= userId %>">
			<table class="table" style="text-align:center;">
				<tbody>
				<form class="row g-3 needs-validation" novalidate>
					<tr>
						<th>제목</th>
						<td><input type="text" class="form-control" required autofocus placeholder="글 제목" name="title" maxlength="50" value="${board.title }">* 필수</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="text" class="form-control" placeholder="이미지" name="img" value="${board.img }"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="height:340px;" > ${board.content }</textarea></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" class="form-control" required autofocus placeholder="비밀번호" name="pass">
							* 필수 (게시물 수정 삭제시 필요합니다.)
						</td>
					</tr>
					</form>
				</tbody>
			</table>
			<br><br>
			<input type="submit" class="btn btn-info pull-right btn btn-outline-light fw-bold" style="margin: 10px;" value="등록" onclick="return boardCheck()">
			<input type="reset" class="btn btn-outline-info fw-bold btn-light pull-right" style="margin: 10px;" value="다시 작성">
			<input type="button" class="btn btn-outline-info fw-bold btn-light pull-right" style="margin: 10px;" value="목록" 
				onclick="location.href='BoardServlet?command=board_list&currPage=${currPage}&searchType=${searchVO.searchType }&searchText=${searchVO.searchText }'">
		</form>
	</div>
	</div>
</div>
<footer class="text-muted py-5">
	<%@ include file="include_footer.jsp" %> 
</footer>


   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
