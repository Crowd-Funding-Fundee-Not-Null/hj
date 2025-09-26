<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품(프로젝트) 등록</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/resources/css/bootstrap.css" />
<link href="<%=cp %>/resources/css/font-awesome.min.css" rel="stylesheet" />
<style>

	/* 전체 페이지 기본 스타일 */
    body {
        font-family: 'Arial', sans-serif; /* 전체 페이지 폰트 */
        background-color: #f0f2f5; 
        color: #333; /* 기본 텍스트 색상 */
    }
    
    /*  폼 컨테이너 레이아웃 스타일 */
    .form-wrapper { /* form-container를 감싸는 바깥쪽 컨테이너 */
        display: flex; 
        justify-content: center; 
        padding: 40px 0; /* 상하 여백 40px */
    }
    .form-container {/* 실제 입력 폼을 담는 중앙 컨테이너 */
        width: 100%;
        max-width: 800px; /* 최대 너비 제한 */
        background-color: #fff; 
        padding: 40px;
        border-radius: 10px; /* 둥근 모서리 */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    }
    .form-container h2 {/* 폼 제목 "상품 등록 페이지"에 적용 */
        font-size: 28px; /* 제목 크기 */
        color: #2c3e50; /* 제목 색상  */
        margin-bottom: 30px; /* 아래 여백 */
        text-align: center;
    }
    
      /*   폼 섹션 구분 스타일 */
    .form-section { /* 입력 필드 그룹을 묶는 섹션 */
        border-bottom: 1px solid #eee; /* 섹션 구분선 */
        padding-bottom: 20px; /* 아래 패딩 */
        margin-bottom: 25px;/* 아래쪽 섹션과의 간격 */
    }
    .form-section:last-child { /* 가장 마지막 form-section에만 적용 */    
        border-bottom: none; /* 마지막 섹션은 구분선 없음 */
        margin-bottom: 0;
        padding-bottom: 0;
    }
    
     /*    폼 입력 필드 스타일 */
    .form-group { /* 라벨과 입력 필드를 묶는 그룹 */
        margin-bottom: 20px; /* 입력 그룹 간격 */
    }
    .form-group label {
        display: block; /* 블록 레벨 요소로 만들어 다음 요소를 다음 줄로 내림 */
        font-weight: bold; /* 굵은 글씨 */
        margin-bottom: 8px; /* 라벨과 입력칸 간격 */
        color: #555; /* 라벨 색상 */
    }
    .form-group input[type="text"], /* 텍스트 입력 필드에 적용 */
    .form-group textarea { /* 텍스트 영역에 적용 */
        width: 100%; /* 전체 너비 */
        padding: 12px; /* 내부 여백 */
        border: 1px solid #ddd; /* 테두리 */
        border-radius: 6px;
        font-size: 14px;
        transition: border-color 0.3s;
    }
    
     /* 입력 필드 포커스 효과 */
    .form-group input[type="text"]:focus,
    .form-group textarea:focus {
        border-color: #00796b;/* 포커스 시 테두리 색상 (진한 청록색) */
        outline: none;/* 기본 아웃라인 제거 */
    }
    
    /*  파일 업로드 스타일 */
    .file-upload-container { /* 파일 업로드 입력 필드를 감싸는 컨테이너 */
        display: flex; 
        align-items: center; /* 수직 중앙 정렬 */
        gap: 10px;  /* 요소 간 간격 */
    }
    .file-upload-container input[type="file"] { /* 파일 선택 버튼에 적용 */
        flex-grow: 1;  /* 남은 공간 모두 사용 */
        padding: 8px;  /* 내부 여백 */
        border: 1px solid #ddd;
        border-radius: 6px;
    }
    
      /*  버튼 그룹 스타일 */
    .button-group {  /* 등록하기, 다시입력, 취소 버튼을 묶는 컨테이너 */
        text-align: center; /* 버튼들 중앙 정렬 */
        margin-top: 30px; /* 위쪽 여백 */
    }
    
    /* 기본 버튼 스타일 */
    .btn {
        padding: 12px 25px; /* 버튼 내부 여백 */
        border: none;  /* 테두리 제거 */
        border-radius: 6px;
        cursor: pointer; /* 마우스 포인터 */
        font-size: 16px; /* 글자 크기 */
        font-weight: bold; /* 굵은 글씨 */
        transition: background-color 0.3s, transform 0.2s; /* 호버 효과 애니메이션 */
        margin: 0 5px; /* 버튼 간격 */
    }
    
    /* 등록하기 버튼 (주요 액션) */
    .btn-submit { /* "등록하기" 버튼에만 적용 */
        background-color: #00796b; 
        color: #fff; /* 흰색 글자 */
    }
    .btn-submit:hover { /* "등록하기" 버튼에 마우스를 올렸을 때 */
        background-color: #004d40; /* 호버 시 더 진한 색 */
        transform: translateY(-2px); /* 살짝 위로 올라가는 효과 */
    }
    
    /* 다시입력 버튼 (보조 액션) */
    .btn-reset { /* "다시입력" 버튼에만 적용 */
        background-color: #e0e0e0; 
        color: #555; 
    }
    .btn-reset:hover { /* "다시입력" 버튼에 마우스를 올렸을 때 */
        background-color: #ccc; 
        transform: translateY(-2px); /* 올라가는 효과 */
    }
    
     /* 취소 버튼 (위험한 액션) */
    .btn-cancel { /* "작성취소" 버튼에만 적용 */
        background-color: #ff5252; 
        color: #fff; /* 흰색 글자 */
    }
    .btn-cancel:hover { /* "작성취소" 버튼에 마우스를 올렸을 때 */
        background-color: #d14141; /* 호버 시 더 진한 빨간색 */
        transform: translateY(-2px); /* 올라가는 효과 */
    }
    
    /* 접근 권한 없음 메시지 스타일 */
    .access-denied { /* 접근 권한이 없을 때 표시되는 메시지 컨테이너 */
        text-align: center; 
        padding-top: 50px; /* 위쪽 여백 */
    }
    .access-denied h2 { /* "접근 권한이 없습니다." 제목에 적용 */
        color: #d32f2f;  /* 빨간색 (경고 색상) */
    }
    .access-denied a { /* "상품 목록으로 돌아가기" 링크에 적용 */
        color: #00796b; 
        text-decoration: none; /* 밑줄 제거 */
    }
