<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	 <div class="form-group">
	 <label for="buy_no" style="font-weight: bold; margin-bottom: 3px;">주문번호</label>
	<input type="text" name="buy_no" value="${dto.buy_no }"
       class="form-control" 
       style="height: 42px; padding: 2px 10px; text-align: center;"
        readonly/>
       </div>
       	
	
	 <div class="form-group">
	<label for="title" style="font-weight: bold; margin-bottom: 3px;">펀딩참여 상품</label>
	<input type="text" name="title" value="${dto.title }"
      class="form-control" 
       style="height: 42px; padding: 2px 10px; text-align: center;"
        readonly/>
	 </div>
	
	 <div class="form-group">
	<label for="qty" style="font-weight: bold; margin-bottom: 3px;">수량</label>
	<input type="text" name="qty" value="${dto.qty }"
     class="form-control"
     style="height: 42px; padding: 2px 10px; text-align: center;"
        readonly/>
	 </div>

	
	 <div class="form-group">
	<label for="total_price" style="font-weight: bold; margin-bottom: 3px;">후원금액</label>
    <input type="text" name="total_price" value="<fmt:formatNumber value="${dto.total_price}"/>" 
        class="form-control" 
         style="height: 42px; padding: 2px 10px; text-align: center;"
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
          onclick="javascript:location.href='index.do'">
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