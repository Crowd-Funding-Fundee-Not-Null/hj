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
  <title>Fundee login</title>

  <!-- CSS -->
  <link rel="stylesheet" type="text/css" href="<%=cp %>/resources/css/bootstrap.css" />
  <link rel="stylesheet" href="<%=cp %>/resources/css/style.css" />
  <link rel="stylesheet" href="<%=cp %>/resources/css/responsive.css" />

  <style>
    /* 제목 중앙 배치 */
    .heading_container {
      display: flex;
      justify-content: center; 
      align-items: center;     
      margin: 40px 0;
    }

    /* 로그인 박스 모양 */
    #loginPage .form_container {
      max-width: 460px;
      margin: 0 auto;
      border: 1px solid #ddd;
      border-radius: 10px;
      padding: 30px;
      background: #fff;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    #loginPage .field {
      margin-bottom: 16px;
    }

    #loginPage label {
      font-weight: 600;
      margin-bottom: 6px;
      display: block;
    }

    /* 버튼 */
    #loginPage .btn_box button {
      width: 100%;
      height: 45px;
      border: none;
      border-radius: 6px;
      background: #ffd400;
      font-weight: bold;
    }
    #loginPage .btn_box button:hover {
      background: #ffcf00;
    }

    /* 링크 중앙 */
    #loginPage .links {
      text-align: center;
      margin-top: 20px;
    }
    #loginPage .links a {
      margin: 0 8px;
      text-decoration: none;
    }
  </style>
  <script>
  function validateForm(e){
    var idVal = document.getElementById('userId').value.trim();
    var pw  = document.getElementById('userPassword').value.trim();
    var pw2 = document.getElementById('userPasswordCheck').value.trim();

    <% if(request.getAttribute("message") != null) { %>
    <script>
      alert("<%= request.getAttribute("message") %>");
    </script>
  <% } %>
  }
</script>
  
</head>

<body>
  <section id="loginPage" class="book_section layout_padding">
    <div class="container">      
      <div class="heading_container">
      
         <a class="navbar-brand" href="index.do">
            <span style="color:#000;">Feane</span>
          </a>
      </div>

      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="form_container">
          
            <form action="${pageContext.request.contextPath}/login.do" method="post">
              <div class="field">
                <label for="loginId">아이디</label>
                <input id="loginId" name="id" type="text" placeholder="Id" class="form-control" required />
              </div>

              <div class="field">
                <label for="loginPw">비밀번호</label>
                <input id="loginPw" name="password" type="password" placeholder="Pw" class="form-control" required />
              </div>

			  <c:if test="${not empty message}">
			    <div class="alert alert-warning" style="margin:10px 0;">
			      ${fn:escapeXml(message)}
			    </div>
			  </c:if>

              <div class="btn_box">
                <button type="submit">login</button>
              </div>
              
              <div class="links">
                <a href="${pageContext.request.contextPath}/join">회원가입</a> | 
                <a href="${pageContext.request.contextPath}/find_id">아이디 찾기</a> | 
                <a href="${pageContext.request.contextPath}/find_pwd">비밀번호 찾기</a>
              </div>
            </form>
          </div>
        </div>
      </div>

    </div>
  </section>
</body>
</html>