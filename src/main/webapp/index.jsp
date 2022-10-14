<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>오늘의 집 참고 jsp 구현 - 메인</title>
</head>
<body>

<%@ include file="include_header.jsp" %>
	


  <!--슬라이드 제이쿼리-->
  <script defer src="js/jquery.flexslider.js"></script>

  <script type="text/javascript">
    $(function () {
      SyntaxHighlighter.all();
    });
    $(window).load(function () {
      $('.flexslider').flexslider({
        animation: "slide",
        start: function (slider) {
          $('body').removeClass('loading');
        }
      });
    });
  </script>


  <section id="slider">
    <div class="flexslider">
      <ul class="slides">
        <li class="slide01">
          <div class="slide_wrap">
            <img src="images/banner01.png" alt="작은 집 넓게 쓰기">
            <div class="slide_text">
              <h1>작은 집 <br>넓게 쓰기</h1>
              <p> 공간은 비우고 가치를 채운 집
              </p>
            </div>
          </div>
        </li>
        <li class="slide02">
          <div class="slide_wrap">
            <img src="images/banner02.png" alt="반려식물">
            <div class="slide_text">
              <h1>반려동물 아니라<br> 반려식물도 귀여워</h1>
              <p>오늘의 집에서 소중한 반려식물 어떠세요?</p>
            </div>
          </div>
        </li>
        <li class="slide03">
          <div class="slide_wrap">
            <img src="images/banner03.png" alt="당근마켓">
            <div class="slide_text">
              <h1>이웃과 함께 하는<br>오늘의 인테리어</h1>
              <p>우리 집의 다양한 인테리어를 이웃과 함께 나누어요.</p>
            </div>
          </div>
        </li>
      </ul>
    </div>
  </section>
  <!-- 슬라이드 -->

  <article id="icons">
    <ul>
      <li>
        <img src="images/icon01.webp">
        <p>쇼핑하기</p>
      </li>
      <li>
        <img src="images/icon02.png">
        <p>빠른배송</p>
      </li>
      <li>
        <img src="images/icon03.png">
        <p>집에서뭐해?</p>
      </li>
      <li>
        <img src="images/icon04.webp">
        <p>공간별사진</p>
      </li>
      <li>
        <img src="images/icon05.png">
        <p>쉬운이사</p>
      </li>
      <li>
        <img src="images/icon06.png">
        <p>오늘의 딜</p>
      </li>
    </ul>

  </article>

  <article id="banner01">
    <h1 class="title">오늘의 딜</h1>
    <ul>

      <li><a href="#">
          <img src="images/ban01.webp" alt="제품 사진">
         </div>
          <p class="brand">리브맘</p>
          <h2>닿자마자 시원한 프리미엄 아이스쿨링 신소재 냉감패드 SS/Q</h2>
          <h3><b class="redFont">66%</b> 39,900원</h3>
          <p class="review"><b class="star">★</b> 4.5 <b class="gray">리뷰 11</b></p>
          <p class="deliveryBox">무료배송</p>
        </a></li>

      <li><a href="#">
          <img src="images/ban02.webp" alt="제품 사진">
          <p class="brand">일리</p>
          <h2>화이트 확보! [오늘의딜][해외] 프란시스 Y3.3 커피머신 4color +웰컴캡슐팩</h2>
          <h3><b class="redFont">51%</b> 96,900원</h3>
          <p class="review"><b class="star">★</b> 4.8 <b class="gray">리뷰 217</b></p>
          <p class="deliveryBox">해외직구</p>
          <p class="deliveryBox">무료배송</p>
        </a></li>

      <li><a href="#">
          <img src="images/ban03.webp" alt="제품 사진">
          <p class="brand">홈앤하우스</p>
          <h2>[오늘의딜]드디어 재입고! 모노 논슬립 라운딩 옷걸이 40개</h2>
          <h3><b class="redFont">39%</b> 13,900원</h3>
          <p class="review"><b class="star">★</b> 4.7 <b class="gray">리뷰 14,318</b></p>
          <p class="deliveryBox">무료배송</p>
        </a></li>

      <li><a href="#">
          <img src="images/ban04.webp" alt="제품 사진">
          <p class="brand">우드레이</p>
          <h2>[쿠폰할인] 공간분리 원목 가벽인테리어 스트라이프 파티션 4colors</h2>
          <h3><b class="redFont">65%</b> 54,900원</h3>
          <p class="review"><b class="star">★</b> 4.5 <b class="gray">리뷰 10,136</b></p>

        </a></li>

    </ul>
  </article>

  <article id="banner02">
    <h1 class="title">유저들의 인테리어 시공리뷰</h1>
    <ul>

      <li><a href="#">
          <div class="banBox"><img src="images/ban04.webp" alt="제품 사진"></div>
          <p><b class="star">★★★★★</b></p>
          <h2>상담 전날부터 귀찮게 해드려서 죄송했는데 친절하게 응대해주셨고 상담 시 항목 하나하나 자세히 설명해주시고 내부 사진까지 꼼꼼하게 봐주셔서 좋았어요.</h2>
          <h3>벨O인테리어디자인</h3>
        </a></li>

        <li><a href="#">
          <div class="banBox"><img src="images/ban05.jpg" alt="제품 사진"></div>
          <p><b class="star">★★★★★</b></p>
          <h2>첫 미팅때부터 믿음이 가는 훌륭한 사장님이라는 인상을 받았습니다. </h2>
          <h3>인O아웃 인테리어</h3>
        </a></li>
        <li><a href="#">
          <div class="banBox"><img src="images/ban06.jpg" alt="제품 사진"></div>
          <p><b class="star">★★★★★</b></p>
          <h2>저희가 인테리어 업체 선정시 제일 중요하게 본 것은 1. 동일아파트 시공 경험 2.소통 입니다. </h2>
          <h3>모드O 인테리어</h3>
        </a></li>




    </ul>
  </article>
  <section id="faq" class="bg_green">
    
    <ul class="listWrap">
      <h1 class="title">무엇을 도와드릴까요?</h1>
      <li class="qa_li">
        <div class="question">
          <p class="tit">배송비는 얼마인가요?</p>
          <p class="iconDiv"><img src="images/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">오늘의집은 상품정보 중계 및 판매 매체이며, 판매 업체 별로 배송비 정책이 상이합니다각 상품상세페이지에서 배송비를 확인하실 수 있습니다.</div>
      </li>
      <li class="qa_li">
        <div class="question">
          <p class="tit">배송확인은 어떻게 하나요?</p>
          <p class="iconDiv"><img src="images/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">우측 상단 프로필의 [나의쇼핑]을 통해 배송단계를 한눈에 보실 수 있습니다.<br>
							또한 배송이 시작되면 카카오톡 알림톡 또는 SMS로 안내메시지가 발송됩니다.</div>
      </li>
      <li class="qa_li">
        <div class="question">
          <p class="tit">배송은 얼마나 걸리나요?</p>
          <p class="iconDiv"><img src="images/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">상품 배송 기간은 배송 유형에 따라 출고 일자 차이가 있습니다.자세한 사항은 구매하신 상품의 상세 페이지에서 확인 가능하며, 배송 유형 별 기본 출고 기간은 아래와 같습니다.<br>
							∙ 일반 택배 / 화물 택배 : 결제 후 1~3 영업일 이내 출고됩니다.<br>
							∙ 업체 직접 배송 : 배송 지역에 따라 배송 일자가 상이할 수 있으므로 상품 상세 페이지에서 확인 해주세요.<br>
							※ 영업일은 주말, 공휴일을 제외한 기간입니다.<br>
							※ 제조사의 사정에 따라 출고일은 지연될 수 있는 점 양해 부탁드립니다.</div>
      </li>
      <li class="qa_li">
        <div class="question">
          <p class="tit">여러 상품을 묶음 배송 받으려면 어떻게 해야하나요?</p>
          <p class="iconDiv"><img src="images/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">
          각 상품별로 배송처가 상이할 수 있기 때문에 묶음 배송은 어렵습니다.

