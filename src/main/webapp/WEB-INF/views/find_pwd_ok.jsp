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
  <title>비밀번호 찾기 결과</title>

  <!-- 공용 CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css" />

  <!-- find_id_ok.jsp와 동일한 카드 스타일 -->
  <style>
    .result_wrap { 
    max-width: 640px; 
    margin: 80px auto; 
    padding: 0 16px; 
    }
    .result_card {
      border: 1px solid #e5e7eb; 
      border-radius: 12px; 
      background: #fff;
      padding: 24px 24px 16px; 
      box-shadow: 0 6px 20px rgba(0,0,0,.06);
    }
    .result_title { 
    font-weight: 700; 
    font-size: 18px; 
    margin: 0 0 16px; 
    }
    .result_body p { 
    margin: 0 0 8px; 
    color: #111827; 
    line-height: 1.6;
     
    }
    .result_body .strong { 
    display: block; 
    font-weight: 800; 
    font-size: 20px; 
    margin: 8px 0; 
    }
    .result_links { 
    margin-top: 12px; 
    text-align: center; 
    }
    .result_links a { 
    color: #6b21a8; 
    text-decoration: 
    none; margin: 0 10px; 
    }
    .result_links a:hover { 
    text-decoration: underline; 
    }
  </style>
</head>

<body>
  <div class="result_wrap">
    <div class="result_card">
      <h3 class="result_title">비밀번호 찾기 결과</h3>

      <div class="result_body">
        <c:choose>
          <c:when test="${not empty foundPwd}">
            <p>회원님의 비밀번호는</p>
            <span class="strong">${fn:escapeXml(foundPwd)}</span>
            <p>입니다.</p>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${not empty message}">
                <p style="color:#b91c1c;">${fn:escapeXml(message)}</p>
              </c:when>
              <c:otherwise>
                <p style="color:#b91c1c;">일치하는 정보가 없습니다.</p>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>
      </div>

      <div class="result_links">
		<a href="${pageContext.request.contextPath}/find_pwd">다시 입력하기</a>
        <a href="${pageContext.request.contextPath}/loginForm.">로그인</a>
      </div>
    </div>
  </div>
</body>
</html>