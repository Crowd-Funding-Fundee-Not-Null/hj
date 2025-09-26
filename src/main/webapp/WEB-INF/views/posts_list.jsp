<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon" href="<%=cp %>/resources/images/favicon.png" type="">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 목록 게시판</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/resources/css/bootstrap.css" />

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
<link href="<%=cp %>/resources/css/font-awesome.min.css" rel="stylesheet" />

<link href="<%=cp %>/resources/css/style.css" rel="stylesheet" />
<link href="<%=cp %>/resources/css/responsive.css" rel="stylesheet" />

<style type="text/css">

	/* 진행률 바 스타일 */
	.progress-bar-container {  /* <div class="progress-bar-container">에 적용 */
		width: 100%;
		height: 6px;
		background-color: #e9ecef;
		border-radius: 3px;
		margin-top: 8px;
		overflow: hidden;
	}
	.progress-fill { /* <div class="progress-fill">에 적용. 진행률에 따라 너비가 변함 */
		height: 100%;
		background-color: #00c4c4; 
		border-radius: 3px;
		transition: width 0.4s ease-in-out; /* 부드러운 애니메이션 */
	}
	.progress-text { /* 현재 사용되지 않는 클래스 */
		font-size: 0.8em;
		color: #666;
		margin-top: 5px;
		text-align: center;
	}
	
	/* 검색 영역 스타일 */
	.search-area { /* <div class="search-area">에 적용. 검색창 컨테이너 */
		background-color: rgba(255, 255, 255, 0.9); /* 반투명 흰색 배경 */
		padding: 20px;
		border-radius: 10px;
		margin-bottom: 30px;
	}
	
	/* 카드 레이아웃 스타일 */
	.products-grid { /* <div class="products-grid">에 적용. 모든 상품 카드를 감싸는 부모 요소 */
		margin-top: 30px;
	}
	
	/* 상품 카드 기본 스타일 */
	.product-card { /* <div class="product-card">에 적용. 개별 상품 카드 */
		background-color: #fff;
		border-radius: 15px;
		overflow: hidden;
		box-shadow: 0 8px 25px rgba(0,0,0,0.1); /* 그림자 효과 */
		transition: all 0.3s ease; /
		margin-bottom: 30px;
		height: 100%; /* 카드 높이 통일 */
		position: relative;
	}
		/* 카드 호버 효과 */
	.product-card:hover {
		transform: translateY(-10px); /* 위로 10px 이동 */
		box-shadow: 0 15px 35px rgba(0,0,0,0.15); 
	}
		/* 카드 이미지 컨테이너 */
	.card-image-container { /* <div class="card-image-container">에 적용 */
		position: relative;
		height: 220px; /* 고정 높이 */
		overflow: hidden;
	}
	
	.card-image-container img { /* .card-image-container 내부의 <img> 태그에 적용 */
		width: 100%;
		height: 100%;
		object-fit: cover; /* 이미지 비율 유지하며 크기 맞춤 */
		transition: transform 0.3s ease;
	}
	
	/* 카드 호버 시 이미지 확대 효과 */
	.product-card:hover .card-image-container img { /* 상품 카드 호버 시 이미지에 적용 */
		transform: scale(1.05);
	}
	
	/* 카드 번호 배지 (좌상단) */
	.card-number { /* <div class="card-number">에 적용 */
		position: absolute;
		top: 15px;
		left: 15px;
		background-color: #ffbe33;
		color: white;
		width: 35px;
		height: 35px;
		border-radius: 50%;
		display: flex;
		align-items: center;
		justify-content: center;
		font-weight: bold;
		font-size: 0.9em;
	}
	
	/* 상태 배지 (우상단) */
	.card-status { /* <div class="card-status">에 적용 */
		position: absolute;
		top: 15px;
		right: 15px;
		padding: 5px 10px;
		border-radius: 15px;
		font-size: 0.8em;
		font-weight: bold;
		color: white;
	}
	
	/* 모금 완료 상태 - 초록색 */
	.status-complete { /* JSTL 조건문에 따라 <div class="card-status status-complete">에 적용 */
		background-color: #28a745;
	}
	/* 진행 중 상태 - 노란색 */
	.status-progress {
		background-color: #ffbe33;
	}
	/* 카드 내용 영역 */
	.card-content { /* <div class="card-content">에 적용 */
		padding: 20px;
		display: flex;
		flex-direction: column;
		height: calc(100% - 220px);
	}
	/* 카드 제목 스타일 */
	.card-title { /* <a class="card-title">에 적용 */
		font-size: 1.1rem;
		font-weight: bold;
		color: #333;
		margin-bottom: 10px;
		text-decoration: none;
		display: -webkit-box;
		-webkit-line-clamp: 2;
		-webkit-box-orient: vertical;
		overflow: hidden;
		line-height: 1.4;
		min-height: 2.8em;
	}
	/* 제목 호버 효과 */
	.card-title:hover { /* 제목에 마우스를 올렸을 때 */
		color: #ffbe33; 
		text-decoration: none;
	}
	/* 카드 메타 정보 (작성자, 조회수) */
	.card-meta { /* <div class="card-meta">에 적용 */
		display: flex;
		justify-content: space-between; /* 양쪽 끝 정렬 */
		align-items: center;
		margin-bottom: 15px;
		font-size: 0.9em;
		color: #666;
	}
	
	.card-author { /* <div class="card-author">에 적용 */
		font-weight: 500;
	}
	
	.card-stats { /* <div class="card-stats">에 적용 */
		display: flex;
		gap: 15px; /* 통계 항목 간 간격 */
	}
	
	.card-stat {
		display: flex;
		align-items: center;
		gap: 3px; /* 아이콘과 텍스트 간 간격 */
	}
	
	.card-progress { /* <div class="card-progress">에 적용 */
		margin-top: auto;  /* 카드 하단에 고정 */
	}
	
	.progress-header { /* <div class="progress-header">에 적용 */
		display: flex;
		justify-content: space-between; /* 진행률과 날짜를 양쪽 끝에 배치 */
		align-items: center;
		margin-bottom: 8px;
	}
	/* 리스트 달성률 폰트 적용 */
	.progress-percentage { /* styling for the percentage span */
		font-weight: bold;
		color: #00c4c4;
		font-size: 1.5em;
	}
	
	.progress-date { /* <span>${dto.reg_date}</span>에 적용 */
		font-size: 0.8em;
		color: #999;  /* 회색 */
	}
	/* 상품이 없을 때 표시되는 영역 */
	.no-products { /* <div class="no-products">에 적용 */
		text-align: center;
		padding: 100px 20px;
		color: #666;
	}
	
	.no-products i { /* .no-products 내부의 아이콘 <i>에 적용 */
		font-size: 4rem;
		color: #ddd; /* 연한 회색 아이콘 */
		margin-bottom: 20px;
	}
	
	.no-products h3 { /* .no-products 내부의 <h3>에 적용 */
		color: #999;
		margin-bottom: 10px;
	}
	
	/* 반응형 디자인 (모바일 대응) */
	@media (max-width: 768px) {
		.card-image-container {
			height: 180px; /* 모바일에서 이미지 높이 축소 */
		}
		
		.card-content {
			padding: 15px; /* 패딩 축소 */
		}
		
		.card-title {
			font-size: 1rem; /* 제목 크기 축소 */
		}
	}
	
	/* 개선된 네비게이션 바 스타일 */
	/* 네비게이션 메뉴 기본 스타일 리셋 */
	.navbar-nav .nav-item .nav-link {
	    color: #333 !important; /* 기본 글자색을 진한 회색으로 */
	    font-weight: 500; /* 중간 굵기 */
	    padding: 10px 20px !important; /* 상하 10px, 좌우 20px 여백 */
	    margin: 0 5px;
	    border-radius: 25px;
	    transition: all 0.3s ease;
	    text-decoration: none !important; /* 밑줄 제거 */
	    border: none !important; /* 테두리 제거 */
	    background: none !important; /* 배경색 제거 */
	    box-shadow: none !important; /* 그림자 제거 */
	}

	/* 호버 효과 */
	.navbar-nav .nav-item .nav-link:hover {
	    color: #ffbe33 !important; /* 호버 시 노란색 */
	    background-color: transparent !important;
	    transform: translateY(-2px); /* 살짝 위로 올라가는 효과 */
	}

	/* active 클래스 스타일 제거 (밑줄 제거) */
	.navbar-nav .nav-item.active .nav-link {
	    color: #333 !important; /* active 상태도 기본 색상 유지 */
	    background-color: transparent !important; /* 배경색 제거 */
	    border-bottom: none !important; /* 밑줄 제거 */
	    box-shadow: none !important; /* 그림자 제거 */
	}

	/* active 상태에서도 호버 효과 적용 */
	.navbar-nav .nav-item.active .nav-link:hover {
	    color: #ffbe33 !important; /* 호버 시 노란색 */
	    transform: translateY(-2px);/* 올라가는 효과 */
	}

	/* 부트스트랩 기본 스타일 오버라이드 */
	.navbar-nav .nav-link:focus,
	.navbar-nav .nav-link:active {
	    outline: none !important; /* 포커스 아웃라인 제거 */
	    box-shadow: none !important; /* 그림자 제거 */
	    border: none !important; /* 테두리 제거 */
	}

	/* 네비게이션 컨테이너 스타일 */
	.navbar {
	    padding-top: 1rem; /* 상단 패딩 */
	    padding-bottom: 1rem; /* 하단 패딩 */
	}

	/* 브랜드 로고 스타일 */
	.navbar-brand {
	    font-size: 1.8rem; /* 로고 크기 */
	    font-weight: bold; /* 굵게 */
	    color: #333 !important; /* 검정색 */
	 
	}

	.navbar-brand:hover {
	    color: #ffbe33 !important; /* 로고 호버 시 노란색 */
	     
	}
	
	/* 로그인/조인 버튼 스타일 유지 */
	.user_option .order_online {
	    background-color: #ffbe33; /* 노란색 배경 */
	    color: white;
	    padding: 10px 20px;
	    border-radius: 25px;
	    text-decoration: none;
	    margin-left: 5px;
	    transition: all 0.3s ease;
	}

	.user_option .order_online:hover {
	    background-color: #e6a82d; /* 호버 시 더 진한 노란색 */
	    transform: translateY(-2px); /* 살짝 위로 올라가는 효과 */
	    text-decoration: none;
	    color: white;
	    
	}
	
	/* 상품 리스트 목록창에 가격 표시 추가 */
	.product-price {
    font-size: 1.2rem; /* 원하는 크기로 조절하세요 (예: 1.2rem, 18px) */
    font-weight: bold; /* 글자를 더 굵게 만듭니다 */
    color: #333; /* 글자색을 진하게 만듭니다 */
}

