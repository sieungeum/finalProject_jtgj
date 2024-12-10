<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">


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

  .userTable {
    width: 100%; /* 테이블 너비 고정 */
    table-layout: fixed; /* 테이블 셀의 크기를 고정하여 자동 크기 조정 방지 */
    border-collapse: collapse; /* 테이블 셀 테두리 겹침 제거 */
  }

  /* <th>에 스타일 적용 */
  .userTable th {
    font-size: 15px;
    overflow: hidden; /* 넘치는 내용 잘리기 */
    text-overflow: ellipsis; /* 넘친 텍스트는 '...'으로 표시 */
    white-space: nowrap; /* 텍스트가 줄바꿈 되지 않도록 설정 */
    padding: 8px;
    text-align: center; /* 중앙 정렬 */
    border: 1px solid #ddd; /* 테두리 */
    background-color: #f4f4f4; /* 배경색 */
  }

  /* 각 열의 너비를 다르게 설정 */
  .userTable th:nth-child(1), /* 회원 아이디 */
  .userTable td:nth-child(1) {
    width: 15%; 
    text-align: center; /* 중앙 정렬 */
  }

  .userTable th:nth-child(2), /* 이름 */
  .userTable td:nth-child(2) {
    width: 20%; 
    text-align: center; /* 중앙 정렬 */
  }

  .userTable th:nth-child(3), /* 이메일 */
  .userTable td:nth-child(3) {
    width: 20%; 
    text-align: center; /* 중앙 정렬 */
  }

  .userTable th:nth-child(4), /* 가입일 */
  .userTable td:nth-child(4) {
    width: 15%; 
    text-align: center; /* 중앙 정렬 */
  }

  .userTable th:nth-child(5), /* 기업여부 */
  .userTable td:nth-child(5) {
    width: 10%; 
    text-align: center; /* 중앙 정렬 */
  }

  .userTable th:nth-child(6), /* 인증 */
  .userTable td:nth-child(6) {
    width: 15%; 
    text-align: center; /* 중앙 정렬 */
  }

  .userTable th:nth-child(7), /* 관리자 권한 */
  .userTable td:nth-child(7) {
    width: 10%;
    text-align: center; /* 중앙 정렬 */
  }

  /* <td>에 스타일 적용 */
  .userTable td {
    height: 20px; /* 셀 높이 고정 */
    overflow: hidden; /* 넘치는 내용 잘리기 */
    text-overflow: ellipsis; /* 넘친 텍스트는 '...'으로 표시 */
    white-space: nowrap; /* 텍스트가 줄바꿈 되지 않도록 설정 */
    padding: 8px;
    text-align: center; /* 중앙 정렬 */
    border: 1px solid #ddd; /* 테두리 */
  }


 .faqTable th {
    font-size: 15px;
    overflow: hidden; /* 넘치는 내용 잘리기 */
    text-overflow: ellipsis; /* 넘친 텍스트는 '...'으로 표시 */
    white-space: nowrap; /* 텍스트가 줄바꿈 되지 않도록 설정 */
    padding: 8px;
    text-align: center; /* 중앙 정렬 */
    border: 1px solid #ddd; /* 테두리 */
    background-color: #f4f4f4; /* 배경색 */
  }

  /* 각 열의 너비를 다르게 설정 */
  .faqTable th:nth-child(1), /* 글 번호 */
  .faqTable td:nth-child(1) {
    width: 40px; /* 번호 열의 너비 */
    text-align: center; /* 중앙 정렬 */
  }

  .faqTable th:nth-child(2), /* 글 제목 */
  .faqTable td:nth-child(2) {
    width: 500px; 
    text-align: center; /* 중앙 정렬 */
  }

  .faqTable th:nth-child(3), /* 작성자 */
  .faqTable td:nth-child(3) {
    width: 80px; /* 이름 열의 너비 */
    text-align: center; /* 중앙 정렬 */
  }

  .faqTable th:nth-child(4), /* 작성일 */
  .faqTable td:nth-child(4) {
    width: 80px; 
    text-align: center; /* 중앙 정렬 */
  }

  .faqTable th:nth-child(5), /* 답변 여부 */
  .faqTable td:nth-child(5) {
    width: 60px; 
    text-align: center; /* 중앙 정렬 */
  }

  /* <td>에 스타일 적용 */
  .faqTable td {
    height: 20px; /* 셀 높이 고정 */
    overflow: hidden; /* 넘치는 내용 잘리기 */
    text-overflow: ellipsis; /* 넘친 텍스트는 '...'으로 표시 */
    white-space: nowrap; /* 텍스트가 줄바꿈 되지 않도록 설정 */
    padding: 8px;
    text-align: center; /* 중앙 정렬 */
    border: 1px solid #ddd; /* 테두리 */
  }



  .materTable {
    width: 100%; /* 테이블 너비 고정 */
    table-layout: fixed; /* 테이블 셀의 크기를 고정하여 자동 크기 조정 방지 */
    border-collapse: collapse; /* 테이블 셀 테두리 겹침 제거 */
  }

  /* <th>에 스타일 적용 */
  .materTable th {
    font-size: 15px;
    overflow: hidden; /* 넘치는 내용 잘리기 */
    text-overflow: ellipsis; /* 넘친 텍스트는 '...'으로 표시 */
    white-space: nowrap; /* 텍스트가 줄바꿈 되지 않도록 설정 */
    padding: 8px;
    text-align: center; /* 중앙 정렬 */
    border: 1px solid #ddd; /* 테두리 */
    background-color: #f4f4f4; /* 배경색 */
  }

  /* 각 열의 너비를 다르게 설정 */
  .materTable th:nth-child(1), /* 첫 번째 열 (번호) */
  .materTable td:nth-child(1) {
    width: 40px; /* 번호 열의 너비 */
    text-align: center; /* 중앙 정렬 */
  }

  .materTable th:nth-child(2), /* 두 번째 열 (종류) */
  .materTable td:nth-child(2) {
    width: 60px; /* 종류 열의 너비 */
    text-align: center; /* 중앙 정렬 */
  }

  .materTable th:nth-child(3), /* 세 번째 열 (이름) */
  .materTable td:nth-child(3) {
    width: 120px; /* 이름 열의 너비 */
    text-align: center; /* 중앙 정렬 */
  }

  .materTable th:nth-child(4), /* 네 번째 열 (탄소배출량) */
  .materTable td:nth-child(4) {
    width: 100px; /* 탄소배출량 열의 너비 */
    text-align: center; /* 중앙 정렬 */
  }

  .materTable th:nth-child(5), /* 다섯 번째 열 (가격) */
  .materTable td:nth-child(5) {
    width: 80px; /* 가격 열의 너비 */
    text-align: center; /* 중앙 정렬 */
  }

  .materTable th:nth-child(6), /* 여섯 번째 열 (강도) */
  .materTable td:nth-child(6) {
    width: 80px; /* 강도 열의 너비 */
    text-align: center; /* 중앙 정렬 */
  }

  .materTable th:nth-child(7), /* 일곱 번째 열 (설명) */
  .materTable td:nth-child(7) {
    width: 260px; /* 설명 열의 너비 */
    text-align: center; /* 중앙 정렬 */
  }

  .materTable th:nth-child(8), /* 여덟 번째 열 (대체자재여부) */
  .materTable td:nth-child(8) {
    width: 80px; /* 대체자재여부 열의 너비 */
    text-align: center; /* 중앙 정렬 */
  }

  /* <td>에 스타일 적용 */
  .materTable td {
    height: 20px; /* 셀 높이 고정 */
    overflow: hidden; /* 넘치는 내용 잘리기 */
    text-overflow: ellipsis; /* 넘친 텍스트는 '...'으로 표시 */
    white-space: nowrap; /* 텍스트가 줄바꿈 되지 않도록 설정 */
    padding: 8px;
    text-align: center; /* 중앙 정렬 */
    border: 1px solid #ddd; /* 테두리 */
  }

