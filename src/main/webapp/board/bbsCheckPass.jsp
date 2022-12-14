<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="script/jquery-3.6.0.js"></script>
<script type="text/javascript" src="script/bbs.js"></script>

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
		<form action="BoardServlet" name="frm" method="get">
			<input type="hidden" name="command" value="bbs_check_pass">
			<input type="hidden" name="bbsID" value="${param.bbsID }">
			<input type="submit" class="btn btn-info pull-right fw-bold btn-outline-light" style="margin: 10px;" value="확인" onclick="return passCheck()">
		</form>
	</div>
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>