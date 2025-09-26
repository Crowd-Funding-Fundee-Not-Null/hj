<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 반응형/어느창에서든 자동설정 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- 링크 아이콘 -->
<link rel="shortcut icon" href="<%=cp %>/resources/images/favicon.png" type="">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>나의 구매내역</title>


<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="<%=cp %>/resources/css/bootstrap.css" />

<!--owl slider stylesheet -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<!-- nice select  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />

<!-- font awesome style -->
<link href="<%=cp %>/resources/css/font-awesome.min.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="<%=cp %>/resources/css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="<%=cp %>/resources/css/responsive.css" rel="stylesheet" />

<style>

body {
	font-family: 'AppleSDGothicNeo', Pretendard-Regular, sans-serif;
	
}


.custom_nav-container .navbar-nav .nav-item .nav-link {
	color: black;
}


.hero_area {
	flex: none;
	min-height: 0;
}


.slider_section {
	margin: 0 auto;
	width: 900px;
	display: block;
	flex: none;
	padding-bottom: 20px;
}


.carousel-inner {
	border-radius: 10px;
}


.carousel-img {
	width: 900px;
	height: 304px;
	background-size: contain;
	border-radius: 10px;
}

.carousel-img1 {
	background: linear-gradient(to bottom, rgba(0, 0, 0, 0), rgba(0, 0, 0, .4)),
	url("https://cdn.wadiz.kr/ft/images/live-adm01/2025/0909/20250909093059458_7746.jpg/wadiz/resize/900/format/jpg/quality/85/");
}

.carousel-img2 {
	background: linear-gradient(to bottom, rgba(0, 0, 0, 0), rgba(0, 0, 0, .4)),
	url("https://cdn.wadiz.kr/ft/images/live-adm02/2025/0916/20250916165816865_7746.jpg/wadiz/resize/900/format/jpg/quality/85/");
	
}

.carousel-img3 {
	background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0), rgba(0, 0, 0, .4)),
	url("https://cdn.wadiz.kr/ft/images/live-adm01/2025/0916/20250916164542769_7746.png/wadiz/resize/900/format/jpg/quality/85/");
}


.carousel-img-explain {
	width: 600px !important;
	margin-top: 200px;
	margin-left: 20px;
	vertical-align: bottom;
	
}


.slider_section .carousel-indicators li {
	border: 1px solid #ffbe33;
}

.carousel-indicators {
	margin-top: 10px !important;
}

.carousel-control-prev {
	margin-top: 165px;
	height: 50px;
}
.carousel-control-next {
	margin-top: 165px;
	height: 50px;
}


.main-rcm-intro {
	font-size: 21px;
	font-weight: 600;
	margin-bottom: 0;
	margin-left: 15px;
}

.main-rcm-box {
	margin-top: 10px !important;
	
}


.offer_section {
	padding-bottom: 45px;
}

.offer_section .box {
	background-color: #ffffff;
}


.main-rcm-img {
	width: 240px; 
	height: 180px;
	border-radius: 10px;
	object-fit: cover;
	margin-right: 17px;
}


.detail-box-left {
	color: black;
}
.detail-box-right {
	height: 180px;
	color: black;
}


.main-rcm-percent {
	color: #ff6666; 
	font-weight: 500; 
	font-size:17pt;
}
.main-rcm-amount {
	color: #212529; 
	font-weight: 300; 
	font-size:12pt;
}
.main-rcm-price {
	color: #27caa1; 
	font-weight: 500; 
	font-size:17pt;
	
}
.main-rcm-subject {
	color: #212529;
}
.main-rcm-seller {
	color: gray;
}
.main-rcm-rate {
	color: #212529;
}
.main-rcm-ratecount {
	font-size:10pt; color: gray;
}


.detail-box-top {
	
}
.detail-box-price {
	margin-bottom: 3px;
}
.detail-box-subject {

}
.detail-box-seller {
	position: absolute;
	bottom: 50px;
}
.detail-box-bottom {
	position: absolute;
	bottom: 22px;
}



.main-random-intro {
	font-size: 21px;
	font-weight: 600;
	margin-bottom: 30px;
	margin-left: 15px;
}


.refreshBtn {
	display: inline-block;
	border: 1px darkgray solid;
	border-radius: 5px;
	cursor: pointer;
	float: right;
	margin-right: 30px;
	vertical-align: middle;
	padding: 7px 9px 7px 9px;
	color: #212529; 
	font-size: 15px;
	box-shadow: 0 0 3px;
}

