<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
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
    font-family: Arial, sans-serif;
    color: #333;
    background-color: #f9f9f9;
}

.product-container {
    display: flex; /* Flexbox를 사용해 내부 요소(이미지, 정보)를 가로로 배치 */
    justify-content: center;  /* 수평 가운데 정렬 */
    padding: 40px 20px;
    gap: 40px;
    max-width: 1200px;
    margin: 0 auto;
    background-color: #fff;
    border-radius: 15px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.1);
    min-height: 600px; /* 최소 높이 설정 */
}

.product-image-section { /* <div class="product-image-section">에 적용 */
    width: 60%;
    text-align: center;
     display: flex;
    flex-direction: column;
    height: fit-content; /* 높이를 내용에 맞게 조정 */
}

.product-image-section img { /* 이미지 태그에 적용 */
    width: 100%;
    height: 400px; /* 고정 높이 */
    object-fit: cover; /* 비율 유지하면서 크기에 맞춤 */
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.product-info-section { /* <div class="product-info-section">에 적용 */
    width: 40%;
    display: flex;
    flex-direction: column;
    justify-content: flex-start; /* 상단부터 배치 */
    height: fit-content;
}

.product-info-section .meta {
    font-size: 14px;
    color: #777;
    margin-bottom: 20px;
    padding: 10px;
    background-color: #f8f9fa;
    border-radius: 8px;
}

.product-info-section h3 { /* 상품 제목 <h3>에 적용 */
    font-size: 28px;
    font-weight: bold;
    color: #222;
    margin: 0 0 20px 0;
    line-height: 1.3;
}

.info-meta {
    margin-bottom: 25px;
}

.info-meta p { /* 상품 정보(작성자, 날짜 등) <p> 태그에 적용 */
    margin: 8px 0;
    font-size: 16px;
    display: flex;
    align-items: center;
    padding: 8px 0;
    border-bottom: 1px solid #eee;
}

.info-meta p:last-child {
    border-bottom: none;
}

.info-meta p strong {
    font-weight: 600;
    color: #555;
    width: 120px;
}

.product-price-display .price-value { /* 상품 가격 <span>에 적용 */
    font-size: 36px;
    font-weight: bold;
    color: #ff0000;
    display: inline-block;
    margin-bottom: 15px;
}

/* 진행률 바 스타일 */
.progress-bar-container { /* 달성률 바 외부 컨테이너에 적용 */
    width: 100%;
    height: 8px;
    background-color: #e9ecef;
    border-radius: 4px;
    margin-top: 8px;
    overflow: hidden;
}
.progress-fill { /* 달성률을 나타내는 내부 바에 적용 */
    height: 100%;
    background-color: #00c4c4;
    border-radius: 4px;
    transition: width 0.4s ease-in-out;
}
.progress-text {
    font-size: 0.9em;
    color: #666;
    margin-top: 8px;
    text-align: center;
    font-weight: 500;
}

.funding-status { /* 펀딩 현황을 담는 컨테이너에 적용 */
    margin-top: 20px !important;
    padding: 15px !important;
    background-color: #f8f9fa;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1) !important;
    width: 100%;
    box-sizing: border-box;
}
/* 상세 페이지 달성게이지 바 수정 */
.funding-status .status-header {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 15px;
}

.funding-actions { /* 버튼들을 담는 컨테이너에 적용 */
    margin-top: 30px;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 15px;
}
/* 상세 페이지 펀딩하기 버튼 디자인 */
.funding-actions .btn-fund { /* 펀딩하기 버튼에 적용 */
    padding: 15px 20px;
    font-size: 18px;
    font-weight: bold;
    color: #fff;
    background-color: #00c4c4;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    text-align: center;
    transition: all 0.3s ease;
    width: 100%;
}

.funding-actions .btn-fund:hover { /* 펀딩하기 버튼 호버 효과 */
    background-color: #e6a82e;
    transform: translateY(-2px);
}

.actions { /* 수정/삭제/목록 버튼 그룹에 적용 */
    display: flex;
    width: 100%;
    gap: 15px;
}

.funding-actions .btn-edit, .btn-delete, .btn-list { /* 관리자 버튼들에 적용 */
    flex: 1; /* 동일한 너비로 분할 */
    padding: 12px;
    font-size: 14px;
    color: #555;
    background-color: #f8f9fa;
    border: 1px solid #ddd;
    border-radius: 6px;
    cursor: pointer;
    transition: all 0.2s ease;
    width: 100%;
}

.funding-actions .btn-edit:hover {
    background-color: #00796b;
    color: white;
}

.funding-actions .btn-delete:hover {
    background-color: #dc3545;
    color: white;
}

.funding-actions .btn-list:hover {
    background-color: #6c757d;
    color: white;
}
/* 상품 상세 설명 섹션 */
.content-section { /* <div class="content-section">에 적용 */
    background-color: #fff;
    padding: 40px;
    border-radius: 15px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.1);
    margin: 10px auto;
    max-width: 1200px;
}