</style>

<script type="text/javascript" src="/resources/js/util.js"></script>
<script type="text/javascript">
    function sendIt(){
        f = document.myForm;

        str = f.title.value;
        str = str.trim();
        if(!str){
            alert("\n상품제목을 입력하세요.");
            f.title.focus();
            return;
        }
        f.title.value = str;

        str = f.userId.value;
        str = str.trim();
        if(!str){
            alert("\관리자를 입력하세요.");
            f.userId.focus();
            return;
        }
        f.userId.value = str;

        str = f.content.value;
        str = str.trim();
        if(!str){
            alert("\n상품내용을 입력하세요.");
            f.content.focus();
            return;
        }
        f.content.value = str;

        str = f.price.value;
        str = str.trim();
        if(!str){
            alert("\n상품가격을 입력하세요.");
            f.price.focus();
            return;
        }
        f.price.value = str;

        str = f.goal_amount.value;
        if(!str){
            alert("\n목표 금액을 입력하세요.");
            f.goal_amount.focus();
            return;
        }
        if (isNaN(str)) {
            alert("\n목표 금액은 숫자만 입력 가능합니다.");
            f.goal_amount.focus();
            return;
        }
		// 파일 형식은 jpg,jpeg,png,gif 으로만 올릴 수있고 나머지는 못올리게 함
        if(f.upload.value && !f.upload.value.match(/.(jpg|jpeg|png|gif)$/i)){
            alert("상품 목록 이미지는 이미지 파일만 업로드 가능합니다.");
            f.upload.focus();
            return;
        }

        if(f.detail_upload.value && !f.detail_upload.value.match(/.(jpg|jpeg|png|gif)$/i)){
            alert("상세페이지 이미지는 이미지 파일만 업로드 가능합니다.");
            f.detail_upload.focus();
            return;
        }

        f.action = "<%=cp%>/created_ok.do";
        f.submit();
    }
</script>

</head>
<body>
<c:if test="${sessionScope.loginUser.role == 1}">
    <div class="form-wrapper">
        <div class="form-container">
            <h2>상품 등록 페이지</h2>
            <form action="<%=cp%>/created_ok.do" name="myForm" method="post" enctype="multipart/form-data">

                <div class="form-section">
                    <div class="form-group">
                        <label for="title">상품 제목</label>
                        <input type="text" id="title" name="title" maxlength="100" />
                    </div>
                    <div class="form-group">
                        <label for="userId">관리자</label>
                        <input type="text" id="userId" name="userId" maxlength="20" />
                    </div>
                </div>

                <div class="form-section">
                    <div class="form-group">
                        <label for="upload">상품 목록 이미지</label>
                        <input type="file" id="upload" name="upload" accept="image/*" />
                    </div>
                    <div class="form-group">
                        <label for="detail_upload">상품 상세 이미지</label>
                        <input type="file" id="detail_upload" name="detail_upload" accept="image/*" />
                    </div>
                </div>

                <div class="form-section">
                    <div class="form-group">
                        <label for="content">상품 내용</label>
                        <textarea rows="12" id="content" name="content" style="resize: none;"></textarea>
                    </div>
                </div>

                <div class="form-section">
                    <div class="form-group">
                        <label for="price">판매가</label>
                        <input type="text" id="price" name="price" maxlength="7" />
                    </div>
                    <div class="form-group">
                        <label for="goal_amount">목표 금액</label>
                        <input type="text" id="goal_amount" name="goal_amount" maxlength="7" />
                    </div>
                    <div class="form-group">
                        <label for="start_date">판매 시작일</label>
                        <input type="text" id="start_date" name="start_date" placeholder="YYYY-MM-DD" maxlength="10">
                    </div>
                    <div class="form-group">
                        <label for="end_date">판매 종료일</label>
                        <input type="text" id="end_date" name="end_date" placeholder="YYYY-MM-DD" maxlength="10">
                    </div>
                </div>

                <div class="button-group">
                    <input type="button" value="등록하기" class="btn btn-submit" onclick="sendIt();"/>
                    <input type="reset" value="다시입력" class="btn btn-reset" onclick="document.myForm.title.focus();"/>
                    <input type="button" value="작성취소" class="btn btn-cancel" onclick="javascript:location.href='<%=cp%>/posts_list.do';"/>
                </div>
            </form>
        </div>
    </div>
</c:if>

</body>
</html>