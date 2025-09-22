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

.notice_header_left {
	display: inline-block;
}

.notice_write_button {
	float: right;
	margin: auto;
	padding-top: 8px;
	text-align: center;
	width : 100px;
	height: 40px;
	border: 1px solid lightgray;
	border-radius: 7px;
	background: rgb(248,249,250);
	margin-top: 12px;
	vertical-align: middle;
}

.notice_write_button:hover {
	background: rgb(238,238,238);
	cursor: pointer;
}


.notice_subheader {
	color: #787878;
}


.notice_list_wrapper2 {
	border: 1px solid lightgray;
	border-radius: 5px;
	width: 94%;
	margin: 15px auto;
	padding: 20px 15px 20px 15px;
	background: rgb(248,249,250);
	font-weight: 500;
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

.paging_wrapper1 {
	text-align: center;
	margin: 0 auto;
	margin-top: 30px;
	font-size: 15pt;
}



</style>









</head>


<body class="sub_page">

  <!-- header section start -->
  
  <%@ include file="header.jsp" %>
  
  <!-- header section end -->


  <!-- book section -->
  
    
    <div class="notice_wrapper1">
    	<div class="notice_header_wrapper">
    	
    		<div class="notice_header_left">
	    		<div class="notice_header">
		    		<h2>Notice</h2>
		    	</div>
		    	<div class="notice_subheader">
		    		Fundee의 다양한 소식을 알려드립니다.
		    	</div>
    		</div>
   			<div class="notice_write_button"
   				onclick="javascript:location.href='<%=cp %>/funding/notice_write.do?pageNum=${currentPage}';">
   				글쓰기
    		</div>
    		
    		
    	</div>
    	
    	<div class="notice_list_wrapper1">
    	
    		<c:forEach var="dto" items="${importantLists }">
    			<div class="notice_list_wrapper2" 
    				onclick="javascript:location.href='<%=cp %>/funding/notice_detail.do?notice_num=${dto.notice_num}&pageNum=${currentPage }';">
    				<div class="important_notice_alert">공지</div>
    				<div class="notice_title_wrapper">
    					${dto.title }
    				</div>
    				<div class="notice_regdate_wrapper">
    					${dto.reg_date }
    				</div>
    			</div>
    		</c:forEach>
    	
    		<c:forEach var="dto" items="${allLists }">
    			<div class="notice_list_wrapper2"
    				onclick="javascript:location.href='<%=cp %>/funding/notice_detail.do?notice_num=${dto.notice_num}&pageNum=${currentPage }';">
    				<div class="notice_title_wrapper">
    					${dto.title }
    				</div>
    				<div class="notice_regdate_wrapper">
    					${dto.reg_date }
    				</div>
    			</div>
    		</c:forEach>
    	
    	</div>
    	
    	<div class="paging_wrapper1">
   			<c:if test="${dataCount!=0 }">
				${pageIndexList }
			</c:if>
			<c:if test="${dataCount==0 }">
				등록된 게시물이 없습니다. 
			</c:if>
    	</div>
    	
    </div>
    
    
    
    
  </section>
  <!-- end book section -->



  <!-- footer section start -->

  <%@ include file="footer.jsp" %>

  <!-- footer section end -->

</body>
</html>