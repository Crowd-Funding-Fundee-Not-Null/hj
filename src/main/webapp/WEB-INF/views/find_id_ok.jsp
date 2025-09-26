<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String cp = request.getContextPath();
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기 결과</title>
<style>
  .wrap{
  max-width:480px;
  margin:60px auto;
  padding:20px;
  border:1px solid #ddd;
  border-radius:8px
  }
  .id{
  font-size:20px;
  font-weight:bold;
  margin:10px 0
  }
  .links{
  text-align:center;
  margin-top:16px
  }
  .links a{
  margin:0 8px;
  text-decoration:none
  }
</style>
</head>
<body>

<div class="wrap">
  <h3>아이디 찾기 결과</h3>

  <c:choose>
    <c:when test="${not empty foundId}">
      <div>회원님의 아이디는</div>
      <div class="id">${foundId}입니다.</div>
     
    </c:when>
    <c:otherwise>
      <div>일치하는 계정을 찾지 못했습니다.</div>
    </c:otherwise>
  </c:choose>

  <div class="links">
    <a href="${pageContext.request.contextPath}/find_id">다시 입력하기</a>
    <a href="${pageContext.request.contextPath}/find_pwd">비밀번호 찾기</a>
    <a href="${pageContext.request.contextPath}/loginForm">로그인</a>
  </div>
</div>

</body>
</html>