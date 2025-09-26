<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품(프로젝트) 수정</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/resources/css/bootstrap.css" />
<link href="<%=cp %>/resources/css/font-awesome.min.css" rel="stylesheet" />
<style>

	/* 전체 페이지 기본 스타일 */
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f0f2f5; 
        color: #333; 
    }
    
    /*  폼 컨테이너 레이아웃 스타일 */
    .form-wrapper { /* <div class="form-wrapper">에 적용. 폼 컨테이너를 감싸는 가장 바깥쪽 영역 */
        display: flex; 
        justify-content: center; /* 중앙 정렬 */
        padding: 40px 0; /* 상하 여백 40px */
    }
    .form-container { /* <div class="form-container">에 적용. 실제 폼 내용이 들어가는 흰색 박스 */
        width: 100%;
        max-width: 800px; 
        background-color: #fff; 
        padding: 40px;
        border-radius: 10px; 
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
    }
    .form-container h2 { /* <h2>상품 수정 페이지</h2> 제목에 적용 */
        font-size: 28px; 
        color: #2c3e50; 
        margin-bottom: 30px; 
        text-align: center; 
    }
    
      /*   폼 섹션 구분 스타일 */
    .form-section { /* <div class="form-section">에 적용. 입력 필드 그룹을 묶어 시각적으로 구분 */
        border-bottom: 1px solid #eee; /* 섹션 아래에 얇은 구분선 추가 */
        padding-bottom: /* 선과 내용 사이의 아래쪽 여백 */
        margin-bottom: 25px; /* 다음 섹션과의 간격 */
    }
    .form-section:last-child { /* 마지막 .form-section에만 적용 */
        border-bottom: none; /* 마지막 섹션은 구분선 없음 */
        margin-bottom: 0;
        padding-bottom: 0;
    }
    
     /*    폼 입력 필드 스타일 */
    .form-group {  /* <div class="form-group">에 적용. 라벨과 입력 필드를 묶음 */
        margin-bottom: 20px; /* 입력 그룹 간격 */
    }
    .form-group label {
        display: block;
        font-weight: bold; 
        margin-bottom: 8px; /* 라벨과 입력칸 간격 */
        color: #555; 
    }
    .form-group input[type="text"], /* 텍스트 입력 필드에 적용 */
    .form-group input[type="file"],
    .form-group textarea {
        width: 100%; /* 전체 너비 */
        padding: 12px; /* 내부 여백 */
        border: 1px solid #ddd; /* 테두리 */
        border-radius: 6px;
        font-size: 14px;
        transition: border-color 0.3s;
        box-sizing: border-box; /* 패딩과 테두리를 너비에 포함시켜 레이아웃 깨짐 방지 */
    }
    
     /* 입력 필드 포커스 효과 */
    .form-group input[type="text"]:focus,
    .form-group input[type="file"]:focus,
    .form-group textarea:focus {
        border-color: #00796b; /* 필드에 커서가 있을 때 테두리 색상 변경 */
        outline: none;/* 기본 아웃라인 제거 */
    }
    
    /* 현재 파일 표시 스타일 */
    .current-file { /* <div>현재 파일: ...</div>에 적용. 현재 업로드된 파일명을 표시 */
        font-size: 12px;
        color: #666;
        margin-bottom: 8px;
        padding: 8px;
        background-color: #f8f9fa;
        border-radius: 4px;
        border-left: 3px solid #00796b;  /* 왼쪽에 강조선 추가 */
    }
    
    .file-help-text { /* <div>새 파일을 선택하지 않으면 ...</div>에 적용. 파일 업로드 안내 메시지 */
        font-size: 12px;
        color: #666;
        margin-top: 5px;
        font-style: italic;
    }
    
      /*  버튼 그룹 스타일 */
    .button-group { /* <div class="button-group">에 적용. 버튼들을 담는 컨테이너 */
        text-align: center; /* 버튼들 중앙 정렬 */
        margin-top: 30px; /* 위쪽 여백 */
    }
    
    /* 기본 버튼 스타일 */
    .btn { /* 모든 버튼에 공통적으로 적용 */
        padding: 12px 25px; /* 버튼 내부 여백 */
        border: none;  /* 테두리 제거 */
        border-radius: 6px;
        cursor: pointer; 
        font-size: 16px; 
        font-weight: bold; 
        transition: background-color 0.3s, transform 0.2s; 
        margin: 0 5px; /* 버튼 간격 */
    }
    
    /* 수정하기 버튼 (주요 액션) */
    .btn-submit {
        background-color: #00796b; 
        color: #fff; 
    }
    .btn-submit:hover {
        background-color: #004d40; 
        transform: translateY(-2px); 
    }
    
     /* 취소 버튼 (위험한 액션) */
    .btn-cancel {
        background-color: #ff5252; 
        color: #fff; 
    }
    .btn-cancel:hover {
        background-color: #d14141; 
        transform: translateY(-2px); 
    }
    
    /* 접근 권한 없음 메시지 스타일 */
    .access-denied { /* <div class="access-denied">에 적용. 권한이 없을 때 표시되는 메시지 컨테이너 */
        text-align: center; 
        padding-top: 50px; /* 위쪽 여백 */
    }
    .access-denied h2 { /* <h2>접근 권한이 없습니다.</h2> 제목에 적용 */
        color: #d32f2f;  /* 빨간색 (경고 색상) */
    }
    .access-denied a { /* "상품 목록으로 돌아가기" 링크에 적용 */
        color: #00796b; 
        text-decoration: none; /* 밑줄 제거 */
    }
