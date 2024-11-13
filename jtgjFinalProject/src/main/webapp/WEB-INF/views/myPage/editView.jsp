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
<title>저탄고집</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

<style>
.profile-div {
	border-radius: 100px;
	height: 200px;
	width: 200px;
	overflow: hidden;
}

.profile-img {
	height: 200px;
	width: 200px;
}

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
</style>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-primary">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" style="font-size: 40px; font-weight: bold;" href="home">저탄고집</a>
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
					<div class="nav" style="font-size: 30px; color: black; padding-top: 30px;">
						<a class="nav-link" style="color: white; padding-top: 30px;" href="${pageContext.request.contextPath}/myPage"> 마이페이지 </a> 
						<a class="nav-link" style="color: white; padding-top: 30px;" href="${pageContext.request.contextPath}/estimateHome"> 견적 </a> 
						<a class="nav-link" style="color: white; padding-top: 30px;" href="${pageContext.request.contextPath }/faqView"> 건의사항 </a> 
						<a class="nav-link" style="color: white; padding-top: 30px;" href="${pageContext.request.contextPath }/editView"> 수정 </a> 
						<a class="nav-link" style="color: white; padding-top: 30px;" href=""> 홍보 </a>
						<c:if test="${sessionScope.login.userRank == 'Y' || sessionScope.login.userRank == 'K' }">
							<a class="nav-link" style="color: white; padding-top: 30px;" href="${pageContext.request.contextPath }/adminPage">관리자페이지</a>
						</c:if>
					</div>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">
						<a style="text-decoration: none; color: inherit;"
							href="${pageContext.request.contextPath }/myPage">마이페이지</a>
					</h1>


					<div class="row">
						<div class="col-xl-4 col-lg-5">
							<div class="card mb-4">
								<div class="card-header">프로필</div>
								<div class="card-body" style="height: 330px;">
									<!-- 프로필 이미지 -->
									<div class="d-flex justify-content-center">
										<div
											class="profile-div d-flex justify-content-center align-items-center">
											<div style="position: relative;">
												<c:if test="${sessionScope.login.userProfImg == 'N' }">
													<img
														src="data:image/jpeg;base64,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"
														class="profile-img">
												</c:if>
												<c:if test="${sessionScope.login.userProfImg != 'N' }">
													<img
														src="<c:url value="/displayImage?imgName=${sessionScope.login.userProImg }"/>"
														class="profile-img">
												</c:if>
												<img
													src="https://cdn-icons-png.flaticon.com/512/10233/10233645.png"
													style="width: 100px; position: absolute; right: 0; bottom: 0; object-fit: cover;">
											</div>

										</div>
										<input class="d-none" id="inputImage" type="file"
											accept="image/*" onchange="readImage(this);">
									</div>
									<div class="d-flex justify-content-center"
										style="font-size: 40px; font-weight: bold; margin-top: 30px;">${sessionScope.login.userName }</div>
								</div>
							</div>
						</div>

						<div class="col-xl-4 col-lg-5">
							<div class="card mb-4">
								<div class="card-header">회원정보 수정</div>
								<div class="card-body"></div>
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

	<script type="text/javascript">
		
		$(".profile_img").on("click", ()=>{
			$("#inputImage").click();
		});
	</script>

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
