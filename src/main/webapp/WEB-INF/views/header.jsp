<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--  fmt, fn 라이브버리 사용을 위한 태그  -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	request.setCharacterEncoding("UTF-8");
	String cp1 = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Feane </title>
  <!-- Basic -->
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="<%=cp1 %>/resources/images/favicon.png" type="">




  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="<%=cp1 %>/resources/css/bootstrap.css" />

  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <!-- nice select  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <!-- font awesome style -->
  <link href="<%=cp1 %>/resources/css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="<%=cp1 %>/resources/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="<%=cp1 %>/resources/css/responsive.css" rel="stylesheet" />




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















<style type="text/css">


.custom_nav-container .navbar-nav .nav-item .nav-link {
	color: black;
}


</style>







</head>
<body>

  <div class="hero_area">
  
  
 <!--  검정색 배경 빼야해서 주석처리
  	<div class="bg-box">
      <img src="< %  
      = cp1 %>/resources/images/hero-bg.jpg" alt="">
    </div>
   -->
   

    <!-- header section strats -->
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="index.do">
          
           <!-- fundee 글자색 지정 -->
            <span style="color:black !important;">
              Fundee
            </span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto" style="padding-left: 0; margin-left:20px !important;">
              <li class="nav-item">
                <a class="nav-link" href="index.do">Home </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="list.do">펀딩하기</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="notice.do">공지사항</a>
              </li>
              
             <!-- 관리자 페이지 업데이트 필요!!! -->
 			  <li class="nav-item">
                <a class="nav-link" href="notice.do">관리자 페이지</a>
              </li>


            </ul>
            <div class="user_option">
              <a href="" class="user_link">
                <i class="fa fa-user" aria-hidden="true"></i>
              </a>
              <a class="cart_link" href="#">
              
              <!-- 추가된 부분 -->
              </a>
              <form class="form-inline">
              	<button class="btn my-2 my-sm-0 nav_search-btn" type="submit">
              	 <i class="fa fa-search"></i>
              	</button>
              </form>
              
      <c:choose>
      	<c:when test="${not empty sessionScope.loginId}">
      	<a href="${pageContext.request.contextPath }/logout" class="order_online">logout</a>
      	
      	<!-- 닉네임/id -->
      	<span style="margin-left:10px; color:black;">
      		<c:choose>
      			<c:when test="${not empty sessionScope.loginNickname }">
      			 ${fn:escapeXml(sessionScope.loginNickname)}님
      			</c:when>
      			<c:otherwise>
      			  ${fn:escapeXml(sessionScope.loginId)}님
      			</c:otherwise>
      		</c:choose>
      	</span>
      </c:when>
      
      	<c:otherwise>
      		<a href="${pageContext.request.contextPath }/loginForm.do" class="order_online">login</a>
      		<a href="${pageContext.request.contextPath }/join.do" class="order_online">join</a>
      	</c:otherwise>
      </c:choose>
 <!--  비로그인 상태일경우 : 로그인/회원가입 -->
                  
                  
<!--  ↑여기까지야  -->

              
              <!-- 
                <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                  <g>
                    <g>
                      <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                   c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                    </g>
                  </g>
                  <g>
                    <g>
                      <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                   C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                   c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                   C457.728,97.71,450.56,86.958,439.296,84.91z" />
                    </g>
                  </g>
                  <g>
                    <g>
                      <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                   c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                    </g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                </svg>
              </a>
              
               
              <form class="form-inline">
                <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit">
                  <i class="fa fa-search" aria-hidden="true"></i>
                </button>
              </form>
              <a href="" class="order_online">
                Order Online
              </a> -->
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->
  </div>









</body>
</html>