</style>

<script type="text/javascript">

	function sendIt(){
		
		f = document.myForm;
		
		// 제목 검증
		str = f.title.value;
		str = str.trim();
		if(!str){
			alert("\n상품제목을 입력하세요.");
			f.title.focus();
			return;
		}
		f.title.value = str;
		
		// 내용 검증
		str = f.content.value;
		str = str.trim();
		if(!str){
			alert("\n상품내용을 입력하세요.");
			f.content.focus();
			return;
		}
		f.content.value = str;
		
		// 가격 검증
		str = f.price.value;
		str = str.trim();
		if(!str){
			alert("\n상품가격을 입력하세요.");
			f.price.focus();
			return;
		}
		if(isNaN(str) || parseInt(str) < 0){
			alert("\n올바른 가격을 입력하세요.");
			f.price.focus();
			return;
		}
		f.price.value = str;
		
		// 시작일 검증
		str = f.start_date.value;
		str = str.trim();
		if(!str){
			alert("\n판매 시작일을 입력하세요.");
			f.start_date.focus();
			return;
		}
		if(!isValidDate(str)){
			alert("\n올바른 날짜 형식(YYYY-MM-DD)으로 입력하세요.");
			f.start_date.focus();
			return;
		}
		f.start_date.value = str;
		
		// 종료일 검증
		str = f.end_date.value;
		str = str.trim();
		if(!str){
			alert("\n판매 종료일을 입력하세요.");
			f.end_date.focus();
			return;
		}
		if(!isValidDate(str)){
			alert("\n올바른 날짜 형식(YYYY-MM-DD)으로 입력하세요.");
			f.end_date.focus();
			return;
		}
		f.end_date.value = str;
		
		// 날짜 순서 검증
		if(new Date(f.start_date.value) >= new Date(f.end_date.value)){
			alert("\n종료일은 시작일보다 늦어야 합니다.");
			f.end_date.focus();
			return;
		}
		
		// 목표금액 검증
		str = f.goal_amount.value;
		str = str.trim();
		if(!str){
			alert("\n목표 금액을 입력하세요.");
			f.goal_amount.focus();
			return;
		}
		if(isNaN(str) || parseInt(str) <= 0){
			alert("\n올바른 목표 금액을 입력하세요.");
			f.goal_amount.focus();
			return;
		}
		f.goal_amount.value = str;
		
		// 현재 모금액 검증
		str = f.current_amount.value;
		str = str.trim();
		if(!str){
			f.current_amount.value = "0";
		} else {
			if(isNaN(str) || parseInt(str) < 0){
				alert("\n올바른 현재 모금액을 입력하세요.");
				f.current_amount.focus();
				return;
			}
			f.current_amount.value = str;
		}
	
		f.action = "<%=cp%>/updated_ok.do";
		f.submit();		
	}
	
	// 날짜 형식 검증 함수
	function isValidDate(dateString) { //YYYY-MM-DD 와 같은 형식이 아니면 FALSE를 반환
		var regex = /^\d{4}-\d{2}-\d{2}$/;
		if (!regex.test(dateString)) return false;
		
		var date = new Date(dateString);
		var timestamp = date.getTime();
		//2024-12-48과 같은 형식은 맞지안 존재하지 않는 날짜 체킹
		if (typeof timestamp !== 'number' || Number.isNaN(timestamp)) { 
			return false;
		}
		//마지막으로 변환된 날짜 재확인하는 코딩
		return dateString === date.toISOString().split('T')[0];
	}
	
