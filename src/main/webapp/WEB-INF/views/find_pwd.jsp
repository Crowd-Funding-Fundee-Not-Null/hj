<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>비밀번호 찾기</title>

  <!-- 공용 CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css" />

  <!-- 회원가입/아이디찾기 스타일 통일 -->
  <style>
    .heading_container {
      display: flex;
      justify-content: center;
      align-items: center;
      margin: 32px 0 24px;
    }
    #loginPage .form_container {
      max-width: 640px;
      margin: 0 auto;
      border: 1px solid #ddd;
      border-radius: 12px;
      padding: 28px;
      background: #fff;
      box-shadow: 0 6px 20px rgba(0,0,0,.08);
    }
    #loginPage .field { margin-bottom: 16px; }
    #loginPage label { display:block; font-weight:600; margin-bottom:8px; }
    #loginPage .form-control { height:46px; font-size:16px; }
    #loginPage .btn-primary {
      width:100%; height:48px; border:0; border-radius:10px;
      background:#ffd400; font-weight:700; letter-spacing:.2px;
      transition: transform .05s ease, box-shadow .2s ease, background .2s ease;
    }
    #loginPage .btn-primary:hover {
      background:#ffcf00; box-shadow:0 6px 16px rgba(0,0,0,.08); transform:translateY(-1px);
    }
    #loginPage .links { text-align:center; margin-top:18px; }
    #loginPage .links a { margin:0 8px; text-decoration:none; }
  </style>

  <!-- 서버 메시지(alert) -->
  <c:if test="${not empty message}">
    <script>
      alert("${fn:escapeXml(message)}");
    </script>
  </c:if>
</head>

<body>
<section id="loginPage" class="book_section layout_padding">
  <div class="container">
    <!-- 제목 -->
    <div class="heading_container">
      <a class="navbar-brand" href="<%=cp%>/index.do">
        <span style="color:#000;">Feane</span>
      </a>
    </div>

    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="form_container">

          <h3 style="font-weight:700; font-size:18px; margin-bottom:16px;">비밀번호 찾기</h3>

          <form method="post" action="${pageContext.request.contextPath}/find_pwd.do">
            <div class="field">
              <label for="id">아이디</label>
              <input type="text" class="form-control" id="id" name="id" placeholder="id" required>
            </div>
            <div class="field">
              <label for="email">이메일</label>
              <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" autocomplete="email" required />
              <small style="color:#6b7280; display:block; margin-top:6px;">가입 시 사용한 이메일을 입력하세요.</small>
            </div>
            <button type="submit" class="btn btn-primary">비밀번호 찾기</button>
          </form>

          

        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>