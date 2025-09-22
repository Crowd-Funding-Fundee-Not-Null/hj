<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>


<style type="text/css">




.notice_wrapper1 {
	border: 1px solid lightgray;
	width: 84%;
	margin: 100px auto;
	padding: 50px 30px 50px 30px;
	font-size: 11pt;
}

.notice_header_wrapper {
	width: 94%;
	margin: 40px auto;
	
}

.notice_subheader {
	color: #787878;
}


.notice_detail_title_wrapper {
	width: 94%;
	margin: 15px auto;
	font-weight: 500;
	font-size: 17pt;
}

.notice_detail_content_wrapper {
	width: 94%;
	margin: 0 auto;
	margin-bottom: 50px;
	margin-top: 30px;
}

.notice_list_wrapper2:hover {
	background: rgb(238,238,238);
	cursor: pointer;
}

.important_notice_alert {
	color: white;
	font-size: 8pt;
	border-radius: 20%;
	display: inline-block;
	background: midnightblue;
	margin-right: 3px;
	padding: 2px 3px 2px 3px;
}

.notice_title_wrapper {
	display: inline-block;
	vertical-align: middle;
}

.notice_regdate_wrapper {
	display: inline-block;
	vertical-align: middle;
	float: right;
}

.notice_line {
	width: 94%;
	margin-top: 20px;
	margin-bottom: 15px;
}

.notice_detail_info_wrapper {
	width: 97%;
	text-align: right;
	font-size: 10pt;
}

.notice_return_button,.notice_submit_button {
	display: inline-block;
	margin: auto;
	margin-top: 30px;
	margin-left: 4px;
	margin-right: 4px;
	padding-top: 8px;
	text-align: center;
	width : 100px;
	height: 40px;
	border: 1px solid lightgray;
	border-radius: 7px;
	background: rgb(248,249,250);
}

.notice_return_button:hover,.notice_submit_button:hover{
	background: rgb(238,238,238);
	cursor: pointer;
}






.notice_write_w1,.notice_write_w3 {
	height: 50px;
	margin-bottom: 20px;
}

.notice_write_w2 {
	margin-bottom: 20px;
	height: 500px;
}


.notice_write_inputname_wrapper {
	display: inline-block;
	width: 13%;
	font-size: 15pt;
	padding-top: 10px;
	padding-left: 20px;
	vertical-align: top;
}

.notice_write_input_wrapper,.notice_write_textarea_wrapper,.notice_write_radio_wrapper {
	display: inline-block;
	width: 86%;
}

.notice_write_input {
	height: 50px;
	width: 95%;
	padding-left: 20px;
	border: 1px solid rgb(100,100,100);
	border-radius: 5px;
}


.notice_write_textarea {
	width: 95%;
	height: 500px;
	border: 1px solid rgb(100,100,100);
	border-radius: 5px;
	padding: 15px 20px 15px 20px;
	resize: none;
	
}


.notice_write_button_wrapper {
	margin: 0 auto;
	width: 220px;
}

.notice_write_radio_wrapper {
	margin-top: 10px;
}


[type="radio"] {
  vertical-align: middle;
  appearance: none;
  border: max(2px, 0.1em) solid gray;
  border-radius: 50%;
  width: 1.25em;
  height: 1.25em;
}

[type="radio"]:checked {
  border: 0.4em solid tomato;
}

[type="radio"]:disabled {
  background-color: lightgray;
  box-shadow: none;
  opacity: 0.7;
  cursor: not-allowed;
}

.radio_text {
	vertical-align: middle;
	font-size: 14pt;
	margin-left: 4px;
	margin-right: 20px;
	font-weight: 330;
}


</style>



<script type="text/javascript">

	function sendIt(){
		
		f = document.myForm;
		
		str = f.title.value;
		str = str.trim();
		if(!str){
			alert("\n제목을 입력하세요.");
			f.title.focus();
			return;
		}
		f.title.value = str;
		
		
				
		str = f.content.value;
		str = str.trim();
		if(!str){
			alert("\n내용을 입력하세요.");
			f.content.focus();
			return;
		}
		f.content.value = str;
		
		
		f.action = "<%=cp%>/funding/notice_write_ok.do";
		f.submit();		
		
	}
	
</script>





</head>


<body class="sub_page">

  <!-- header section start -->
  
  <%@ include file="header.jsp" %>
  
  <!-- header section end -->

  <!-- book section -->
  
    
    <div class="notice_wrapper1">
    	<div class="notice_header_wrapper">
    		<div class="notice_header">
	    		<h2>Notice</h2>
	    	</div>
	    	<div class="notice_subheader">
	    		Fundee의 다양한 소식을 알려드립니다.
	    	</div>
    	</div>
    	
    	
    	<form action="" name="myForm" method="post">
    	<div class="notice_detail_wrapper1">
    	
    		<div class="notice_detail_title_wrapper">
    			공지사항 작성
    		</div>
    		
    		<hr class="notice_line">
    		
    		<div class="notice_detail_content_wrapper">
    			
    			<div class="notice_write_w1">
    				<div class="notice_write_inputname_wrapper">
    					제목
    				</div>
    				<div class="notice_write_input_wrapper">
    					<input type="text" class="notice_write_input" name="title" placeholder="제목을 입력하세요.">
    				</div>
    			</div>
    			
    			<div class="notice_write_w2">
    				<div class="notice_write_inputname_wrapper">
    					내용
    				</div>
    				<div class="notice_write_textarea_wrapper">
    					<textarea rows="5" cols="50" class="notice_write_textarea" name="content"
    						placeholder="내용을 입력하세요."></textarea>
    				</div>
    			</div>
    			
    			<div class="notice_write_w3">
    				<div class="notice_write_inputname_wrapper">
    					중요도
    				</div>
    				<div class="notice_write_radio_wrapper">
    					<input type="radio" name="importance" value="0" checked="checked">
    					<a class="radio_text">일반 공지사항</a>&nbsp;&nbsp;
    					<input type="radio" name="importance" value="1">
    					<a class="radio_text">중요 공지사항</a>
    				</div>
    			</div>
    			
    		</div>
    		
    		
    		
    		
    		<hr class="notice_line">
    		
    		<div class="notice_write_button_wrapper">
    			<div class="notice_submit_button" onclick="sendIt();">
	    			등록하기
	    		</div>
	    		<div class="notice_return_button"
	    			onclick="javascript:location.href='<%=cp %>/funding/notice.do?pageNum=${pageNum}';">
	    			목록으로
	    		</div>
    		</div>
    		
    		
    		
    		
    	</div>
    	
    	</form>
    	
    </div>
    
    
    
    
  </section>
  <!-- end book section -->

  <!-- footer section start -->

  <%@ include file="footer.jsp" %>

  <!-- footer section end -->

</body>
</html>