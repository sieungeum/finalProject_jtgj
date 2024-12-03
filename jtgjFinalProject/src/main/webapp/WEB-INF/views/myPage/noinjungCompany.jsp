<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>인증받지못한기업</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

<style>
.custom-table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;
}

/* 헤더 스타일 */
.custom-table thead {
	background-color: #f8f9fa;
	font-weight: bold;
}

.custom-table th, .custom-table td {
	padding: 12px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

/* 짝수 행 배경색 */
.custom-table tr:nth-child(even) {
	background-color: #f9f9f9;
}

/* 호버 효과 */
.custom-table tr:hover {
	background-color: #e2e6ea;
}

/* 링크 스타일 */
.custom-table a {
	color: #007bff;
	text-decoration: none;
}

.custom-table a:hover {
	text-decoration: underline;
}

.mater-div {
	border-radius: 100px;
	height: 200px;
	width: 200px;
	overflow: hidden;
}

.mater-img {
	height: 200px;
	width: 200px;
	cursor: pointer;
}
</style>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-primary">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3"
			style="font-size: 40px; font-weight: bold;" href="home">저탄고집</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
	</nav>

	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav
				class="sb-sidenav accordion sb-sidenav-dark bg-primary text-white"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav"
						style="font-size: 30px; color: black; padding-top: 30px;">
						<a class="nav-link" style="color: white; padding-top: 30px;"
							href="${pageContext.request.contextPath}/myPage"> 마이페이지 </a>  
						<c:if test="${sessionScope.login.userAccount == 'C'}">
							<a class="nav-link" style="color: white; padding-top: 30px;"
								href="${pageContext.request.contextPath }/companyEditView">
								수정 </a>
						</c:if>
						<c:if test="${sessionScope.login.userAccount != 'C'}">
							<a class="nav-link" style="color: white; padding-top: 30px;"
								href="${pageContext.request.contextPath }/personalEditView">
								수정 </a>
						</c:if>
						<c:if test="${sessionScope.login.userAccount == 'C'}">
                  	  <c:if test="${sessionScope.login.userRank == 'M'}">
	                  	<a class="nav-link" style="color: white; padding-top: 30px;" href="${pageContext.request.contextPath }/companyBoardWriteView"> 홍보 </a>
	                  </c:if>
	                  <c:if test="${sessionScope.login.userRank == 'N' || sessionScope.login.userRank == 'L'}">
	                  	<a class="nav-link" style="color: white; padding-top: 30px;" href="${pageContext.request.contextPath }/noinjungCompany"> 홍보 </a>
	                  </c:if>
                  </c:if>
                  <c:if test="${sessionScope.login.userRank == 'Y' || sessionScope.login.userRank == 'K'}">
	                  	<a class="nav-link" style="color: white; padding-top: 30px;" href="${pageContext.request.contextPath }/companyBoardWriteView"> 홍보 </a>
	                  </c:if>
						<c:if
							test="${sessionScope.login.userRank == 'Y' || sessionScope.login.userRank == 'K' || sessionScope.login.userRank == 'L'  }">
							<a class="nav-link" style="color: white; padding-top: 30px;"
								href="${pageContext.request.contextPath }/adminPage">관리자페이지</a>
						</c:if>
						<div style="margin: 10px; margin-left:0; padding-right: 100px;"><a class="nav-link" style="color: white; font-size: 20px;'" href="${pageContext.request.contextPath }/logoutDo">로그아웃</a></div>
					</div>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<div class="row d-flex justify-content-center mt-3">
						<div class="col-xl-4 col-lg-5" style="margin-top:15%;">
							<div class="card mb-4">
								<div class="card-header">알림</div>
								<div class="card-body" style="display: flex; justify-content: center; align-items: center; margin: 20px;">
								<a>
									인증받지 못한 기업입니다.<br>
									건의사항 게시판에 신청해주세요. <br>
									문의전화: 010-1234-1234
								</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">

					</div>
				</div>
			</footer>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	
	
	

</body>
</html>