/* sjm Zone 영역 전개 */

/* index 꾸미 */
.sb-topnav{
	background-color: green !important;
}

.sb-sidenav-menu{
	background-color: green;
}

/* nav a태그 꾸미기 */
.nav a::after{
	content: "";
	position: absolute;
	left: 0;
	bottom: -2px;
	width: 0;
	height: 2px;
	background: #36c684;
	transition: width 0.4s ease; /* 부드러운 애니메이션 */
}
.nav a:hover::after {
	width: 80%; /* 밑줄 확장 */
}
</style>

<!-- 한글 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">

</head>
<body class="sb-nav-fixed" style="font-family: 'Noto Sans KR', sans-serif;">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-primary">
		<!-- Navbar Brand-->
		<a class="navbar-brand" style="text-align: start; margin: 40px 0px 0px 15px;" href="home">
			<img src="img/logo-1-remove.png" alt="Logo" style="width:70%; height: 60px;">
		</a>
		<!-- 
		Sidebar Toggle
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		 -->
	</nav>

	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			 <nav
            class="sb-sidenav accordion sb-sidenav-dark bg-primary text-white"
            id="sidenavAccordion">
            <div class="sb-sidenav-menu">
               <div class="nav" style="font-size: 30px; color: black; padding-top: 30px;">
                  <a class="nav-link" style="color: white; padding-top: 30px;" href="${pageContext.request.contextPath}/myPage"> 마이페이지 </a> 
                  <c:if test="${sessionScope.login.userAccount == 'C'}">
                  <a class="nav-link" style="color: white; padding-top: 15px;" href="${pageContext.request.contextPath }/companyEditView"> 수정 </a> 
                  </c:if>
                  <c:if test="${sessionScope.login.userAccount != 'C'}">
                  <a class="nav-link" style="color: white; padding-top: 15px;" href="${pageContext.request.contextPath }/personalEditView"> 수정 </a> 
                  </c:if>
                  <c:if test="${sessionScope.login.userAccount == 'C'}">
                  	  <c:if test="${sessionScope.login.userRank == 'M'}">
	                  	<a class="nav-link" style="color: white; padding-top: 15px;" href="${pageContext.request.contextPath }/companyBoardWriteView"> 홍보 </a>
	                  </c:if>
	                  <c:if test="${sessionScope.login.userRank == 'N'}">
	                  	<a class="nav-link" style="color: white; padding-top: 15px;" href="${pageContext.request.contextPath }/noinjungCompany"> 홍보 </a>
	                  </c:if>
                  </c:if>
                  
                  <c:if test="${sessionScope.login.userRank == 'Y' || sessionScope.login.userRank == 'K' || sessionScope.login.userRank == 'L'  }">
                     <a class="nav-link" style="color: white; padding-top: 15px;" href="${pageContext.request.contextPath }/adminPage">관리자페이지</a>
                  </c:if>
                  	  <div style="margin: 10px; margin-left:0; padding-right: 100px;"><a class="nav-link" style="color: white; font-size: 20px;'" href="${pageContext.request.contextPath }/logoutDo">로그아웃</a></div> 
               </div>
            </div>
         </nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4"><a style="text-decoration: none; color: inherit;" href="${pageContext.request.contextPath }/adminPage">관리자페이지</a></h1>

					<div class="row">
						<%-- <div class="col-xl-4 col-lg-5">
							<div class="card mb-4">
								<div class="card-header">프로필</div>
								<div class="card-body" style="height: 330px;">
									<!-- 프로필 이미지 -->
									<div class="d-flex justify-content-center">
										<div
											class="profile-div d-flex justify-content-center align-items-center">
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
										</div>
										
									</div>
									<div class="d-flex justify-content-center"
										style="font-size: 40px; font-weight: bold; margin-top: 30px;">${sessionScope.login.userName }</div>
								</div>
							</div>
						</div> --%>
