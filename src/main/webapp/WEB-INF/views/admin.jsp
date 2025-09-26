<%@ page contentType="text/html; charset=UTF-8"%>
<%	
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.5">

<title>Fundee 관리자</title>

<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/dashboard/">

<!-- Bootstrap core CSS -->
<link href="<%=cp %>/resources/css/bcs.css" rel="stylesheet">


<style>

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

</style>


<!-- Custom styles for this template -->


<style>

body {
	font-size: .875rem;
}

.feather {
	width: 16px;
	height: 16px;
	vertical-align: text-bottom;
}

/*
 * Sidebar
 */
.sidebar {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	z-index: 100; /* Behind the navbar */
	padding: 48px 0 0; /* Height of navbar */
	box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
}

.sidebar-sticky {
	position: relative;
	top: 0;
	height: calc(100vh - 48px);
	padding-top: .5rem;
	overflow-x: hidden;
	overflow-y: auto;
	/* Scrollable contents if viewport is shorter than content. */
}

@
supports ((position: -webkit-sticky) or (position: sticky)) { .sidebar-sticky
	{ position:-webkit-sticky;
	position: sticky;
}

}
.sidebar .nav-link {
	font-weight: 500;
	color: #333;
}

.sidebar .nav-link .feather {
	margin-right: 4px;
	color: #999;
}

.sidebar .nav-link.active {
	color: #007bff;
}

.sidebar .nav-link:hover .feather, .sidebar .nav-link.active .feather {
	color: inherit;
}

.sidebar-heading {
	font-size: .75rem;
	text-transform: uppercase;
}

/*
 * Content
 */
[role="main"] {
	padding-top: 133px; /* Space for fixed navbar */
}

@media ( min-width : 768px) {
	[role="main"] {
		padding-top: 48px; /* Space for fixed navbar */
	}
}

/*
 * Navbar
 */
.navbar-brand {
	padding-top: .75rem;
	padding-bottom: .75rem;
	font-size: 1rem;
	background-color: rgba(0, 0, 0, .25);
	box-shadow: inset -1px 0 0 rgba(0, 0, 0, .25);
}

.navbar .form-control {
	padding: .75rem 1rem;
	border-width: 0;
	border-radius: 0;
}

.form-control-dark {
	color: #fff;
	background-color: rgba(255, 255, 255, .1);
	border-color: rgba(255, 255, 255, .1);
}

.form-control-dark:focus {
	border-color: transparent;
	box-shadow: 0 0 0 3px rgba(255, 255, 255, .25);
}

/*
 헤더 부분 이름이 세로로 바뀌는 문제 해결
*/

table th {
  white-space: nowrap;   /* 한 줄 유지 */
  text-align: center;    /* 가운데 정렬 */
  font-size: 0.875rem;   /* 글자 크기 조정 */
  padding: 8px;
}

/* 긴 내용은 말줄임 처리 */
table th, table td {
  overflow: hidden;
  text-overflow: ellipsis;
}



</style>




</head>
<body>

<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
	<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="index.do">
		Fundee
	</a> 
	<input class="form-control form-control-dark w-100" type="text"
		placeholder="Search" aria-label="Search">
	<ul class="navbar-nav px-3">
		<li class="nav-item text-nowrap">
			<a class="nav-link" href="#">Sign out</a>
		</li>
	</ul>
</nav>

<div class="container-fluid">
	<div class="row">
		<nav class="col-md-2 d-none d-md-block bg-light sidebar">
			<div class="sidebar-sticky">
				<ul class="nav flex-column">
					<li class="nav-item">
						<a class="nav-link active" href="#">
							<span data-feather="home"></span> Dashboard 
							<span class="sr-only">(current)</span>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link " href="#"> 
							<span data-feather="file"></span> Orders
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#"> 
							<span data-feather="shopping-cart"></span> Products
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#"> 
							<span data-feather="users"></span> Customers
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#"> 
							<span data-feather="bar-chart-2"></span> Reports
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#"> 
							<span data-feather="layers"></span> Integrations
						</a>
					</li>
				</ul>

				<h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
					<span>Saved reports</span> 
					<a class="d-flex align-items-center text-muted" href="#"> 
						<span data-feather="plus-circle"></span>
					</a>
				</h6>
				<ul class="nav flex-column mb-2">
					<li class="nav-item">
						<a class="nav-link" href="#"> 
							<span data-feather="file-text"></span> Current month
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#"> 
							<span data-feather="file-text"></span> Last quarter
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#"> 
							<span data-feather="file-text"></span> Social engagement
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#"> 
							<span data-feather="file-text"></span> Year-end sale
						</a>
					</li>
				</ul>
			</div>
		</nav>

		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
		
			<!--  
			<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h1 class="h2">Dashboard</h1>
				<div class="btn-toolbar mb-2 mb-md-0">
					<div class="btn-group mr-2">
						<button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
						<button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
					</div>
					<button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
						<span data-feather="calendar"></span> This week
					</button>
				</div>
			</div> 
			<canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas> 
			-->
			
			
			<br/>
			
			<h2>전체 회원 목록</h2>
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<thead>
						<tr>
							<th>ID</th>
							<th>Nickname</th>
							<th>Name</th>
							<th>주소</th>
							<th>상세주소</th>
							<th>도로명</th>
							<th>동-호수</th>
							<th>Join Date</th>
							<th>Role</th>
							<th>Email</th>
							<th>Phone</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${lists }">
						
							<tr>
								<td>${dto.id }</td>								
								<td>${dto.nickname }</td>
								<td>${dto.name }</td>
								<td>${dto.address1 }</td>
								<td>${dto.address2 }</td>
								<td>${dto.zip_code }</td>
								<td>${dto.dong }</td>
								<td>${dto.join_date }</td>
								<td>${dto.role }</td>
								<td>${dto.email }</td>
								<td>${dto.phone }</td>
								
								
							</tr>
							
						</c:forEach>
						
						
					</tbody>
				</table>
			</div>
		</main>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
<script src="/docs/4.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.9.0/dist/feather.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.7.3/dist/Chart.min.js"></script>

<!-- <script src="dashboard.js"></script> -->



<script>
       
/* globals Chart:false, feather:false */

(function () {
	'use strict'

	feather.replace()

	// Graphs
	var ctx = document.getElementById('myChart')
	
	// eslint-disable-next-line no-unused-vars
	var myChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: [
				'Sunday',
				'Monday',
				'Tuesday',
				'Wednesday',
				'Thursday',
				'Friday',
				'Saturday'
			],
			datasets: [{
				data: [
					15339,
					21345,
					18483,
					24003,
					23489,
					24092,
					12034
				],
				lineTension: 0,
				backgroundColor: 'transparent',
				borderColor: '#007bff',
				borderWidth: 4,
				pointBackgroundColor: '#007bff'
			}]
		},
		options: {
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: false
					}
				}]
			},
			legend: {
				display: false
			}
		}
	})
}())
       
       
</script>



</body>
</html>
