<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="script/jquery-3.6.0.js"></script>
<script type="text/javascript" src="script/board.js"></script>

<!-- css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style>
#check{
	color:#2F3438;
}
</style>



</head>
<body>
	<div id="check" align="center">
		<h1 class="fw-bold py-3">비밀번호 확인</h1>
		<form action="BoardServlet" name="frm" method="get">
			<input type="hidden" name="command" value="board_check_pass">
			<input type="hidden" name="num" value="${param.num }">
			<table style="width: 80%">
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pass" size="20">
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" class="btn btn-info pull-right fw-bold btn-outline-light" style="margin: 10px;" value="확인" onclick="return passCheck()">
			<br><br>${message }
		</form>
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>