.content-section h4 { /* 제목 <h4>에 적용 */
    font-size: 24px;
    margin-bottom: 20px;
    color: #333;
    border-bottom: 2px solid #ffbe33;
    padding-bottom: 30px;
}

.content-section p { /* 상세 내용 <p>에 적용 */
    line-height: 1.8;
    font-size: 16px;
    color: #555;
    white-space: pre-wrap;
}

/* 네비게이션바 스타일 */
.navbar-nav .nav-item .nav-link {
    color: #ffffff !important;
    font-weight: 500;
    padding: 10px 20px !important;
    margin: 0 5px;
    border-radius: 25px;
    transition: all 0.3s ease;
    text-decoration: none !important;
    border: none !important;
    background: none !important;
    box-shadow: none !important;
}

.navbar-nav .nav-item .nav-link:hover {
    color: #ffbe33 !important;
    background-color: transparent !important;
    transform: translateY(-2px);
}

.navbar-nav .nav-item.active .nav-link {
    color: #333 !important;
    background-color: transparent !important;
    border-bottom: none !important;
    box-shadow: none !important;
}

.navbar-nav .nav-item.active .nav-link:hover {
    color: #ffbe33 !important;
    transform: translateY(-2px);
}

.navbar-nav .nav-link:focus,
.navbar-nav .nav-link:active {
    outline: none !important;
    box-shadow: none !important;
    border: none !important;
}

.navbar {
    padding-top: 1rem;
    padding-bottom: 1rem;
}

.navbar-brand {
    font-size: 1.8rem;
    font-weight: bold;
    color: #333 !important;
}

.navbar-brand:hover {
    color: #ffbe33 !important;
}

.user_option .order_online {
    background-color: #ffbe33;
    color: white;
    padding: 10px 20px;
    border-radius: 25px;
    text-decoration: none;
    margin-left: 5px;
    transition: all 0.3s ease;
}

.user_option .order_online:hover {
    background-color: #e6a82d;
    transform: translateY(-2px);
    text-decoration: none;
    color: white;
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .product-container {
        flex-direction: column;
        padding: 20px;
    }
    .product-image-section,
    .product-info-section {
        width: 100%;
    }
    .product-info-section h3 {
        font-size: 24px;
    }
    .actions {
        flex-direction: column;
    }
    .content-section {
        padding: 20px;
        margin: 20px;
    }
}
</style>

</head>
<body class="sub_page">

<div class="hero_area">
    <div class="bg-box">
        <img src="<%=cp %>/resources/images/hero-bg.jpg" alt="">
    </div>
    <header class="header_section" style="background-color: #ffffff; box-shadow: 0 2px 4px rgba(0,0,0,0.1);">
        <div class="container">
            <nav class="navbar navbar-expand-lg custom_nav-container">
                <a class="navbar-brand" href="<%=cp%>/">
                    <span style="color: write;">
                        Fundee
                    </span>
                </a>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class=""> </span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto ">
                        <li class="nav-item">
                            <a class="nav-link" href="<%=cp%>/">Home </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="<%=cp%>/posts_list.do">PRODUCT <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="notice.do">NOTICE</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=cp%>/buyForm.do">BUY TEST</a>
                        </li>
                    </ul>
                    <div class="user_option">
                        <c:choose>
                            <c:when test="${not empty sessionScope.loginUser}">
                                <a href="<%=cp%>/logout.do" class="order_online" style="background-color: #ffbe33; color: white; padding: 10px 20px; border-radius: 25px; text-decoration: none;">logout</a>
                                <span style="margin-left: 10px;">${sessionScope.loginUser.name}님</span>
                            </c:when>
                            <c:otherwise>
                                <a href="loginForm.do" class="order_online" style="background-color: #ffbe33; color: white; padding: 10px 20px; border-radius: 25px; text-decoration: none;">login</a>
                                <a href="joinForm.do" class="order_online" style="background-color: #ffbe33; color: white; padding: 10px 20px; border-radius: 25px; text-decoration: none; margin-left: 5px;">join</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </nav>
        </div>
    </header>
</div>