</style>







<style>
#buyList {
	width:900px;
	margin:30px auto;
	text-align:center;
}

#buyAllList table {
sidth: 100%;
border-collapse: collapse;
text-align: center;	
}

#buyAllList th, #buyAllList td{
	padding: 10px;
	border-bottom: 1px solid #e4e4e4;
}

#buyAllList thead {
	background-color: #e6e4e6;
	border-top: 1ps solid #cccccc;
	border-bottom:1px solid #cccccc;
}

#buyAllList th.buy_date, #buyAllList td.buy_date,
#buyAllList th.buy_no, #buyAllList td.buy_no,
#buyAllList th.buy_price, #buyAllList td.buy_price {
	width: 12%
}

#buyAllList th.title, #buyAllList td.product_title {
	width: 42%; 
	text-align:center;

}

#buyAllList th.qty, #buyAllList td.qty {
	width: 8%
}

#buyAllList th.total_price, #buyAllList td.total_price {
	width: 80%
}

</style>

<link rel="stylesheet" type="text/css" href="<%=cp %>/resources/css/lists.css"/>

<!-- 반응형/어느창에서든 자동설정 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- 링크 아이콘 -->
<link rel="shortcut icon" href="<%=cp %>/resources/images/favicon.png" type="">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 페이지</title>

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="<%=cp %>/resources/css/bootstrap.css" />

<!--owl slider stylesheet -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<!-- nice select  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />

<!-- font awesome style -->
<link href="<%=cp %>/resources/css/font-awesome.min.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="<%=cp %>/resources/css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="<%=cp %>/resources/css/responsive.css" rel="stylesheet" />

<style>


body {
	font-family: 'AppleSDGothicNeo', Pretendard-Regular, sans-serif;
	
}


.custom_nav-container .navbar-nav .nav-item .nav-link {
	color: black;
}


.hero_area {
	flex: none;
	min-height: 0;
}


.slider_section {
	margin: 0 auto;
	width: 900px;
	display: block;
	flex: none;
	padding-bottom: 20px;
}


.carousel-inner {
	border-radius: 10px;
}


.carousel-img {
	width: 900px;
	height: 304px;
	background-size: contain;
	border-radius: 10px;
}

.carousel-img1 {
	background: linear-gradient(to bottom, rgba(0, 0, 0, 0), rgba(0, 0, 0, .4)),
	url("https://cdn.wadiz.kr/ft/images/live-adm01/2025/0909/20250909093059458_7746.jpg/wadiz/resize/900/format/jpg/quality/85/");
}

.carousel-img2 {
	background: linear-gradient(to bottom, rgba(0, 0, 0, 0), rgba(0, 0, 0, .4)),
	url("https://cdn.wadiz.kr/ft/images/live-adm02/2025/0916/20250916165816865_7746.jpg/wadiz/resize/900/format/jpg/quality/85/");
	
}

.carousel-img3 {
	background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0), rgba(0, 0, 0, .4)),
	url("https://cdn.wadiz.kr/ft/images/live-adm01/2025/0916/20250916164542769_7746.png/wadiz/resize/900/format/jpg/quality/85/");
}


.carousel-img-explain {
	width: 600px !important;
	margin-top: 200px;
	margin-left: 20px;
	vertical-align: bottom;
	
}


.slider_section .carousel-indicators li {
	border: 1px solid #ffbe33;
}

.carousel-indicators {
	margin-top: 10px !important;
}

.carousel-control-prev {
	margin-top: 165px;
	height: 50px;
}
.carousel-control-next {
	margin-top: 165px;
	height: 50px;
}


.main-rcm-intro {
	font-size: 21px;
	font-weight: 600;
	margin-bottom: 0;
	margin-left: 15px;
}

.main-rcm-box {
	margin-top: 10px !important;
	
}


.offer_section {
	padding-bottom: 45px;
}

.offer_section .box {
	background-color: #ffffff;
}


.main-rcm-img {
	width: 240px; 
	height: 180px;
	border-radius: 10px;
	object-fit: cover;
	margin-right: 17px;
}


.detail-box-left {
	color: black;
}
.detail-box-right {
	height: 180px;
	color: black;
}


