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
      크라우드 펀딩 참여하기
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
                         style="height: 40px; width: 715px; padding: 2px 10px; text-align: center;"
                        readonly/>
              </div>
             </div>
              
              <!-- 단가 입력 필드 -->
             <div class="row justify-content-center">
             	<div class="col-md-4">
         			<div class="form-group d-flex align-items-center">
                <label for="buyPrice" style="font-weight: bold; margin-bottom: 20px; width: 50px;">단가</label>
                <input type="text" name="buy_price" value="${dto.price}" 
                       class="form-control"
                       style="height: 40px; padding: 2px 10px; text-align: center;"
                       readonly/>
              </div>  </div>
              
              <!-- 수량 선택 필드 - 기존 select 구조 유지하면서 기능 개선 -->
            <div class="col-md-2">
              <div class="form-group d-flex align-items-center">
                <label for="qty" style="font-weight: bold; margin-bottom: 20px; width: 70px;">수량</label>
                <input type="number" name="qty" value="1" min="1" max="10"
                       class="form-control"
                     style="height: 40px; padding: 2px 10px; text-align: center;"
                        oninput="ttPrice()"/>
              </div> </div>
              
              <!-- 총 결제금액 필드 -->
            <div class="col-md-6">
              <div class="form-group d-flex align-items-center">
                <label for="total_price" style="font-weight: bold; margin-bottom: 20px; width: 115px;">총 결제금액</label>
                <input type="text" name="total_price" value="${dto.price}" 
                       class="form-control"
                    style="height: 40px; padding: 2px 10px; text-align: center;" 
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
                <input type="text" name="id" value="${sessionScope.loginId }" 
                       class="form-control" placeholder="구매자 ID" style="text-align: center";
                       readonly/>
              </div>  </div>
             
              
              <!-- 구매자명 -->
              	<div class="col-md-6"><div class="form-group d-flex align-items-center">
                <label for="name" style="font-weight: bold; margin-bottom: 20px; width: 50px;">이름</label>
                <input type="text" name="nickname" value="${sessionScope.loginNickname }" 
                       class="form-control" placeholder="구매자명" style="text-align: center";
                       readonly/>
              </div>
               </div></div>
              
              <!-- 숨겨진 필드들 - 서버로 전송할 데이터 -->
              <input type="hidden" name="posts_num" value="${dto.posts_num }">
              <input type="hidden" name="name" value="${sessionScope.loginName }">
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