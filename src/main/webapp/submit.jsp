<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>오늘의 집 참고 jsp 구현 - 로그인</title>
<script src="js/jquery-3.6.0.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">

<!-- font awesome-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


 <link rel="stylesheet" href="css/style.css">
 <link rel="stylesheet" href="css/form.css">

</head>
<body>
  <section>
    <form id="signup" method="post" action="UserServlet?command=user_submit">
      <img class="logo_image" src="images/logo.png">
      <span class="logo"><a href="index.jsp">오늘의 집</a></span>
      <fieldset>
        <ul>
          <li>
            <label for="userId"></label>
            <input type="text" id="userId" name="userId" required autofocus placeholder="아이디" >
          </li>
          <li>
            <label for="userPwd"></label>
            <input type="password" id="pwd" name="userPwd" required autofocus placeholder="비밀번호">
          </li>
        </ul>
        <button type="submit">로그인</button>
        <p><a href="#">비밀번호 재설정</a></p>
        <p><a href="join.jsp">회원가입</a></p>
      </fieldset>
      <div class="join">
        <div class="join_sns">
          <div>SNS계정으로 간편하게 회원가입</div>
            <ul>
              <a href="https://ko-kr.facebook.com/" title="페이스북으로 가입하기" class="join_sns_icon"><img src="images/facebook_icon.png" alt=""></a>
              <a href="https://accounts.kakao.com/login?continue=https%3A%2F%2Fkauth.kakao.com%2Foauth%2Fauthorize%3Fproxy%3DeasyXDM_Kakao_j6eeiewgvcf_provider%26ka%3Dsdk%252F1.43.0%2520os%252Fjavascript%2520sdk_type%252Fjavascript%2520lang%252Fko-KR%2520device%252FWin32%2520origin%252Fhttps%25253A%25252F%25252Fohou.se%26origin%3Dhttps%253A%252F%252Fohou.se%26response_type%3Dcode%26redirect_uri%3Dkakaojs%26state%3D19hulfjbl3762x9siogq4j%26client_id%3D3019c756ec77dd7e0a24e56d9d784f77&talk_login=hiddenk" title="카카오로 가입하기" class="join_sns_icon"><img src="images/kakao_icon.png" alt=""></a>
              <a href="https://www.naver.com" title="네이버로 가입하기" class="join_sns_icon"><img src="images/naver_icon.png" alt=""></a>
              <p class="login_check">로그인에 문제가 있으신가요?</p>
              <p>비회원 주문 조회하기</p>
            </ul>
          </div>
        </div>
      </div>
    </form>
  </section>
</body>
</html>