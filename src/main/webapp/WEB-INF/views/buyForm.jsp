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

<script type="text/javascript">
//결제하기 버튼 눌렀을때 작동되는 기능
//"결제하시겠습니까?"팝업창나오고 사용자가 지정한 수량 저장
function sendIt(){
	var msg = confirm("결제하시겠습니까?");
	if(msg){	
		var f = document.buyForm;
		f.submit();
	} else { //취소하면 팝업창만 off
		return false;
	}
}

//buyForm 페이지에서 totalPrice 필드가 수량에따라 자동계산시키는 기능.
function ttPrice(){
	var f = document.buyForm;
	var price = f.buy_price.value;
	var qty = f.qty.value || 1;
	var total = price * qty;
	f.total_price.value = total;
}
</script>


</head>

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
      클라우드 펀딩 참여하기
    	</div><br/><br/><br/>
    	
   <section class="book_section">
    <div class="container">
      
      <div class="row justify-content-center">
      
      <!-- 인풋박스 숫자가 적을수록 너비 좁게 -->
        <div class="col-md-8">
         <div class="form_container">  
      
      
   
       <!-- 실제 결제 폼 시작 -->
       <form action="${pageContext.request.contextPath}/buyForm" name="buyForm" method="post">
         
         
                 
              
              <!-- 상품명 입력 필드 -->
            <div class="row justify-content-center">
              <div class="form-group d-flex align-items-center">
                <label for="title" style="font-weight: bold; margin-bottom: 20px; width: 50px;">상품명</label>
                <input type="text" name="title" value="${dto.title}" 
                       class="form-control"
                         style="height: 40px; width: 715px; padding: 2px 10px; text-align: right;"
                        readonly/>
              </div></div>
              
              <!-- 단가 입력 필드 -->
             <div class="row justify-content-center">
             	<div class="col-md-4">
         			<div class="form-group d-flex align-items-center">
                <label for="buyPrice" style="font-weight: bold; margin-bottom: 20px; width: 50px;">단가</label>
                <input type="text" name="buy_price" value="${dto.buy_price}" 
                       class="form-control"
                       style="height: 40px; padding: 2px 10px; text-align: right;"
                       readonly/>
              </div>  </div>
              
              <!-- 수량 선택 필드 - 기존 select 구조 유지하면서 기능 개선 -->
            <div class="col-md-2">
              <div class="form-group d-flex align-items-center">
                <label for="qty" style="font-weight: bold; margin-bottom: 20px; width: 70px;">수량</label>
                <input type="number" name="qty" value="1" min="1" max="10"
                       class="form-control"
                     style="height: 40px; padding: 2px 10px; text-align: right;"
                        oninput="ttPrice()"/>
              </div> </div>
              
              <!-- 총 결제금액 필드 -->
            <div class="col-md-6">
              <div class="form-group d-flex align-items-center">
                <label for="total_price" style="font-weight: bold; margin-bottom: 20px; width: 115px;">총 결제금액</label>
                <input type="text" name="total_price" value="${dto.buy_price}" 
                       class="form-control"
                    style="height: 40px; padding: 2px 10px; text-align: right;" 
                       readonly/>
              </div>
               </div> </div>
       
       
              <!-- 구분선 및 구매자 정보 섹션 -->
              <hr style="margin: 30px 0;">
              <h4 style="text-align: center; margin-bottom: 20px;">구매자 정보</h4>
              
              
              <!-- 한줄로 나열 후 가운데 정렬 row justify-content-center 사용(부트스트램 css) -->
              <!-- 구매자 ID -->
              <div class="row justify-content-center">
              	<div class="col-md-6"><div class="form-group  d-flex align-items-center">
                <label for="id" style="font-weight: bold; margin-bottom: 20px; width: 50px;">ID</label>
                <input type="text" name="id" value="${dto.id}" 
                       class="form-control" placeholder="구매자 ID"
                       readonly/>
              </div>  </div>
             
              
              <!-- 구매자명 -->
              	<div class="col-md-6"><div class="form-group d-flex align-items-center">
                <label for="name" style="font-weight: bold; margin-bottom: 20px; width: 50px;">이름</label>
                <input type="text" name="name" value="${dto.name}" 
                       class="form-control" placeholder="구매자명"
                       readonly/>
              </div>
               </div></div>
              
              <!-- 숨겨진 필드들 - 서버로 전송할 데이터 -->
              <input type="hidden" name="buy_no" value="${dto.buy_no}"/>
              
     <br/>
 
            
              <!-- 버튼 영역 -->
               <div class="btn_box" style="text-align: center; margin-top: 30px;">
                <!-- 결제하기 버튼 -->
                <button type="button" class="btn btn-primary btn-lg" 
                        onclick="sendIt()" style="margin-right: 10px;">
                  결제하기
                </button>
                
                <!-- 메인페이지로 이동 버튼 -->
                <button type="button" class="btn btn-secondary btn-lg" 
                        onclick="javascript:location.href='<%=cp%>/index';">
                  메인페이지로 이동
                </button>
              </div>
              
            </form>
          </div>
        </div>
      </div>
     </div>
  

  
  </section>
   <br/> <br/> <br/>
  <!-- end book section -->
  
  <!-- footer section - 두 번째 파일의 푸터 그대로 적용 -->
  <%@ include file="footer.jsp" %>

  <!-- footer section -->

  <!-- Bootstrap JS 추가 (필요한 경우) -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>