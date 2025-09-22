<%@ page contentType="text/html; charset=UTF-8"%>
<%	
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>로그인</title>
  <meta name="color-scheme" content="light dark" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
  <style>
    :root{
      --bg:#000000;            /* 전체 배경 검정 */
      --card:#121212;          /* 카드 배경 */
      --muted:#a0a0a0;         /* 보조 텍스트 */
      --text:#f5f5f5;          /* 본문 텍스트 */
      --primary:#ffd600;       /* 노란색 포인트 */
      --primary-strong:#ffb400;/* hover 진한 노란색 */
      --ring: 0 0 0 3px rgba(255,214,0,.35);
      --radius: 16px;
      --shadow: 0 15px 40px rgba(0,0,0,.5), 0 2px 10px rgba(0,0,0,.3);
      --gap: 18px;
    }
    *{box-sizing:border-box}
    html,body{height:100%}
    body{margin:0; background:var(--bg); color:var(--text); font-family:"Noto Sans KR", system-ui, -apple-system, Segoe UI, Roboto, "Apple SD Gothic Neo", sans-serif; display:grid; place-items:center; padding:24px}
    .sr-only{position:absolute; width:1px; height:1px; padding:0; margin:-1px; overflow:hidden; clip:rect(0,0,0,0); white-space:nowrap; border:0}

    .wrap{width:min(460px,100%)}
    .login-card{background:var(--card); border-radius:var(--radius); padding:28px; box-shadow:var(--shadow); border:1px solid rgba(255,255,255,.06)}
    .logo{display:flex; align-items:center; gap:10px; font-weight:700}
    .dot{width:12px; height:12px; border-radius:50%; background:var(--primary); box-shadow:0 0 0 8px rgba(255,214,0,.3)}
    h1{margin:14px 0 8px; font-size:24px}
    .desc{margin:0 0 20px; color:var(--muted)}

    .field{position:relative; margin-bottom:var(--gap)}
    label{display:block; font-weight:600; margin-bottom:8px}
    input[type="text"], input[type="password"]{width:100%; height:52px; border-radius:14px; border:1px solid rgba(255,255,255,.1); background:#1a1a1a; color:var(--text); padding:0 14px 0 44px; outline:none; font-size:16px; transition:border .15s ease, box-shadow .15s ease}
    input:focus{border-color:var(--primary); box-shadow:var(--ring)}
    .icon{position:absolute; left:12px; top:50%; transform:translateY(-50%); opacity:.7; color:var(--primary)}

    .btn{display:inline-flex; align-items:center; justify-content:center; gap:10px; height:50px; padding:0 16px; border-radius:12px; border:none; cursor:pointer; font-weight:700; width:100%}
    .btn-primary{background:linear-gradient(180deg, var(--primary), var(--primary-strong)); color:#222}
    .btn-primary:hover{filter:brightness(1.05)}
    .btn-primary:focus{box-shadow:var(--ring)}

    .links{display:flex; justify-content:center; gap:4px; flex-wrap:wrap; font-size:14px; margin-top:14px}
    .links a{color:var(--primary); text-decoration:none}
    .links a:hover{text-decoration:underline}

    footer{margin-top:16px; color:var(--muted); font-size:12px; text-align:center}

    @media (max-width:420px){ .login-card{padding:22px} }
  </style>
</head>
<body>
  <main class="wrap">
    <section class="login-card" aria-label="로그인">
      
      <h1>로그인</h1>
      <p class="desc">아이디와 비밀번호를 입력해 주세요.</p>
      
      <br/><br/>

      <form method="post" action="/member/login">
        <div class="field">
          <label for="loginId">아이디</label>          
          <input id="loginId" name="id" type="text" placeholder="아이디를 입력하세요" autocomplete="username" required />
        </div>

        <div class="field">
          <label for="loginPw">비밀번호</label>          
          <input id="loginPw" name="password" type="password" placeholder="비밀번호" autocomplete="current-password" required />
        </div>

        <button class="btn btn-primary" type="submit">로그인</button>

        <div class="links">
          <a href="/member/join">회원가입</a> |         
          <a href="/member/find-id">아이디 찾기</a>  |        
          <a href="/member/find-password">비밀번호 찾기</a>
        </div>
      </form>

      <footer>Fundee Project</footer>
    </section>
  </main>
</body>
</html>