/* 진행률 영역의 금액 표시 */
.progress-amount {
    text-align: left;
    margin-bottom: 5px;
    font-weight: bold;
}
.progress-amount .product-price:first-child {
    color: #ff0000;  /* 현재 모금액 강조 (빨강) */
}
</style>

<script type="text/javascript">
	function sendIt() {
		var f = document.searchForm;
		f.action = "<%=cp%>/posts_list.do";
		f.submit();
	}
</script>

</head>
<body class="sub_page">

<div class="hero_area">
	<div class="bg-box" style="display: none;">
		<img src="<%=cp %>/resources/images/hero-bg.jpg" alt="">
	</div>
	<header class="header_section" style="background-color: #ffffff; box-shadow: 0 2px 4px rgba(0,0,0,0.1);">
		<div class="container">
			<nav class="navbar navbar-expand-lg custom_nav-container">
				<a class="navbar-brand" href="<%=cp%>/">
					<span style="color: black;">
						Fundee
					</span>
				</a>

				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class=""> </span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav  mx-auto ">
						<li class="nav-item active">
							<a class="nav-link" href="<%=cp%>/">Home </a>
						</li>
						<li class="nav-item active">
							<a class="nav-link" href="<%=cp%>/posts_list.do">PRODUCT <span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item active">
							<a class="nav-link" href="notice.do">NOTICE</a>
						</li>
						<li class="nav-item active">
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
	<div class="container">
		<div class="heading_container heading_center">
			<h2>
				PRODUCT LIST
			</h2>
		</div>

		<div class="search-area">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<form action="" name="searchForm" method="get" class="d-flex align-items-center">
						<select name="searchKey" class="form-select me-2" style="width: 120px;">
							<option value="title">제목</option>
							<option value="userId">관리자</option>
							<option value="content">내용</option>
						</select>
						<input type="text" name="searchValue" class="form-control me-2" placeholder="검색어를 입력하세요" style="flex: 1;"/>
						<button type="button" class="btn me-2" style="background-color: #ffbe33; color: white; border: none; padding: 8px 20px;" onclick="sendIt();">검색</button>
						<c:if test="${sessionScope.loginUser.role == 1}">
							<a href="<%=cp%>/created.do" class="btn" style="background-color: #FF0000; color: white; border: none; padding: 8px 20px;">
								<i class="fa fa-plus me-1"></i>상품 등록
							</a>
						</c:if>
						</a>
					</form>
				</div>
			</div>
		</div>

		<div class="products-grid">
			<c:if test="${empty lists}">
				<div class="no-products">
					<i class="fa fa-inbox"></i>
					<h3>등록된 상품이 없습니다</h3>
					<p>새로운 상품을 등록해보세요!</p>
				</div>
			</c:if>
			
			<!-- varStatus를 사용하여 db에 들어가는 데이터 번호와 별개로 list.jsp창에 상품등록시 순서 정렬함  -->
			<!-- 페이징 처리에서 목록창에 띄울 상품을 9개로 설정하였고, 9개가 넘어가면 다음페이지 넘어가서 등록 시 다시 상품 번호 1로 들어감   -->
			<!-- <div class="col-sm-6 col-lg-3"> -> 한 줄 배열에 12/3= 4개씩 배열  -->
			<c:if test="${not empty lists}">
				<div class="row">
					<c:forEach var="dto" items="${lists}" varStatus="loop">
						<div class="col-sm-6 col-lg-3">
							<div class="product-card">
							<!-- <a href>는 목록창에서 이미지 클릭 시 상세페이지로 넘어가게하며, 속성을 추가해서 카드 디자인을 해치치않고 기능만 추가함   -->
							<a href="<%=cp%>/article.do?posts_num=${dto.posts_num}&pageNum=${pageNum}" style="text-decoration: none; color: inherit;">
								<div class="card-image-container">
									<c:if test="${not empty dto.image_file}">
										<img src="<%=cp%>/resources/uploads/${dto.image_file}" alt="상품 이미지"/>
									</c:if>
									<c:if test="${empty dto.image_file}">
										<img src="<%=cp%>/resources/images/no_image.jpg" alt="이미지 없음"/>
									</c:if>
									
									<div class="card-number">${loop.count}</div>
									
									<c:set var="percentage" value="${(dto.current_amount / dto.goal_amount) * 100}" />
									<c:choose>
										<c:when test="${dto.status eq '모금 완료'}">
											<div class="card-status status-complete">모금완료</div>
										</c:when>
										<c:otherwise>
											<div class="card-status status-progress">${Math.round(percentage)}%</div>
										</c:otherwise>
									</c:choose>
								</div>
								
								<div class="card-content">
									<a href="<%=cp%>/article.do?posts_num=${dto.posts_num}&pageNum=${pageNum}" class="card-title">
										${dto.title}
									</a>
									
									<div class="card-meta">
										<div class="card-author">
											<i class="fa fa-user"></i> ${dto.userId}
										</div>
										<div class="card-stats">
											<div class="card-stat">
												<i class="fa fa-eye"></i> ${dto.hitCount}
											</div>
										</div>
									</div>
									<!-- 리스트에서 상품가격 css강조  -->
									<div class="progress-amount">
									   <span class="product-price" style="color:#ff0000; font-size:1.4rem;">
									      <fmt:formatNumber value="${dto.price}" pattern="#,###" />원
									   </span>
									</div>
									
							<div class="card-progress">
										<div class="progress-header">
											<c:choose>
												<c:when test="${dto.status eq '모금 완료'}">
													<span class="progress-percentage" style="color: #28a745;">✓ 모금완료</span>
												</c:when>
												<c:otherwise>
													<span class="progress-percentage">${Math.round(percentage)}% 달성</span>
												</c:otherwise>
											</c:choose>
											<span class="progress-date">${dto.reg_date}</span>
										</div>
																	
										<div class="progress-bar-container">
											<c:choose>
												<c:when test="${dto.status eq '모금 완료'}">
													<div class="progress-fill" style="width: 100%; background-color: #28a745;"></div>
												</c:when>
												<c:otherwise>
													<div class="progress-fill" style="width: ${percentage > 100 ? 100 : percentage}%;"></div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
		</div>

		<div style="text-align: center; margin-top: 40px;">
			<div style="display: inline-block;">
				${pageIndexList}
			</div>
		</div>

	</div>
</section>
  <!-- footer section -->
  <%@ include file="footer.jsp" %>
  <!-- footer section -->

<script type="text/javascript" src="<%=cp %>/resources/js/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script type="text/javascript" src="<%=cp %>/resources/js/bootstrap.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
<script type="text/javascript" src="<%=cp %>/resources/js/custom.js"></script>

</body>
</html>