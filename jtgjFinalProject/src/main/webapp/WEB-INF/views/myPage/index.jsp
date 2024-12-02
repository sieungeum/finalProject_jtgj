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
<title>마이페이지</title>
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
                  <c:if test="${sessionScope.login.userAccount == 'C'}">
                  <a class="nav-link" style="color: white; padding-top: 30px;" href="${pageContext.request.contextPath }/companyEditView"> 수정 </a> 
                  </c:if>
                  <c:if test="${sessionScope.login.userAccount != 'C'}">
                  <a class="nav-link" style="color: white; padding-top: 30px;" href="${pageContext.request.contextPath }/personalEditView"> 수정 </a> 
                  </c:if>
                  <c:if test="${sessionScope.login.userRank == 'M' || sessionScope.login.userRank == 'Y' || sessionScope.login.userRank == 'K' }">
                  <a class="nav-link" style="color: white; padding-top: 30px;" href="${pageContext.request.contextPath }/companyBoardWriteView"> 홍보 </a>
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
					<h1 class="mt-4"><a style="text-decoration: none; color: inherit;" href="${pageContext.request.contextPath }/myPage">마이페이지</a></h1>

					<div class="row">
						
						<div class="col-xl-4 col-lg-5">
							<div class="card mb-4">
								<div class="card-header">프로필</div>
								<div class="card-body" style="height: 330px;">
									<!-- 프로필 이미지 -->
									<div class="d-flex justify-content-center">
										<div class="profile-div d-flex justify-content-center align-items-center">
											<c:if test="${sessionScope.login.userProfImg == 'N' }">
												<c:if test="${sessionScope.login.userAccount == 'P' }">
													<a href="${pageContext.request.contextPath }/personalEditView">
														<img src="img/default_img.png" class="profile-img">
													</a>
												</c:if>
												<c:if test="${sessionScope.login.userAccount == 'C' }">
													<a href="${pageContext.request.contextPath }/companyEditView">
														<img src="img/default_img.png" class="profile-img">
													</a>
												</c:if>
											</c:if>
											<c:if test="${sessionScope.login.userProfImg != 'N' }">
												<c:if test="${sessionScope.login.userAccount == 'P' }">
													<a href="${pageContext.request.contextPath }/personalEditView">
														<img src="<c:url value="/displayProfImg?atchtype=prof_img&imgName=${sessionScope.login.userProfImg }"/>" class="profile-img">
													</a>
												</c:if>
												<c:if test="${sessionScope.login.userAccount == 'C' }">
													<a href="${pageContext.request.contextPath }/companyEditView">
														<img src="<c:url value="/displayProfImg?atchtype=prof_img&imgName=${sessionScope.login.userProfImg }"/>" class="profile-img">
													</a>
												</c:if>
											</c:if>
										</div>
										
									</div>
									<div class="d-flex justify-content-center" style="font-size: 30px; font-weight: bold; margin-top: 30px;">${sessionScope.login.userName }</div>
									<div><a style="margin-left: 70%;" href="${pageContext.request.contextPath }/logoutDo">로그아웃</a></div>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-lg-5">
							<div class="card mb-4">
								<div class="card-header">차트</div>
								<div class="card-body" style="height: 330px;">
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-lg-5">
							<div class="card mb-4">
								<div class="card-header">탄소배출권</div>
								<div class="card-body" style="height: 330px;">
									<div class="container d-flex justify-content-center" style="width: 100%; height: 100%;">
										<canvas id="myDoughnutChart" width="400" height="400"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div> 
					<div class="card mb-4">
						<div class="card-header">내 게시글</div>
						<div class="card-body">
							<table class="faqTable" id="datatablesSimple">
								<thead>
									<tr>
										<th>글번호</th>
										<th>글제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>답변여부</th>
										
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${notiList }" var="noti">
										<c:if test="${noti.userId == sessionScope.login.userId }">
										<tr>
											<td scope="row">공지사항</td>
											<td><a href="${pageContext.request.contextPath }/noticeDetailView?noticeNo=${noti.noticeNo}">${noti.noticeTitle }</a></td>
											<td>${noti.userName }</td>
											<td>${noti.noticeDate }</td>
											<td></td>
										</tr>
										</c:if>
									</c:forEach>
								
								
								
									<c:forEach items="${faqList}" var="faq">
										<c:if test="${faq.userId == sessionScope.login.userId }">
											<tr>
												<td scope="row">${faq.faqNo }</td>
												<td><a href="<c:url value="/faqDetailView?faqNo=${faq.faqNo }"/>">${faq.faqTitle }</a></td>
												<td>${faq.userName }</td>
												<td>${faq.faqDate }</td>
												<td>
												<c:if test="${faq.faqAst == 'N'}">
															<form action="${pageContext.request.contextPath }/faqAstDo" method="POST" id="checkFormN">
																<input type="hidden" name="faqNo" value="${faq.faqNo}">
															    	<button class="btn btn-primary btn-xl" id="checkBtnN" type="submit" disabled style="height: 23px; font-size: 15px; display: flex; justify-content: center; align-items: center; line-height: 23px; width: auto; margin: 0 auto;">미답변</button>
															</form>
													</c:if>
													
													<c:if test="${faq.faqAst == 'Y'}">
														<form action="${pageContext.request.contextPath }/faqAstDelDo" method="POST" id="checkFormY">
															<input type="hidden" name="faqNo" value="${faq.faqNo}">
															    <button class="btn btn-primary btn-xl" id="checkBtnY" type="submit" disabled style="height: 23px; font-size: 15px; display: flex; justify-content: center; align-items: center; line-height: 23px; width: auto; margin: 0 auto;">답변완료</button>
														</form>
													</c:if>
												
												</td>
											</tr>
										</c:if>
									</c:forEach>
									
								</tbody>
							</table>
						</div>
					</div>
					
					<!-- WARING WARING THIS IS "SJM ZONE" DON'T TOUCH -->
					<div class="card mb-4">
						<div class="card-header">내 견적</div>
						<div class="card-body">
							<table id="datatablesEarnings"  style="width:100%">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">견적</th>
										<th scope="col">작성자</th>
										<th scope="col">작성일</th>
									</tr>
								</thead>

								<tbody>
									
									<tr>
										<td>1</td>
										<td>젠장</td>
										<td>티치</td>
										<td>인도네시아</td>
									</tr>
									
								</tbody>
							</table>
						</div>
					</div>
					<!-- WARING WARING THIS IS "SJM ZONE" DON'T TOUCH -->
					
					<c:if test="${sessionScope.login.userAccount == 'C' && sessionScope.login.userAccount != null}">
					<div class="card mb-4">
						<div class="card-header">기업 홍보</div>
						<div class="card-body">
							<table id=""  style="width:100%">
								<thead>
									<tr>
										<th scope="col">포트폴리오</th>
										
									</tr>
								</thead>

								<tbody>
									
									<tr>
										<td>어서와</td>
										
									</tr>
									
								</tbody>
							</table>
						</div>
					</div>
					</c:if>
					
					
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
    // Datatable 초기화
    document.addEventListener('DOMContentLoaded', function() {
        new simpleDatatables.DataTable("#datatablesEarnings", {
            perPage: 5,
            searchable: true,
            sortable: true,
        });
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
</body>
</html>
