1. posts_article 에서
<c:choose> 
<c:when test="${not empty sessionScope.loginId }">
	<a href="<%=cp%>/buyForm.do?posts_num=${dto.posts_num}" class="btn-fund">펀딩하기</a>
</c:when>

<c:otherwise>
	<a href="<%=cp%>/loginForm.do?redirect_url=<%= request.getRequestURI() %>?posts_num=${dto.posts_num}" class="btn-fund">펀딩하기</a>
</c:otherwise>
</c:choose> 이 코딩안에 <!-- 주석을 넣어서 디버깅 발생.
<%-- 이 주석을 써야함.

2. 상페에서 펀딩하기 눌렀을때 미로그인 상태면 로그인페이지로 돌아가서 로그인 후 메인페이지로 이동
로그인 후에는 결제하기 페이지로 이동되어야함.

3. 상페-> 로그인  -> 결제페이지로 이동 메소드 제작 필요(지원):로그인 컨트롤러에서 제작해야함.

4. 결제 완료 페이지에서 주문번호를 가지고 못옴 ->시퀀스 주문번호를
인서트 하기전에 찾은후 넣어서 가져옴.
시퀀스보다 맥스넘이 더 코딩은 간결함 -> 추가 스터디 필요

5. 테이블변경이 필요한경우 전체 오류발생가능성있음.
이를 보완하기 위해서는 세컨 테이블을 만들어서 실행 한후 
유포하는것이 좋을것같음
단점 -> 세컨테이블을 만들경우 추가 개발이 필요한데
개발자의 시간이 더 발생할수 있음.

6.  ORA-00911: invalid character
xml 에서는 세미콜론을 안써도되는데, 세미콜론이 들어가면
이와같은 오류가 발생할수도 있다.


7. html 은 폰트칼라, css는 칼라로 글자색이 변경 가능함.