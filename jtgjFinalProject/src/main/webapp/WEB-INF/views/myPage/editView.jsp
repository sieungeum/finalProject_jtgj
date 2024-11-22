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
		<!-- nav -->
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
						<c:if test="${sessionScope.login.userRank == 'M' || sessionScope.login.userRank == 'Y' || sessionScope.login.userRank == 'K' }">
						<a class="nav-link" style="color: white; padding-top: 30px;" href="${pageContext.request.contextPath }/promotion"> 홍보 </a>
						</c:if>
						<c:if test="${sessionScope.login.userRank == 'Y' || sessionScope.login.userRank == 'K' || sessionScope.login.userRank == 'L'  }">
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
					<c:if test="${sessionScope.login.userRank == 'N'|| sessionScope.login.userRank == 'K' }">
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
						</c:if>
						
						
						
						
						<div class="col-xl-4 col-lg-5">
							<div class="card mb-4">
								<div class="card-header">회원정보 수정</div>
								<div class="card-body">
								<form action="${pageContext.request.contextPath }/personalEditDo" method="POST">
	       
	        <div class="mb-3">
	            <label for="inputId" class="form-label" style="font-weight:bolder;">아이디</label>
	            <div class="input-group d-flex">
	                <input type="text" class="form-control" id="inputId" style="background-color: #dddddd" value="${login.userId }" name="userId" readonly>
	            </div>
	            
	            <div class="d-flex mt-2">
	            	<label class="me-3" id="label1"></label>
	            </div>  
	        </div>
	
	        <div class="mb-3">
	            <label for="inputPassword" class="form-label" style="font-weight:bolder;">새로운 비밀번호</label>
	            <div class="input-group mb-3">
	                <input type="password" class="form-control" id="inputPassword" placeholder="새로운 비밀번호를 입력하세요" name="userPw">
	            </div>
	            <label for="checkPassword" class="form-label" style="font-weight:bolder;">비밀번호 확인</label>
	            <div class="input-group">
	                <input type="password" class="form-control" id="checkPassword" placeholder="비밀번호를 입력하세요">
	            </div>
	            
	            <div class="d-flex mt-2">
	            	<label class="me-3" id="label2"></label>
	            </div>  
	        </div>
	        
	        <div class="mb-3">
	            <label for="inputName" class="form-label" style="font-weight:bolder;">닉네임</label>
	            <div class="input-group">
	                <input type="text" class="form-control" id="inputName" value="${login.userName }" name="userName">
	            </div>
	            
	            <div class="d-flex mt-2">
	            	<label class="me-3" id="label3"></label>
	            </div>  
	        </div>
	
	        <div class="mb-3">
	            <label for="inputEmail" class="form-label" style="font-weight:bolder;">이메일</label>
	            <div class="input-group mb-2">
	                <input type="email" class="form-control me-2" id="inputEmail" value="${login.userEmail }" name="userEmail">
	            </div>
	        </div>
	        
	        <div class="mb-3">
	            <label for="inputPhone" class="form-label" style="font-weight:bolder;">휴대폰</label>
	            <div class="input-group">
	                <input type="text" class="form-control" id="inputPhone" value="${login.userPhone }" name="userPhone">
	            </div>
	        </div>
	
	        <div class="mt-5">
	            <button class="btn btn-primary btn-lg w-100" id="signUpBtn" type="submit" >수정하기</button>
	            <p id="signUpWarning" style="font-size:13px;color:red;font-weight:bolder;">아이디, 비밀번호, 이름의 중복여부를 확인해주시고 이메일을 인증해주세요!</p>
	        </div>		
		</form>
								
								
								
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

	<script>
	
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
