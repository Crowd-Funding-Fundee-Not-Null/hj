<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품(프로젝트) 등록</title>

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="<%=cp %>/resources/css/bootstrap.css" />
<!-- font awesome style -->
<link href="<%=cp %>/resources/css/font-awesome.min.css" rel="stylesheet" />

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
			alert("\n등록자를 입력하세요.");
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
		
	
		f.action = "<%=cp%>/created_ok.do";
		f.submit();		
		
	}
	
</script>

</head>
<body>

<div id="posts">
	<div id="posts_title">
		상품 등록 페이지
	</div>
	
	<form action="<%=cp%>/created_ok.do" name="myForm" method="post" enctype="multipart/form-data">
	<div id="posts_created">
		<div class="posts_created_bottomLine">
			<dl>
				<dt>상품&nbsp;&nbsp;제목</dt>
				<dd>
				<input type="text" name="title" 
					size="60" maxlength="100" class="boxTF"/>
				</dd>
			</dl>
		</div>
				
					<div class="posts_created_noLine">
			    <dl>
			        <dt>첨부 파일</dt>
			        <dd>
			            <input type="file" name="upload" class="boxTF" accept="image/*" />
			        </dd>
			    </dl>
			</div>
		
		<div class="posts_created_bottomLine">
			<dl>
				<dt>작 성 자</dt>
				<dd>
				<input type="text" name="userId" 
					size="35" maxlength="20" class="boxTF" />
				</dd>
			</dl>
		</div>
		
		<div id="posts_created_content">
			<dl>
				<dt>상품&nbsp;&nbsp;내용</dt>
				<dd>
				<textarea rows="12" cols="63" name="content" class="boxTA" 
				style="resize: none; background-color: #ffffff;"></textarea>
				</dd>
			</dl>
		</div>
		
		<div class="posts_created_noLine">
			<dl>
				<dt>판 매 가</dt>
				<dd>
				<input type="text"" name="price" 
					size="35" maxlength="7" class="boxTF"/>
				
				</dd>
			</dl>
		</div> 
		
		<div class="posts_created_noLine">
			<dl>
				<dt>목표 금액</dt>
				<dd>
				<input type="text"" name="goalAmount" 
					size="35" maxlength="7" class="boxTF"/>
				
				</dd>
			</dl>
		</div> 		
		
		<div class="posts_created_noLine">
			<dl>
				<dt>판매 시작일</dt>
				<dd>
				<label for="startDate">판매 시작일</label>
				<input type="text" id="startDate" name="startDate" placeholder="YYYY-MM-DD" maxlength="10">
				
				</dd>
			</dl>
		</div> 
		
		<div class="posts_created_noLine">
			<dl>
				<dt>판매 종료일</dt>
				<dd>
				<label for="endDate">판매 종료일</label>
				<input type="text" id="endDate" name="endDate" placeholder="YYYY-MM-DD" maxlength="10">
				
				</dd>
			</dl>
		</div> 
		
		
	
	</div>
	
	<div id="posts_created_footer">
		<input type="button" value=" 등록하기 " class="btn2" 
			onclick="sendIt();"/>
		<input type="reset" value=" 다시입력 " class="btn2"
			onclick="document.myForm.title.focus();"/>
		<input type="button" value=" 작성취소 " class="btn2"
			onclick="javascript:location.href='<%=cp%>/posts_list.do';"/>
	</div>

	</form>

</div>





























</body>
</html>