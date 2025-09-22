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
    .progress-bar-container {
        width: 100%;
        height: 6px;
        background-color: #e9ecef;
        border-radius: 3px;
        margin-top: 8px;
        overflow: hidden;
    }
    .progress-fill {
        height: 100%;
        background-color: #ffbe33;
        border-radius: 3px;
        transition: width 0.4s ease-in-out;
    }
    .progress-text {
        font-size: 0.8em;
        color: #666;
        margin-top: 5px;
        text-align: center;
    }
    
    /* 검색 영역 스타일 */
    .search-area {
        background-color: rgba(255, 255, 255, 0.9);
        padding: 20px;
        border-radius: 10px;
        margin-bottom: 30px;
    }
    
    /* 카드 레이아웃 스타일 */
    .products-grid {
        margin-top: 30px;
    }
    
    .product-card {
        background-color: #fff;
        border-radius: 15px;
        overflow: hidden;
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        transition: all 0.3s ease;
        margin-bottom: 30px;
        height: 100%;
        position: relative;
    }
    
    .product-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 35px rgba(0,0,0,0.15);
    }
    
    .card-image-container {
        position: relative;
        height: 220px;
        overflow: hidden;
    }
    
    .card-image-container img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.3s ease;
    }
    
    .product-card:hover .card-image-container img {
        transform: scale(1.05);
    }
    
    .card-number {
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
    
    .card-status {
        position: absolute;
        top: 15px;
        right: 15px;
        padding: 5px 10px;
        border-radius: 15px;
        font-size: 0.8em;
        font-weight: bold;
        color: white;
    }
    
    .status-complete {
        background-color: #28a745;
    }
    
    .status-progress {
        background-color: #ffbe33;
    }
    
    .card-content {
        padding: 20px;
        display: flex;
        flex-direction: column;
        height: calc(100% - 220px);
    }
    
    .card-title {
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
    
    .card-title:hover {
        color: #ffbe33;
        text-decoration: none;
    }
    
    .card-meta {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 15px;
        font-size: 0.9em;
        color: #666;
    }
    
    .card-author {
        font-weight: 500;
    }
    
    .card-stats {
        display: flex;
        gap: 15px;
    }
    
    .card-stat {
        display: flex;
        align-items: center;
        gap: 3px;
    }
    
    .card-progress {
        margin-top: auto;
    }
    
    .progress-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 8px;
    }
    
    .progress-percentage {
        font-weight: bold;
        color: #ffbe33;
    }
    
    .progress-date {
        font-size: 0.8em;
        color: #999;
    }
    
    .no-products {
        text-align: center;
        padding: 100px 20px;
        color: #666;
    }
    
    .no-products i {
        font-size: 4rem;
        color: #ddd;
        margin-bottom: 20px;
    }
    
    .no-products h3 {
        color: #999;
        margin-bottom: 10px;
    }
    
    /* 반응형 디자인 */
    @media (max-width: 768px) {
        .card-image-container {
            height: 180px;
        }
        
        .card-content {
            padding: 15px;
        }
        
        .card-title {
            font-size: 1rem;
        }
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
    <div class="bg-box">
      <img src="<%=cp %>/resources/images/hero-bg.jpg" alt="">
    </div>
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="<%=cp%>/">
            <span>
              Fundee
            </span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav  mx-auto ">
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
              <li class="nav-item">
                <a class="nav-link" href="loginForm.do">LOGIN</a>
              </li>
            </ul>
            <div class="user_option">
              <a href="" class="user_link">
                <i class="fa fa-user" aria-hidden="true"></i>
              </a>
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
              <!-- Order Online 버튼 -->
              <a href="<%=cp%>/created.do" class="order_online">Order Online</a>
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
                <option value="userId">작성자</option>
                <option value="content">내용</option>
              </select>
              <input type="text" name="searchValue" class="form-control me-2" placeholder="검색어를 입력하세요" style="flex: 1;"/>
              <button type="button" class="btn me-2" style="background-color: #ffbe33; color: white; border: none; padding: 8px 20px;" onclick="sendIt();">검색</button>
              <a href="<%=cp%>/created.do" class="btn" style="background-color: #28a745; color: white; border: none; padding: 8px 20px;">
                <i class="fa fa-plus me-1"></i>글올리기
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
        
        <c:if test="${not empty lists}">
          <div class="row">
            <c:forEach var="dto" items="${lists}" varStatus="loop">
              <div class="col-sm-6 col-lg-4">
                <div class="product-card">
                  <div class="card-image-container">
                    <c:if test="${not empty dto.imageFile}">
                      <img src="<%=cp%>/resources/uploads/${dto.imageFile}" alt="상품 이미지"/>
                    </c:if>
                    <c:if test="${empty dto.imageFile}">
                      <img src="<%=cp%>/resources/images/no_image.jpg" alt="이미지 없음"/>
                    </c:if>
                    
                    <div class="card-number">${loop.count}</div>
                    
                    <c:set var="percentage" value="${(dto.currentAmount / dto.goalAmount) * 100}" />
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
                    <a href="<%=cp%>/article.do?postsNum=${dto.postsNum}&pageNum=${pageNum}" class="card-title">
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
                        <span class="progress-date">${dto.regDate}</span>
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
                      
                      <div class="progress-text">
                        <fmt:formatNumber value="${dto.currentAmount}" pattern="#,###" />원 / 
                        <fmt:formatNumber value="${dto.goalAmount}" pattern="#,###" />원
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
  <footer class="footer_section">
    <div class="container">
      <div class="row">
        <div class="col-md-4 footer-col">
          <div class="footer_contact">
            <h4>Contact Us</h4>
            <div class="contact_link_box">
              <a href="">
                <i class="fa fa-map-marker" aria-hidden="true"></i>
                <span>Location</span>
              </a>
              <a href="">
                <i class="fa fa-phone" aria-hidden="true"></i>
                <span>Call +01 1234567890</span>
              </a>
              <a href="">
                <i class="fa fa-envelope" aria-hidden="true"></i>
                <span>fundee@notnull.kr</span>
              </a>
            </div>
          </div>
        </div>
        <div class="col-md-4 footer-col">
          <div class="footer_detail">
            <a href="" class="footer-logo">Fundee</a>
            <p>Fundee는 총계값(크라우드소셜커뮤니티 및 통신판매중개)를 영위하는 총정적 제공자로 자금을 모집하는 당사자가 아닙니다. 따라서 투자손실의 위험을 포함하거나 상품 제공을 보장해 드리지 않으며 이에 대한 법적인 책임을 지지 않습니다. 신뢰도, 상품정보, 거래에 관한 의무와 책임은 판매자에게 있으므로, 각 상품 페이지에서 구체적인 내용을 확인하시기 바랍니다.</p>
            <div class="footer_social">
              <a href=""><i class="fa fa-facebook" aria-hidden="true"></i></a>
              <a href=""><i class="fa fa-twitter" aria-hidden="true"></i></a>
              <a href=""><i class="fa fa-instagram" aria-hidden="true"></i></a>
            </div>
          </div>
        </div>
        <div class="col-md-4 footer-col">
          <div style="margin-bottom: 20px;">
            <a href="" style="margin-right: 15px; color: #666;">홈으로</a>
            <a href="" style="margin-right: 15px; color: #666;">공지사항</a>
            <a href="" style="margin-right: 15px; color: #666;">회사소개</a>
            <a href="" style="color: #666;">고객센터</a>
          </div>
          <div style="font-size: 14px; color: #888; margin-bottom: 10px;">
            Fundee | 대표자 : 박지원, 장혜원, 장소영, 김효은 | 경기 수원시 팔달구 중부대로 104 통일빌딩신관 4층 | 이메일 : fundee@notnull.kr
          </div>
          <div style="font-size: 12px; color: #aaa;">
            © 2025. Fundee. All rights reserved.
          </div>
        </div>
      </div>
    </div>
  </footer>
  <script src="<%=cp %>/resources/js/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <script src="<%=cp %>/resources/js/bootstrap.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
  <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
  <script src="<%=cp %>/resources/js/custom.js"></script>

</body>
</html>