</script>

</head>
<body>
<c:if test="${sessionScope.loginUser.role == 1}">
    <div class="form-wrapper">
        <div class="form-container">
            <h2>상품 수정 페이지</h2>
            <form action="<%=cp%>/updated_ok.do" name="myForm" method="post" enctype="multipart/form-data">
                <input type="hidden" name="posts_num" value="${dto.posts_num}"/>

                <div class="form-section">
                    <div class="form-group">
                        <label for="title">상품 제목</label>
                        <input type="text" id="title" name="title" value="${dto.title}" maxlength="100" />
                    </div>
                    <div class="form-group">
                        <label for="userId">작성자</label>
                        <input type="text" id="userId" name="userId" value="${dto.userId}" maxlength="20" />
                    </div>
                </div>

                <div class="form-section">
                    <div class="form-group">
                        <label for="upload">목록 이미지</label>
                        <c:if test="${not empty dto.image_file}">
                            <div class="current-file">현재 파일: ${dto.image_file}</div>
                        </c:if>
                        <input type="file" id="upload" name="upload" accept="image/*" />
                        <div class="file-help-text">새 파일을 선택하지 않으면 기존 파일이 유지됩니다.</div>
                    </div>
                    <div class="form-group">
                        <label for="detail_upload">상세 이미지</label>
                        <c:if test="${not empty dto.detail_imagefile}">
                            <div class="current-file">현재 상세 파일: ${dto.detail_imagefile}</div>
                        </c:if>
                        <input type="file" id="detail_upload" name="detail_upload" accept="image/*" />
                        <div class="file-help-text">새 파일을 선택하지 않으면 기존 파일이 유지됩니다.</div>
                    </div>
                </div>

                <div class="form-section">
                    <div class="form-group">
                        <label for="content">상품 내용</label>
                        <textarea rows="12" id="content" name="content" style="resize: none;">${dto.content}</textarea>
                    </div>
                </div>

                <div class="form-section">
                    <div class="form-group">
                        <label for="price">판매가</label>
                        <input type="text" id="price" name="price" value="${dto.price}" maxlength="7" />
                    </div>
                    <div class="form-group">
                        <label for="goal_amount">목표 금액</label>
                        <input type="text" id="goal_amount" name="goal_amount" value="${dto.goal_amount}" maxlength="7" />
                    </div>
                    <div class="form-group">
                        <label for="current_amount">현재 모금액</label>
                        <input type="text" id="current_amount" name="current_amount" value="${dto.current_amount}" maxlength="7" />
                    </div>
                    <div class="form-group">
                        <label for="start_date">판매 시작일</label>
                        <input type="text" id="start_date" name="start_date" value="${dto.start_date}" placeholder="YYYY-MM-DD" maxlength="10">
                    </div>
                    <div class="form-group">
                        <label for="end_date">판매 종료일</label>
                        <input type="text" id="end_date" name="end_date" value="${dto.end_date}" placeholder="YYYY-MM-DD" maxlength="10">
                    </div>
                </div>

                <div class="button-group">
                    <input type="button" value="수정하기" class="btn btn-submit" onclick="sendIt();"/>
                    <input type="button" value="수정취소" class="btn btn-cancel" onclick="location='<%=cp%>/article.do?posts_num=${dto.posts_num}'"/>
                </div>
            </form>
        </div>
    </div>
</c:if>

</body>
</html>