<section class="food_section layout_padding">
    <div class="container-fluid">
        <div class="product-container">
            <div class="product-image-section">
                <c:choose>
                    <c:when test="${not empty dto.detail_imagefile}">
                        <img src="<%=cp%>/resources/uploads/${dto.detail_imagefile}" alt="상품 대표 이미지">
                    </c:when>
                    <c:otherwise>
                        <img src="<%=cp%>/resources/images/no_image.jpg" alt="이미지 없음">
                    </c:otherwise>
                </c:choose>

                <div class="funding-status" style="margin-top: 20px; padding: 15px; background-color: #fff; border-radius: 10px; box-shadow: 0 2px 8px rgba(0,0,0,0.1);">
                    <c:set var="percentage" value="${(dto.current_amount / dto.goal_amount) * 100}" />

                    <div style="font-size: 30px; font-weight: bold; color: #333; margin-bottom: 10px; text-align: center;">
                        <c:choose>
                            <c:when test="${dto.status eq '모금 완료'}">
                                <span style="color: #28a745;">✓ 모금완료 (100%)</span>
                            </c:when>
                            <c:otherwise>
                                <span style="color: #00c4c4;"><c:out value="${Math.round(percentage)}"/>% 달성</span>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div style="width: 100%; height: 12px; background-color: #f0f0f0; border-radius: 6px; overflow: hidden; margin-bottom: 10px;">
                        <c:choose>
                            <c:when test="${dto.status eq '모금 완료'}">
                                <div style="height: 100%; width: 100%; background-color: #28a745; border-radius: 6px; transition: width 0.4s ease-in-out;"></div>
                            </c:when>
                            <c:otherwise>
                                <div style="height: 100%; width: ${percentage > 100 ? 100 : percentage}%; background-color: #00c4c4; border-radius: 6px; transition: width 0.4s ease-in-out;"></div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div style="font-size: 18px; color: #666; text-align: center; font-weight: 500;">
                        <span style="color: #00c4c4; font-weight: bold;">
                            <fmt:formatNumber value="${dto.current_amount}" pattern="#,###" />원
                        </span>
                        <span style="color: #00c4c4;"> / </span>
                        <span style="color: #00c4c4;">
                            <fmt:formatNumber value="${dto.goal_amount}" pattern="#,###" />원
                        </span>
                    </div>
                </div>
            </div>
			<!-- 상품 이미지가 없을 때 디자인 -->
            <div class="product-info-section">
                <h3>${dto.title}</h3>
                <div class="product-price-display">
                    <span class="price-value">
                        <fmt:formatNumber value="${dto.price}" pattern="#,###" />원
                    </span>
                </div>

                <div class="info-meta">
                    <p><strong>관리자:</strong> <span>${dto.userId}</span></p>
                    <p><strong>등록일:</strong> <span>${dto.reg_date}</span></p>
                    <p><strong>조회수:</strong> <span>${dto.hitCount}</span></p>
                    <p><strong>판매 시작일:</strong> <span>${dto.start_date}</span></p>
                    <p><strong>판매 종료일:</strong> <span>${dto.end_date}</span></p>
                </div>

                <div class="funding-actions" style="margin-top: 70px;">
                    <c:choose>
                        <c:when test="${sessionScope.loginUser.role == 1}">
                            <div class="actions">
                                <button class="btn-edit" onclick="location.href='<%=cp%>/updated.do?posts_num=${dto.posts_num}'">수정</button>
                                <button class="btn-delete" onclick="deleteConfirm('<%=cp%>/deleted.do?posts_num=${dto.posts_num}')">삭제</button>
                                <button class="btn-list" onclick="location.href='<%=cp%>/posts_list.do'">목록</button>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:choose>
                                <c:when test="${not empty sessionScope.loginUser}">
                                    <a href="<%=cp%>/buyForm.do?posts_num=${dto.posts_num}" class="btn-fund">펀딩하기</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="<%=cp%>/loginForm.do?redirect_url=<%= request.getRequestURI() %>?posts_num=${dto.posts_num}" class="btn-fund">펀딩하기</a>
                                </c:otherwise>
                            </c:choose>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</section>
<section style="background-color: #f9f9f9; padding-top: 5px; padding-bottom: 40px;">
    <div class="container">
        <div class="content-section">
            <h4>상품 상세 설명</h4>
            <p>${dto.content}</p>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>
<script src="<%=cp %>/resources/js/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="<%=cp %>/resources/js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
<script src="<%=cp %>/resources/js/custom.js"></script>

<script>
    function deleteConfirm(url) {
        if (confirm("정말 삭제하시겠습니까?")) {
            location.href = url;
        }
    }
</script>

</body>
</html>