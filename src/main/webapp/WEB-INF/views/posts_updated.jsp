<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>

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
		str = f.startDate.value;
		str = str.trim();
		if(!str){
			alert("\n판매 시작일을 입력하세요.");
			f.startDate.focus();
			return;
		}
		if(!isValidDate(str)){
			alert("\n올바른 날짜 형식(YYYY-MM-DD)으로 입력하세요.");
			f.startDate.focus();
			return;
		}
		f.startDate.value = str;
		
		// 종료일 검증
		str = f.endDate.value;
		str = str.trim();
		if(!str){
			alert("\n판매 종료일을 입력하세요.");
			f.endDate.focus();
			return;
		}
		if(!isValidDate(str)){
			alert("\n올바른 날짜 형식(YYYY-MM-DD)으로 입력하세요.");
			f.endDate.focus();
			return;
		}
		f.endDate.value = str;
		
		// 날짜 순서 검증
		if(new Date(f.startDate.value) >= new Date(f.endDate.value)){
			alert("\n종료일은 시작일보다 늦어야 합니다.");
			f.endDate.focus();
			return;
		}
		
		// 목표금액 검증
		str = f.goalAmount.value;
		str = str.trim();
		if(!str){
			alert("\n목표 금액을 입력하세요.");
			f.goalAmount.focus();
			return;
		}
		if(isNaN(str) || parseInt(str) <= 0){
			alert("\n올바른 목표 금액을 입력하세요.");
			f.goalAmount.focus();
			return;
		}
		f.goalAmount.value = str;
		
		// 현재 모금액 검증
		str = f.currentAmount.value;
		str = str.trim();
		if(!str){
			f.currentAmount.value = "0";
		} else {
			if(isNaN(str) || parseInt(str) < 0){
				alert("\n올바른 현재 모금액을 입력하세요.");
				f.currentAmount.focus();
				return;
			}
			f.currentAmount.value = str;
		}
	
		f.action = "<%=cp%>/updated_ok.do";
		f.submit();		
	}
	
	// 날짜 형식 검증 함수
	function isValidDate(dateString) {
		var regex = /^\d{4}-\d{2}-\d{2}$/;
		if (!regex.test(dateString)) return false;
		
		var date = new Date(dateString);
		var timestamp = date.getTime();
		
		if (typeof timestamp !== 'number' || Number.isNaN(timestamp)) {
			return false;
		}
		
		return dateString === date.toISOString().split('T')[0];
	}
	
</script>


<div id="posts_title">
    상품 수정 페이지
</div>

<form action="<%=cp%>/updated_ok.do" name="myForm" method="post" enctype="multipart/form-data">
    <input type="hidden" name="postsNum" value="${dto.postsNum}"/>
    <input type="hidden" name="existingImageFile" value="${dto.imageFile}"/>
    
    <div id="posts_updated_">
		<div class="posts_updated__bottomLine">
			<dl>
				<dt>상품&nbsp;&nbsp;제목</dt>
				<dd>
				<input type="text" name="title" value="${dto.title}"
					size="60" maxlength="100" class="boxTF"/>
				</dd>
			</dl>
		</div>
		
		<div class="posts_created_bottomLine">
			<dl>
				<dt>작 성 자</dt>
				<dd>
				<input type="text" name="userId" value="${dto.userId}"
					size="35" maxlength="20" class="boxTF" />
				</dd>
			</dl>
		</div>
		
		<div id="posts_updated__content">
			<dl>
				<dt>상품&nbsp;&nbsp;내용</dt>
				<dd>
				<textarea rows="12" cols="63" name="content" class="boxTA"
				style="resize: none; background-color: #ffffff;">${dto.content}</textarea>
				</dd>
			</dl>
		</div>
		
		<div class="posts_updated__noLine">
			<dl>
				<dt>판 매 가</dt>
				<dd>
				<input type="text" name="price" value="${dto.price}"
					size="35" maxlength="10" class="boxTF"/>
				</dd>
			</dl>
		</div> 
		
		<div class="posts_updated_noLine">
			<dl>			
				<dt>판매 시작일</dt>
				<dd>
				<input type="text" id="startDate" name="startDate" 
					   value="${dto.startDate}" 
					   placeholder="YYYY-MM-DD" maxlength="10" class="boxTF">
				</dd>
			</dl>
		</div> 
		
		<div class="posts_updated_noLine">
			<dl>
				<dt>판매 종료일</dt>
				<dd>
				<input type="text" id="endDate" name="endDate" 
					   value="${dto.endDate}" 
					   placeholder="YYYY-MM-DD" maxlength="10" class="boxTF">
				</dd>
			</dl>
		</div>

<script type="text/javascript">
// 페이지 로드 후 날짜 포맷 정리
window.onload = function() {
    var startDateInput = document.getElementById('startDate');
    var endDateInput = document.getElementById('endDate');
    
    if (startDateInput.value && startDateInput.value.indexOf(' ') > -1) {
        startDateInput.value = startDateInput.value.split(' ')[0];
    }
    
    if (endDateInput.value && endDateInput.value.indexOf(' ') > -1) {
        endDateInput.value = endDateInput.value.split(' ')[0];
    }
}
</script> 
			
		<div class="posts_updated__noLine">
			<dl>
				<dt>목표 금액</dt>
				<dd>
				<input type="text" name="goalAmount" value="${dto.goalAmount}"
					size="35" maxlength="10" class="boxTF"/>
				</dd>
			</dl>
		</div> 
		
		<div class="posts_updated__noLine">
			<dl>
				<dt>현재 모금액</dt>
				<dd>
				<input type="text" name="currentAmount" value="${dto.currentAmount}"
					size="35" maxlength="10" class="boxTF"/>
				</dd>
			</dl>
		</div> 
	</div>
	
	 <!-- 파일 업로드 필드 추가 -->
    <div class="posts_updated_bottomLine">
        <dl>
            <dt>파일 수정</dt>
            <dd>
                <c:if test="${not empty dto.imageFile}">
                    <p>현재 파일: ${dto.imageFile}</p>
                </c:if>
                <input type="file" name="upload" class="boxTF" accept="image/*" />
                <p style="font-size: 12px; color: #666;">새 파일을 선택하지 않으면 기존 파일이 유지됩니다.</p>
            </dd>
        </dl>
    </div>
	
	<div id="posts_created_footer">
		<input type="button" value=" 수정하기 " class="btn2" 
			onclick="sendIt();"/>
		<input type="button" value=" 수정취소 " class="btn2"
			onclick="location='<%=cp%>/article.do?postsNum=${dto.postsNum}'"/>
	</div>

</form>