.main-rcm-percent {
	color: #ff6666; 
	font-weight: 500; 
	font-size:17pt;
}
.main-rcm-amount {
	color: #212529; 
	font-weight: 300; 
	font-size:12pt;
}
.main-rcm-price {
	color: #27caa1; 
	font-weight: 500; 
	font-size:17pt;
	
}
.main-rcm-subject {
	color: #212529;
}
.main-rcm-seller {
	color: gray;
}
.main-rcm-rate {
	color: #212529;
}
.main-rcm-ratecount {
	font-size:10pt; color: gray;
}


.detail-box-top {
	
}
.detail-box-price {
	margin-bottom: 3px;
}
.detail-box-subject {

}
.detail-box-seller {
	position: absolute;
	bottom: 50px;
}
.detail-box-bottom {
	position: absolute;
	bottom: 22px;
}



.main-random-intro {
	font-size: 21px;
	font-weight: 600;
	margin-bottom: 30px;
	margin-left: 15px;
}


.refreshBtn {
	display: inline-block;
	border: 1px darkgray solid;
	border-radius: 5px;
	cursor: pointer;
	float: right;
	margin-right: 30px;
	vertical-align: middle;
	padding: 7px 9px 7px 9px;
	color: #212529; 
	font-size: 15px;
	box-shadow: 0 0 3px;
}


</style>

<style>


/* From Uiverse.io by KSAplay */ 
.likey-container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

.likey-container {
  display: block;
  position: absolute;
  right: 50px;
  bottom: 0px;
  cursor: pointer;
  font-size: 20px;
  user-select: none;
  transition: 100ms;
}

.checkmark {
  top: 0;
  left: 0;
  height: 2em;
  width: 2em;
  transition: 100ms;
  animation: dislike_effect 400ms ease;
}

.likey-container input:checked ~ .checkmark path {
  fill: #FF5353;
  stroke-width: 0;
}

.likey-container input:checked ~ .checkmark {
  animation: like_effect 400ms ease;
}

.likey-container:hover {
  transform: scale(1.1);
}

@keyframes like_effect {
  0% {
    transform: scale(0);
  }

  50% {
    transform: scale(1.2);
  }

  100% {
    transform: scale(1);
  }
}

@keyframes dislike_effect {
  0% {
    transform: scale(0);
  }

  50% {
    transform: scale(1.2);
  }

  100% {
    transform: scale(1);
  }
}



</style>

<script type="text/javascript"></script>
</head>
<!-- CSS와 연결되는 이름 - 두 번째 파일과 동일한 body 클래스 적용 -->
<body class="sub_page">
  <div class="hero_area">

   <!-- header section strats -->
   
   <%@ include file="header.jsp" %>
   
    <!-- end header section -->
  </div>
  


 <!-- book section - 두 번째 파일의 구조를 기반으로 결제 폼 구성 -->
 
     
      <!-- 페이지 제목 -->
      <style>
      .enjoy_fun{
      font-size: 40px;
      font-weight:bold; 
    text-align: center;
    padding-top: 60px;
      }
       </style>
       <div class="enjoy_fun">
       <!-- 반복문이 아닐때는 컨트롤러와 동일하게 변수지정 -->
       
		${id }님의 후원 내역
    	</div><br/>


<div id="buyList">

	<div id = "buyAllList"> 
		<table>
			<thead>
			<tr>
				<th class="buy_date">구매날짜</th>
				<th class="buy_no">주문번호</th>
				<th class="title">상품명</th>
				<th class="qty">수량</th>
				<th class="buy_price">단가</th>
				<th class="total_price">총 후원 금액</th>
			</tr>
		</thead>
		
		</div>
		
		<tbody>
		<div id = "lists"> 
		<c:forEach var="dto" items="${buyListOk }">
			<tr>
				<td class="buy_date">${dto.buy_date }</td>
				<td class="buy_no">${dto.buy_no }</td>
				<td class="title">${dto.title }</td>
				<td class="qty">
				<fmt:formatNumber value="${dto.qty }"/>ea</td>
				
				<td class="buy_price">
				<fmt:formatNumber value="${dto.buy_price }"/>원</td>
		
				<td class="total_price">
				<fmt:formatNumber value="${dto.total_price }"/>원</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
		
		</div>
	</div>
<br/>
	
	
	 <!-- footer section - 두 번째 파일의 푸터 그대로 적용 -->
  <%@ include file="footer.jsp" %>

  <!-- footer section -->
	


</div>
</body>
</html>