<!-- 						<div class="col-xl-4 col-lg-5">
							<div class="card mb-4">
								<div class="card-header">차트</div>
								<div class="card-body" style="height: 330px;">
								
								</div>
							</div>
						</div> -->
					</div>
					
					
					<div class="card mb-4">
						<div class="card-header">회원관리</div>
						<div class="card-body">
							<table class="userTable" id="datatablesSimple">
								<thead>
									<tr>
										<th>회원ID</th>
										<th>이름</th>
										<th>이메일</th>
										<th>가입일</th>
										<th>기업여부</th>
										<th>인증</th>
										<th>관리자권한</th>
									</tr>
								</thead>
								<tbody>
									
									<c:forEach items="${userList}" var="user">
										<tr>
											<td scope="row">${user.userId }</td>
											<td>${user.userName }</td>
											<td>
											    <a href="https://mail.google.com/mail/?view=cm&fs=1&to=${user.userEmail}" target="_blank">${user.userEmail}</a>
											</td>
											<td>${user.userDate }</td>
											<td>
												<c:if test="${user.userAccount == 'C' }">기업</c:if>
												<c:if test="${user.userAccount == 'P' }">개인</c:if>
											</td>
											<td>
											<c:if test="${user.userAccount == 'C'}">
												<c:if test="${user.userRank == 'M'}">
															<form action="${pageContext.request.contextPath }/userProDo" method="POST" id="checkFormB">
																<input type="hidden" name="userId" value="${user.userId}">
																<input type="hidden" name="userName" value="${user.userName}">
															    	<button class="btn btn-danger btn-xl" id="checkBtnB" type="submit" style="height: 23px; font-size: 15px; display: flex; justify-content: center; align-items: center; line-height: 23px; width: auto; margin: 0 auto;">미인증기업</button>
															</form>
													</c:if>
													
													<c:if test="${user.userRank == 'N'}">
														<form action="${pageContext.request.contextPath }/userDelDo" method="POST" id="checkFormA">
															<input type="hidden" name="userId" value="${user.userId}">
															<input type="hidden" name="userName" value="${user.userName}">
															    <button class="btn btn-primary btn-xl" id="checkBtnA" type="submit" style="height: 23px; font-size: 15px; display: flex; justify-content: center; align-items: center; line-height: 23px; width: auto; margin: 0 auto;">인증기업</button>
														</form>
													</c:if>
													
													<c:if test="${user.userRank == 'L'}">
														<form action="${pageContext.request.contextPath }/userDo" method="POST" id="checkFormA">
															<input type="hidden" name="userId" value="${user.userId}">
															<input type="hidden" name="userName" value="${user.userName}">
															    <button class="btn btn-primary btn-xl" disabled="disabled" type="submit" style="height: 23px; font-size: 15px; display: flex; justify-content: center; align-items: center; line-height: 23px; width: auto; margin: 0 auto;">관리자</button>
														</form>
													</c:if>
													
													<c:if test="${user.userRank == 'K'}">
														<form action="${pageContext.request.contextPath }/userLDo" method="POST" id="checkFormA">
															<input type="hidden" name="userId" value="${user.userId}">
															<input type="hidden" name="userName" value="${user.userName}">
															    <button class="btn btn-primary btn-xl"  disabled="disabled" type="submit" style="height: 23px; font-size: 15px; display: flex; justify-content: center; align-items: center; line-height: 23px; width: auto; margin: 0 auto;">관리자</button>
														</form>
													</c:if>
												</c:if>
												<c:if test="${user.userAccount == 'P'}">
												<c:if test="${user.userRank == 'N'}">
															    	<button class="btn btn-warning btn-xl" disabled="disabled" type="submit" style="height: 23px; font-size: 15px; display: flex; justify-content: center; align-items: center; line-height: 23px; width: auto; margin: 0 auto;">일반회원</button>
													</c:if>
													
													<c:if test="${user.userRank == 'M'}">
															    <button class="btn btn-warning btn-xl" disabled="disabled" type="submit" style="height: 23px; font-size: 15px; display: flex; justify-content: center; align-items: center; line-height: 23px; width: auto; margin: 0 auto;">일반회원</button>
													</c:if>
													
													<c:if test="${user.userRank == 'L'}">
															    <button class="btn btn-primary btn-xl" disabled="disabled" type="submit" style="height: 23px; font-size: 15px; display: flex; justify-content: center; align-items: center; line-height: 23px; width: auto; margin: 0 auto;">관리자</button>
													</c:if>
													
													<c:if test="${user.userRank == 'K'}">
															    <button class="btn btn-primary btn-xl" disabled="disabled" type="submit" style="height: 23px; font-size: 15px; display: flex; justify-content: center; align-items: center; line-height: 23px; width: auto; margin: 0 auto;">관리자</button>
													</c:if>
												</c:if>
												<c:if test="${user.userRank == 'Y'}">
													<button class="btn btn-primary btn-xl" disabled="disabled" style="height: 23px; font-size: 15px; display: flex; justify-content: center; align-items: center; line-height: 23px; width: auto; margin: 0 auto;">총괄 관리자</button>
												</c:if>
											</td>
											
											
											<td>
												<c:if test="${user.userRank == 'N'}">
														<form action="${pageContext.request.contextPath }/userLDo" method="POST" id="checkFormB">
															<input type="hidden" name="userId" value="${user.userId}">
															<input type="hidden" name="userName" value="${user.userName}">
														    <c:if test="${sessionScope.login.userRank == 'Y' }">
														    	<button class="btn btn-warning btn-xl" id="checkBtnB" type="submit" style="height: 23px; font-size: 15px; display: flex; justify-content: center; align-items: center; line-height: 23px; width: auto; margin: 0 auto;">일반회원</button>
															</c:if>
															<c:if test="${sessionScope.login.userRank == 'K' || sessionScope.login.userRank == 'L' }">
															    <button class="btn btn-warning btn-xl" type="submit" disabled="disabled" style="height: 23px; font-size: 15px; display: flex; justify-content: center; align-items: center; line-height: 23px; width: auto; margin: 0 auto;">일반회원</button>
															</c:if>
														</form>
												</c:if>
												
												<c:if test="${user.userRank == 'L'}">
													<form action="${pageContext.request.contextPath }/userDelDo" method="POST" id="checkFormA">
														<input type="hidden" name="userId" value="${user.userId}">
														<input type="hidden" name="userName" value="${user.userName}">
														<c:if test="${sessionScope.login.userRank == 'Y' }">
														    <button class="btn btn-primary btn-xl" id="checkBtnA" type="submit" style="height: 23px; font-size: 15px; display: flex; justify-content: center; align-items: center; line-height: 23px; width: auto; margin: 0 auto;">관리자</button>
														</c:if>
														<c:if test="${sessionScope.login.userRank == 'K' || sessionScope.login.userRank == 'L' }">
														    <button class="btn btn-primary btn-xl" type="submit" disabled="disabled" style="height: 23px; font-size: 15px; display: flex; justify-content: center; align-items: center; line-height: 23px; width: auto; margin: 0 auto;">관리자</button>
														</c:if>
													</form>
												</c:if>
												
												<c:if test="${user.userRank == 'K'}">
													<form action="${pageContext.request.contextPath }/userProDo" method="POST" id="checkFormA">
														<input type="hidden" name="userId" value="${user.userId}">
														<input type="hidden" name="userName" value="${user.userName}">
														<c:if test="${sessionScope.login.userRank == 'Y' }">
														    <button class="btn btn-primary btn-xl" id="checkBtnA" type="submit" style="height: 23px; font-size: 15px; display: flex; justify-content: center; align-items: center; line-height: 23px; width: auto; margin: 0 auto;">관리자</button>
														</c:if>
														<c:if test="${sessionScope.login.userRank == 'K' || sessionScope.login.userRank == 'L' }">
														    <button class="btn btn-primary btn-xl" type="submit" disabled="disabled" style="height: 23px; font-size: 15px; display: flex; justify-content: center; align-items: center; line-height: 23px; width: auto; margin: 0 auto;">관리자</button>
														</c:if>
													</form>
												</c:if>
												
												<c:if test="${user.userRank == 'M'}">
													<form action="${pageContext.request.contextPath }/userDo" method="POST" id="checkFormA">
														<input type="hidden" name="userId" value="${user.userId}">
														<input type="hidden" name="userName" value="${user.userName}">
														<c:if test="${sessionScope.login.userRank == 'Y' }">
														    <button class="btn btn-warning btn-xl" id="checkBtnA" type="submit" style="height: 23px; font-size: 15px; display: flex; justify-content: center; align-items: center; line-height: 23px; width: auto; margin: 0 auto;">일반회원</button>
														</c:if>
														<c:if test="${sessionScope.login.userRank == 'K' || sessionScope.login.userRank == 'L' }">
														    <button class="btn btn-warning btn-xl" type="submit" disabled="disabled" style="height: 23px; font-size: 15px; display: flex; justify-content: center; align-items: center; line-height: 23px; width: auto; margin: 0 auto;">일반회원</button>
														</c:if>
													</form>
												</c:if>
												<c:if test="${user.userRank == 'Y'}">
													<button class="btn btn-primary btn-xl" disabled="disabled" style="height: 23px; font-size: 15px; display: flex; justify-content: center; align-items: center; line-height: 23px; width: auto; margin: 0 auto;">총괄 관리자</button>
												</c:if>
											</td>
										</tr>
									</c:forEach>
									
								</tbody>
							</table>
						</div>
					</div>
					
					<div class="card mb-4">
					    <div class="card-header">건의사항 관리</div>
					    <div class="card-body">
					
					        <table class="faqTable" id="datatablesEarnings" style="width:100%;">
					            <thead>
					                <tr>
					                    <th>글번호</th>
					                    <th>글제목</th>
					                    <th>작성자</th>
					                    <th>작성일</th>
					                    <th>답변 여부(정렬)</th>
					                </tr>
					            </thead>
					            <tbody>
					                <c:forEach items="${faqList}" var="faq">
					                    <!-- FAQ의 faqAst 값으로 미답변/답변완료 상태를 구분 -->
					                    <tr class="faq-row" data-status="${faq.faqAst}">
					                        <td scope="row">${faq.faqNo}</td>
					                        <td><a href="<c:url value="/faqDetailView?faqNo=${faq.faqNo}"/>">${faq.faqTitle}</a></td>
					                        <td>${faq.userName}</td>
					                        <td>${faq.faqDate}</td>
					                        <td>
					                            <c:if test="${faq.faqAst == 'N'}">
					                                <form action="${pageContext.request.contextPath }/faqAstDo" method="POST" id="checkFormN">
					                                    <input type="hidden" name="faqNo" value="${faq.faqNo}">
					                                    <button class="btn btn-warning btn-xl" id="checkBtnN" type="submit" style="height: 23px; font-size: 15px; display: flex; justify-content: center; align-items: center; line-height: 23px; width: auto; margin: 0 auto;">답변대기</button>
					                                </form>
					                            </c:if>
					                            <c:if test="${faq.faqAst == 'Y'}">
					                                <form action="${pageContext.request.contextPath }/faqAstDelDo" method="POST" id="checkFormY">
					                                    <input type="hidden" name="faqNo" value="${faq.faqNo}">
					                                    <button class="btn btn-primary btn-xl" id="checkBtnY" type="submit" style="height: 23px; font-size: 15px; display: flex; justify-content: center; align-items: center; line-height: 23px; width: auto; margin: 0 auto;">답변완료</button>
					                                </form>
					                            </c:if>
					                        </td>
					                    </tr>
					                </c:forEach>
					            </tbody>
					        </table>
					    </div>
					</div>
					
					
					<div class="card mb-4">
						<div class="card-header">자재 관리</div>
						<div class="card-body">
							<table class="materTable" id="datatablesOrders" style="width:100%; background-color: inherit;">
							    <thead>
							        <tr>
							            <th>번호</th>
							            <th>종류</th>
							            <th>이름</th>
							            <th>탄소배출량</th>
							            <th>가격</th>
							            <th>강도</th>
							            <th>설명</th>
							            <th>대체자재여부</th>
							            
							        </tr>
							    </thead>
							    <tbody>
							        <c:forEach items="${allMatter}" var="mater">
							            <tr>
							                <td scope="row">${mater.materNo}</td>
							                <td>${mater.materCategory}</td>
							                <td>
							                <a href="${pageContext.request.contextPath}/adminMateEditView?materNo=${mater.materNo}">${mater.materName}</a>
							                </td>
							                <td>${mater.materGasKg}</td>
							                <td>${mater.materPrice}</td>
							                <td>${mater.materDurability}</td>
							                <td>${mater.materInfo}</td>
							                <td>${mater.materClassify}</td>
							                
							            </tr>
							        </c:forEach>
							    </tbody>
							</table>
							<a href="${pageContext.request.contextPath }/materWriteView">
								<button class="btn btn-success btn-xl m-right">자재추가</button>
							</a>
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
    document.addEventListener('DOMContentLoaded', function() {
		new simpleDatatables.DataTable("#datatablesSimple", {
			perPage: 5,
			searchable: true,
			sortable: true,
		});
        // 기존 견적 목록 (myEarnings)
        new simpleDatatables.DataTable("#datatablesEarnings", {
            perPage: 5,
            searchable: true,
            sortable: true,
        });

        // 새로운 주문 목록 (myOrders)
        new simpleDatatables.DataTable("#datatablesOrders", {
            perPage: 5,
            searchable: true,
            sortable: true,
        });
		
		let v_datatableDropdown = document.querySelectorAll(".datatable-dropdown");
		
		console.log(v_datatableDropdown.length)
		
		for (let i = 0; i < v_datatableDropdown.length; i++){
			let v_changeText = v_datatableDropdown[i].querySelector("label");
			
			v_changeText.innerHTML = v_changeText.innerHTML.replace("entries per page", "표시할 게시글 수를 선택하세요");
		}
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
	<script>
    // 페이지가 로드된 후 차트를 생성
    window.onload = function() {
        var ctx = document.getElementById('myDoughnutChart').getContext('2d');
        var myDoughnutChart = new Chart(ctx, {
            type: 'doughnut',  // 도넛 차트 타입
            data: {
                labels: ['탄소배출권 사용량', '남은 탄소배출권'],  // 각 구역의 레이블
                datasets: [{
                    label: 'My Doughnut Chart',  // 차트의 라벨
                    data: [80, 20],  // 각 구역의 값 (각각의 섹터 크기)
                    backgroundColor: ['#FF6384', '#36A2EB'],  // 각 구역의 색상
                    hoverBackgroundColor: ['#FF4560', '#4D9EEC'],  // 마우스 호버 색상
                }]
            },
            options: {
                responsive: true,  // 화면 크기에 맞춰서 차트 크기 조정
                plugins: {
                    legend: {
                        position: 'top',  // 범례 위치
                    },
                    tooltip: {
                        enabled: true,  // 툴팁 표시 여부
                    }
                }
            }
        });
    };
</script>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

</body>
</html>
