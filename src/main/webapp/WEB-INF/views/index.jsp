<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <!-- Basic -->
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="<%=cp %>/resources/images/favicon.png" type="">

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title> Fundee </title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="<%=cp %>/resources/css/bootstrap.css" />


  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <!-- nice select  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <!-- font awesome style -->
  <link href="<%=cp %>/resources/css/font-awesome.min.css" type="text/css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="<%=cp %>/resources/css/style.css" type="text/css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="<%=cp %>/resources/css/responsive.css" type="text/css" rel="stylesheet" />








<style>

body {
	font-family: 'AppleSDGothicNeo', Pretendard-Regular, sans-serif;
	
}


.custom_nav-container .navbar-nav .nav-item .nav-link {
	color: black;
}


.hero_area {
	height: 500px;
	flex: none;
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





</style>


</head>
<body>

  <div class="hero_area">
  
   <!-- 
  
      <div class="bg-box">
    
    	  <img src="<%=cp %>/resources/images/hero-bg.jpg" alt="">
      
    </div>
    
   -->
  
  

    <!-- header section strats -->
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="index.do">
            <span style="color:black !important;">
              Fundee
            </span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav  mx-auto "  style="padding-left: 0; margin-left:20px !important;">
              <li class="nav-item active">
                <a class="nav-link" href="index.do">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="menu.do">펀딩하기</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about.do">About</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="book.do">Book Table</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="notice.do">공지사항</a>
              </li>
            </ul>
            <div class="user_option">
              <a href="" class="user_link">
                <i class="fa fa-user" aria-hidden="true"></i>
              </a>
              <a class="cart_link" href="#">
                
              </a>
              <form class="form-inline">
                <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit">
                  <i class="fa fa-search"></i>
                </button>
              </form>
              <a href="" class="order_online">
                Order Online
              </a>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->
    
    
    
    <!-- slider section -->
    <div class="slider_section ">
      <div id="customCarousel1" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <div class="container ">
              <div class="row carousel-img carousel-img1" >
                <div class="col-md-7 col-lg-6 ">
                  <div class="detail-box">
                  	
                    <h1>
                    
                    </h1>
                    <div class="carousel-img-explain">
                    	<h3>대체당 싹 빼고</h3>
	                    <h3>녹차애사비 원물로만 90% 채웠어요</h3>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="carousel-item ">
            <div class="container ">
              <div class="row carousel-img carousel-img2">
                <div class="col-md-7 col-lg-6 ">
                  <div class="detail-box">
                    <h1>
                      
                    </h1>
                    <div class="carousel-img-explain">
                    	<h3>이거 마시면 피부 하얘져요</h3>
	                    <h3>5세대 먹는 레티놀</h3>
                    </div>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <div class="container ">
              <div class="row carousel-img carousel-img3">
                <div class="col-md-7 col-lg-6 ">
                  <div class="detail-box">
                    <h1>
                      
                    </h1>
                    
                    <div class="carousel-img-explain">
                    	<h3>200만원대 명품 스웨이드</h3>
                    	<h3>2주만 20만원대</h3>
                    </div>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        
        <a class="carousel-control-prev" href="#customCarousel1" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#customCarousel1" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
  
  		
        
        <div class="container">
          <ol class="carousel-indicators">
            <li data-target="#customCarousel1" data-slide-to="0" class="active"></li>
            <li data-target="#customCarousel1" data-slide-to="1"></li>
            <li data-target="#customCarousel1" data-slide-to="2"></li>
          </ol>
        </div>
      </div>

    </div>
    <!-- end slider section -->
    
    
    
    
    
    
    
     <section class="offer_section layout_padding-bottom">
	    <div class="offer_container">
	      <div class="container ">
	      	<div>
		    	<p class="main-rcm-intro">
		    		지금, 참여해야 할 추천 펀딩
		    	</p>
		    </div>
		    
	        <div class="row">
	          <div class="col-md-6">
	            <div class="box main-rcm-box">
	              <div class="detail-box">
	                <img src="https://ohmycompany.imgix.net/uploads/reward/img/2025/09/2121714119/REWARD_2db024a4eaf4.jpg?lossless=1&h=450"
	                	class="main-rcm-img"/>
	              </div>
	              <div class="detail-box-right">
	              	<div class="detail-box-top">
		              	<span class="main-rcm-percent">83%</span> 
		                <span class="main-rcm-amount">1,142,800원</span><br/>
	              	</div>
	                
	                <div class="detail-box-price">
	                	<span class="main-rcm-price">15,000원~</span>
	                </div>
	                
	                <div class="detail-box-subject">
	                	<span class="main-rcm-subject">[열매탐정인증] 산지직송 프리미엄 안심 샤인머스켓</span><br/>
	              	</div>
	              	
	                <div class="detail-box-seller">
	                	<span class="main-rcm-seller">펀디농장</span><br/>
	              	</div>
	              	
	              	<div class="detail-box-bottom">
	                	<i class="fa fa-star" style="color: #ffca1a;"></i>
	                <span class="main-rcm-rate">4.8</span> 
	                <span class="main-rcm-ratecount">(324)</span>
	              </div>
	                
	                
	                
	                
	                
	                
	                
	              </div>
	            </div>
	          </div>
	          <div class="col-md-6  ">
	            <div class="box main-rcm-box">
	              <div class="detail-box">
	                <img src="https://ohmycompany.imgix.net/uploads/reward/img/2022/09/13046/REWARD_20221026103727537.jpg?lossless=1&h=450"
	                	class="main-rcm-img"/>
	              </div>
	              <div class="detail-box-right">
	              	<div class="detail-box-top">
		              	<span class="main-rcm-percent">145%</span> 
		                <span class="main-rcm-amount">7,257,000원</span><br/>
	              	</div>
	                
	                <div class="detail-box-price">
	                	<span class="main-rcm-price">50,000원~</span>
	                </div>
	                
	                <div class="detail-box-subject">
	                	<span class="main-rcm-subject">실내정원용 업사이클링 화분대</span><br/>
	              	</div>
	              	
	                <div class="detail-box-seller">
	                	<span class="main-rcm-seller">열린사회</span><br/>
	              	</div>
	              	
	              	<div class="detail-box-bottom">
	                	<i class="fa fa-star" style="color: #ffca1a;"></i>
	                <span class="main-rcm-rate">4.4</span> 
	                <span class="main-rcm-ratecount">(109)</span>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </section>
    
    
    
    
    
  </div>

  <!-- offer section -->





 

  <!-- end offer section -->

  <!-- food section -->

  

  <!-- end food section -->

  <!-- about section -->

  

  <!-- end about section -->

  <!-- book section -->
  
  <!-- end book section -->

  <!-- client section -->



  <!-- end client section -->

  <!-- footer section -->
  <%@ include file="footer.jsp" %>
  <!-- footer section -->


</body>

</html>