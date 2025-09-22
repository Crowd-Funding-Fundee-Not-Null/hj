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
<title>상품 상세보기</title>

  <link rel="stylesheet" type="text/css" href="<%=cp %>/resources/css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <link href="<%=cp %>/resources/css/font-awesome.min.css" rel="stylesheet" />
  <link href="<%=cp %>/resources/css/style.css" rel="stylesheet" />
  <link href="<%=cp %>/resources/css/responsive.css" rel="stylesheet" />

<style>
body {
    font-family: Arial, sans-serif;
    color: #333;
    background-color: #f9f9f9;
}

.product-container {
    display: flex;
    justify-content: center;
    padding: 40px 20px;
    gap: 40px;
    max-width: 1200px;
    margin: 0 auto;
    background-color: #fff;
    border-radius: 15px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.1);
}

.product-image-section {
    width: 60%;
    text-align: center;
}

.product-image-section img {
    max-width: 100%;
    height: auto;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.product-info-section {
    width: 40%;
    display: flex;
    flex-direction: column;
}

.product-info-section .meta {
    font-size: 14px;
    color: #777;
    margin-bottom: 20px;
    padding: 10px;
    background-color: #f8f9fa;
    border-radius: 8px;
}

.product-info-section h3 {
    font-size: 28px;
    font-weight: bold;
    color: #222;
    margin: 0 0 20px 0;
    line-height: 1.3;
}

.info-meta {
    margin-bottom: 25px;
}

.info-meta p {
    margin: 8px 0;
    font-size: 16px;
    display: flex;
    justify-content: space-between;
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

/* 진행률 바 스타일 */
.progress-bar-container {
    width: 100%;
    height: 8px;
    background-color: #e9ecef;
    border-radius: 4px;
    margin-top: 8px;
    overflow: hidden;
}
.progress-fill {
    height: 100%;
    background-color: #ffbe33;
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

.funding-status {
    margin: 20px 0;
    padding: 20px;
    background-color: #f8f9fa;
    border-radius: 10px;
    border-left: 4px solid #ffbe33;
}

.funding-status .status-header {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 15px;
}

.funding-actions {
    margin-top: 30px;
    display: flex;
    flex-direction: column;
    gap: 15px;
}

.funding-actions .btn-fund {
    padding: 15px 20px;
    font-size: 18px;
    font-weight: bold;
    color: #fff;
    background-color: #ffbe33;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    text-align: center;
    transition: all 0.3s ease;
}

.funding-actions .btn-fund:hover {
    background-color: #e6a82e;
    transform: translateY(-2px);
}

.actions {
    display: flex;
    gap: 10px;
}

.funding-actions .btn-edit, .btn-delete, .btn-list {
    flex: 1;
    padding: 12px;
    font-size: 14px;
    color: #555;
    background-color: #f8f9fa;
    border: 1px solid #ddd;
    border-radius: 6px;
    cursor: pointer;
    transition: all 0.2s ease;
}

.funding-actions .btn-edit:hover {
    background-color: #28a745;
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

.content-section {
    background-color: #fff;
    padding: 40px;
    border-radius: 15px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.1);
    margin: 30px auto;
    max-width: 1200px;
}

.content-section h4 {
    font-size: 24px;
    margin-bottom: 20px;
    color: #333;
    border-bottom: 2px solid #ffbe33;
    padding-bottom: 10px;
}

.content-section p {
    line-height: 1.8;
    font-size: 16px;
    color: #555;
    white-space: pre-wrap;
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
    <div class="container-fluid">
      <div class="product-container">
        <div class="product-image-section">
            <c:choose>
                <c:when test="${not empty dto.imageFile}">
                    <img src="<%=cp%>/resources/uploads/${dto.imageFile}" alt="상품 대표 이미지">
                </c:when>
                <c:otherwise>
                    <img src="<%=cp%>/resources/images/no_image.jpg" alt="이미지 없음">
                </c:otherwise>
            </c:choose>
        </div>

        <div class="product-info-section">
            <div class="meta">생활가전 &gt; 인테리어</div>
            
            <h3>${dto.title}</h3>
            <div class="info-meta">
                <p><strong>작성자:</strong> <span>${dto.userId}</span></p>
                <p><strong>등록일:</strong> <span>${dto.regDate}</span></p>
                <p><strong>조회수:</strong> <span>${dto.hitCount}</span></p>
                <p><strong>판매 시작일:</strong> <span>${dto.startDate}</span></p>
                <p><strong>판매 종료일:</strong> <span>${dto.endDate}</span></p>
            </div>
            
            <div class="funding-status">
                <c:set var="percentage" value="${(dto.currentAmount / dto.goalAmount) * 100}" />
                <c:choose>
                    <c:when test="${dto.status eq '모금 완료'}">
                        <div class="status-header" style="color: #28a745;">
                            ✓ 모금완료 (100%)
                        </div>
                        <div class="progress-bar-container">
                            <div class="progress-fill" style="width: 100%; background-color: #28a745;"></div>
                        </div>
                        <div class="progress-text">
                            <fmt:formatNumber value="${dto.currentAmount}" pattern="#,###" />원 / <fmt:formatNumber value="${dto.goalAmount}" pattern="#,###" />원
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="status-header" style="color: #ffbe33;">
                            <c:out value="${Math.round(percentage)}"/>% 달성
                        </div>
                        <div class="progress-bar-container">
                            <div class="progress-fill" style="width: ${percentage > 100 ? 100 : percentage}%;"></div>
                        </div>
                        <div class="progress-text">
                            <fmt:formatNumber value="${dto.currentAmount}" pattern="#,###" />원 / <fmt:formatNumber value="${dto.goalAmount}" pattern="#,###" />원
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <div class="funding-actions">
                <button class="btn-fund">펀딩하기</button>
                <div class="actions">
                    <button class="btn-edit" onclick="location.href='<%=cp%>/updated.do?postsNum=${dto.postsNum}'">수정</button>
                    <button class="btn-delete" onclick="deleteConfirm('<%=cp%>/deleted.do?postsNum=${dto.postsNum}')">삭제</button>
                    <button class="btn-list" onclick="location.href='<%=cp%>/posts_list.do'">목록</button>
                </div>
            </div>
        </div>
      </div>
    </div>
  </section>
    
  <section class="layout_padding" style="background-color: #f9f9f9;">
    <div class="container">
      <div class="content-section">
          <h4>상품 상세 설명</h4>
          <p>${dto.content}</p>
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