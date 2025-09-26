<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp2 = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


  


<style type="text/css">


.footer_section {
	background-color: #f8f9fa;
	color : black;
	height: 320px; 
	padding: 40px 0 40px 0;
}

.footer-wrapper-div {
	width: 67%; 
	margin: 0 auto; 
	text-align: left; 
	font-size: 10pt; 
	color: #212529;
	display: inline-block;
}

.footer-menu {
	margin-bottom: 10px;
}

.footer-menu-a {
	color: #212529;
}

.footer-menu-a:hover {
	color: #007bff;
}

.footer-logo-div {
	margin: 10px 50px 10px 0; 
	display: inline-block !important;
}

.footer-logo {
	color:#007bff !important;
}

.footer_social {
	display: inline-block !important; 
	width: 300px;
}

.footer-social-icon {
	display: inline-block !important;
}

.footer-info1 {
	margin-bottom: 10px;
}

.footer-info2 {
	margin-bottom: 10px;
	color: #949494;
}

.footer-logo-img-div {
	width: 20%; 
	display: inline-block; 
	vertical-align: top;
}

.footer-logo-img {
	 width:90%;
}

.moveTopBtn-img {
	width: 40px; 
	height: 40px;
	position: fixed; 
	right: 40px; 
	bottom: 40px; 
	background-color: transparent; 
	border-radius: 50%;
}









</style>





</head>
<body>







<!-- footer section -->
<footer class="footer_section">
	<div class="footer-wrapper-div">
        <div class="footer-menu">
     		<a class="footer-menu-a" href="index.do">홈으로</a> &nbsp;| &nbsp;
     		<a class="footer-menu-a" href="notice.do">공지사항</a> &nbsp;| &nbsp; 
     		<a class="footer-menu-a" href="#">회사소개</a>&nbsp; |&nbsp; 
     		<a class="footer-menu-a" href="#">고객센터</a>
     	</div>
     	
     	<div>
    	    <div class="footer-logo-div">
	    		<a href="index.do" class="footer-logo"><h2>Fundee</h2></a>
	    	</div>
	    	<div class="footer_social">
				<a href="" class="footer-social-icon">
	                <i class="fa fa-facebook" aria-hidden="true"></i>
	            </a>
	            <a href="" class="footer-social-icon">
	                <i class="fa fa-twitter" aria-hidden="true"></i>
	             </a>
	             <a href="" class="footer-social-icon">
	                <i class="fa fa-instagram" aria-hidden="true"></i>
	             </a>
	         </div>
     	</div>

    	<div class="footer-info1">
    		<span>
    			Fundee &nbsp;&nbsp;|&nbsp;&nbsp; 
    			대표자 : 박지원, 강혜정, 장소영, 김윤호 &nbsp;&nbsp;|&nbsp;&nbsp; 
    			경기 수원시 팔달구 중부대로 104 풍림빌딩신관 4층 &nbsp;&nbsp;|&nbsp;&nbsp; 
    			이메일 : fundee@notnull.kr
    		</span>
    	</div>
    	<div class="footer-info2">
	    	<span>
	    		Fundee는 중개업(온라인소액투자중개 및 통신판매중개)을 영위하는 플랫폼 제공자로 자금을 모집하는
				당사자가 아닙니다. 따라서 투자손실의 위험을 보전하거나 상품 제공을 보장해 드리지 않으며 이에 대한 법적인
				책임을 지지 않습니다. 상품, 상품정보, 거래에 관한 의무와 책임은 판매자에게 있으므로, 각 상품 페이지에서 구체적인 내용을 확인하시기 바랍니다.
	    	</span>
	    </div>
	    <div class="footer-info3">
    		<span>
    			© 2025. Fundee. All rights reserved.
    		</span>
    	</div>	
	</div>
	<div class="footer-logo-img-div">
		<img src="<%=cp2 %>/resources/images/fundee-logo.png" class="footer-logo-img"/>
	</div>
</footer>
<!-- footer section -->

<!-- jQery -->
<script src="<%=cp2 %>/resources/js/jquery-3.4.1.min.js"></script>
<!-- popper js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
</script>
<!-- bootstrap js -->
<script src="<%=cp2 %>/resources/js/bootstrap.js"></script>
<!-- owl slider -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
</script>
<!-- isotope js -->
<script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
<!-- nice select -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
<!-- custom js -->
<script src="<%=cp2 %>/resources/js/custom.js"></script>
<!-- Google Map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
</script>
<!-- End Google Map -->


<a class="moveTopBtn">
	<img src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdna%2Fs6jL5%2FbtqHsbU8DSJ%2FAAAAAAAAAAAAAAAAAAAAAGo-OShZXiIcpoKwvPTHjv727n_eLNJ4JWcIMKe7gAnW%2Fimg.png%3Fcredential%3DyqXZFxpELC7KVnFOS48ylbz2pIh7yKj8%26expires%3D1759244399%26allow_ip%3D%26allow_referer%3D%26signature%3Df8DIZGNIXiZcGZeEiIFEZfhy3PM%253D" class="moveTopBtn-img">
</a>

<script type="text/javascript">

const moveTopBtn = document.querySelector(".moveTopBtn");

moveTopBtn.onclick = () => {
	window.scrollTo({
		top: 0, behavior: "smooth"
	});
}

</script>

</body>
</html>