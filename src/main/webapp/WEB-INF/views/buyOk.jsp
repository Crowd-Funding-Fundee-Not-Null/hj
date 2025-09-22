<%@ page contentType="text/html; charset=UTF-8"%>
<%	
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 반응형/어느창에서든 자동설정 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- 링크 아이콘 -->
<link rel="shortcut icon" href="<%=cp %>/resources/images/favicon.png" type="">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>펀딩 참여 완료</title>


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


<script type="text/javascript">

//나중에 여유되면 추가할부분
//구매수량 수정하기
//구매내역 이동하기

</script>


</head>
<body>


<!-- CSS와 연결되는 이름 - 두 번째 파일과 동일한 body 클래스 적용 -->
<body class="sub_page">
  <div class="hero_area">
    <div class="bg-box">
      <!-- 배경 이미지 설정 -->
      <img src="<%=cp %>/resources/images/hero-bg.jpg" alt="main_background">
    </div>

    <!-- header section starts - 두 번째 파일의 헤더 구조 그대로 적용 -->
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container">
          <!-- 로고 부분 -->
          <a class="navbar-brand" href="index.do">
            <span>FundeE</span>
          </a>
          
          <!-- 모바일 메뉴 토글 버튼 -->
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <!-- 네비게이션 메뉴 -->
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto">
              <li class="nav-item">
                <a class="nav-link" href="index.do">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="menu.do">Product</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="notice.do">Notice</a>
              </li>
              <!-- 현재 페이지이므로 active 클래스 추가 -->
              <li class="nav-item active">
                <a class="nav-link" href="buyForm.do">Buy Test</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="loginForm.do">Login</a>
              </li>
            </ul>
            
            <!-- 사용자 옵션 (로그인, 장바구니, 검색 등) -->
            <div class="user_option">
              <a href="loginForm.do" class="user_link">
                <i class="fa fa-user" aria-hidden="true"></i>
              </a>
              
              <!-- 장바구니 아이콘 -->
              <a class="cart_link" href="#">
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
                </svg>
              </a>
              
              <!-- 검색 버튼 -->
              <form class="form-inline">
                <button class="btn my-2 my-sm-0 nav_search-btn" type="submit">
                  <i class="fa fa-search" aria-hidden="true"></i>
                </button>
              </form>
              
              <!-- Order Online 버튼 -->
              <a href="" class="order_online">Order Online</a>
            </div>
          </div>
        </nav>
      </div>
    </header>
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
		클라우드 펀딩 참여 완료
		</div>
  	
		
		
		
   <section class="book_section">
    <div class="container">
      
      <div class="row justify-content-center">
        <div class="col-md-4">
          <div class="form_container">
		
		
		
		
		
		
		
	  <style>
      .enjoy_txk{
      font-size: 20px;
    text-align: center;
    margin-top: 15px;
      			}
       </style>
       <div class="enjoy_txk">
	${dto.id }님 후원 감사합니다.
		</div>
 
 	
 	
 	
 	<!--  구분선 -->
 	   <hr style="margin-top:15px; margin-bottom: 30px;">
 	
 	
	
 	
    <!-- 실제 결제 폼 시작 -->
    <form action="${pageContext.request.contextPath}/buyOk" name="buyOk" method="get">
   
<!-- 부트스트랩css의 form-control 적용
	인풋박스 크기 줄임. 좌우6픽셀,상하 2픽셀 패딩설정
 -->
 	
	  <style>
      .fdnmed{
    text-align: center;
      			}
       </style>
 
 <div class="fdnmed">
	 <div class="form-group"">
	 <label for="buy_no" style="font-weight: bold; margin-bottom: 3px;">주문번호</label>
	<input type="text" name="buy_no" value="${dto.buy_no }"
       class="form-control" 
       style="height: 42px; padding: 2px 10px; text-align: right;"
        readonly/>
       </div>
       	
	
	 <div class="form-group">
	<label for="title" style="font-weight: bold; margin-bottom: 3px;">펀딩참여 상품</label>
	<input type="text" name="title" value="${dto.title }"
      class="form-control" 
       style="height: 42px; padding: 2px 10px; text-align: right;"
        readonly/>
	 </div>
	
	 <div class="form-group">
	<label for="qty" style="font-weight: bold; margin-bottom: 3px;">수량</label>
	<input type="text" name="qty" value="${dto.qty }"
     class="form-control"
     style="height: 42px; padding: 2px 10px; text-align: right;"
        readonly/>
	 </div>

	
	 <div class="form-group">
	<label for="total_price" style="font-weight: bold; margin-bottom: 3px;">후원금액</label>
    <input type="text" name="total_price" value="${dto.buy_price}" 
        class="form-control" 
         style="height: 42px; padding: 2px 10px; text-align: right;"
        readonly/>
     </div>
     
     
    <!-- 구분선 -->
   <hr style="margin-top: 40px;">
          	

	</font>

	
		  <!-- 버튼 영역 -->
  <div class="btn_box" style="text-align: center; margin-top: 10px;
  margin-bottom: 10px">
            
		
 <!-- 메인페이지로 이동 버튼 -->
   <button type="button" class="btn btn-secondary" 
   		style="height:45px; padding:5px 10px; font-size: 15px"
          onclick="javascript:location.href='<%=cp%>/index';">
          메인페이지로 이동
   </button>
</div>
</form>
</div>
<br/>
</div>





</div>
</div>
</div>
</section>

<!-- end book section -->
	
	
	
	
	<!-- 여기는 하단이래 -->
  <!-- footer section - 두 번째 파일의 푸터 그대로 적용 -->
   <%@ include file="footer.jsp" %>
 
  <!-- footer section -->

  <!-- Bootstrap JS 추가 (필요한 경우) -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>