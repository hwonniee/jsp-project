<%@page import="com.user.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import=" com.board.dao.BbsDAO" %>
<%@ page import=" com.board.vo.BbsVO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>


<!-- css -->
<link rel="stylesheet" type="text/css" href="css/board.css">
<script src="script/jquery-3.6.0.js"></script>
<script type="text/javascript" src="script/bbs.js"></script>

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

        
<%@ include file="../include_header2.jsp" %> 

  
  <div class=" contents marginTable writeTable">
	<div class="row">
	<div id="wrap" align="center" >
	
		<form name="frm" method="post" action="BoardServlet">
			<input type="hidden" name="command" value="bbs_write">
			<input type="hidden" name="userId" value="${userId }">
			<table class="table" style="text-align:center;">
				<tbody>
					<tr>
						<th>제목</th>
						<td><input type="text" class="form-control" required autofocus placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:340px;"></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-info pull-right fw-bold btn-outline-light" style="margin: 10px;" value="등록" onclick="return bbsCheck()">
			<input class="btn btn-light btn-outline-info pull-right fw-bold " style="margin:10px;" type="button" value="목록" 
			onclick="location.href='BoardServlet?command=bbs_list'">
		</form>	
	</div>
	</div>
</div>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<%@ include file="../include_footer.jsp" %> 