단, 배송처가 같은 경우 배송처의 정책에 따라 가능 할 수 있습니다.</br>
        </div>
      </li>
      <li class="qa_li">
        <div class="question">
          <p class="tit">해외배송이 가능한가요?</p>
          <p class="iconDiv"><img src="images/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">현재는 국내배송만 진행하고 있습니다.</div>
      </li>
    </ul>
  </section>

  <section id="notice">
    <h1 class="title">공지사항</h1>
    <table class="notice_d">
      <colgroup>
        <col style="width: 8%;">
        <col style="width: 70%; text-align: left !important;">
        <col style="width: 14%;">
        <col style="width: 8%;">
      </colgroup>

      <thead>
        <td>번호</td>
        <td>제목</td>
        <td>작성일</td>
        <td>조회</td>
      </thead>
      <tbody>
        <tr>
          <td>165</td>
          <td>동네생활 "같이해요" 서비스 오픈 안내</td>
          <td>2022.04.21</td>
          <td>190</td>
        </tr>
        <tr>
          <td>164</td>
          <td>이용 약관이 변경될 예정이예요.</td>
          <td>2022.03.29</td>
          <td>208</td>
        </tr>
        <tr>
          <td>163</td>
          <td>오류로 인하여 서비스 이용에 불편을 드려 죄송합니다.</td>
          <td>2022.03.22</td>
          <td>304</td>
        </tr>
        <tr>
          <td>162</td>
          <td>앱 최소 지원 버전이 변경될 예정이예요.</td>
          <td>2022.02.18</td>
          <td>89</td>
        </tr>
        <tr>
          <td>161</td>
          <td>이용 약관과 개인정보처리방침이 변경될 예정이예요.</td>
          <td>2022.02.16</td>
          <td>100</td>
        </tr>
      </tbody>

    </table>
  </section>



<%@ include file="include_footer.jsp" %> 

