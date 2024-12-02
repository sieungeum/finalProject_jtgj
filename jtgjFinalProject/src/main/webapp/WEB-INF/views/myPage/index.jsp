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
  
/* sjm Zone 영역 전개 */

.only-flex{
	display:flex;
}
/* 오버레이 스타일 */
.overlay {
	display: none; /* 기본적으로 숨김 */
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5); /* 반투명 어두운 배경 */
	z-index: 990; /* 모달 아래 */
}
.overlay.show {
  display: block;
}


/* 계산 */
.cal-ml{
	margin-left: 5px;
}
.cal-mr{
	margin-right: 5px;
}

.calculate-box{
	display: flex;
	flex-direction: column;
	
}

.cal-subtitle{
	width: 110px;
}

.calculate-sort{
	display: flex;
}

.cal-result-style{
	width: 300px;
	
	margin-bottom: 5px;
	margin-left: 5px;
	
	text-align: end;
	
	border: 1px solid black;
	border-radius: 7px;
}

.cal-btn-box{
	margin-top: 20px;
	
	text-align: end;
}

/* 계산 후 모달 */

.modal-box__cancel{
	position: sticky;
	
	top: 10px;
	
	text-align: end;
	
	margin: 10px 10px 0px 0px;
}

.modal-box_sort{
	display: flex;
	
	width: 100%;
	
	margin: 10px 0px 0px 10px;
	
}

.compare-percent__result{
	display: flex;
	
	width: 100%;
	
}

.modal-box__cal{
	display: none;
	position: fixed;
	z-index: 999;
	
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	
	width: 740px;
	height: 80%;
	
	background-color: #fff;
	
	border: 3px solid black;
	border-radius: 8px;
	
}

.mat-box__half{
	width: 100%;
}
.mat-box__flow-y{
	width: 100%;
	max-height: 450px;
	overflow-y: auto;
}
.mat-box{
	width: 100%;
	
	margin-right: 10px;
}

.select-mat{
	margin: 5px 5px 5px 5px;
}
.select-mat__category{
	display: inline-block;
	
	padding: 3px 6px 3px 6px;
	
	background-color: yellowgreen;
	border: 1px solid green;
	border-radius: 10px;
	
	color: white;
	font-size: 17px;
	font-weight: 500;
}

.cal-before{
	margin-right: 15px;
}

.cal-after{
	color: red;
}

.result-type-box{
	display: flex;	
}

.result-type-margin{
	
	margin-left: 7px;
}

.range-header{
	display:flex;
	justify-content: space-between;
}

.modal-box__result-btn{
	display: flex;
	justify-content: center;
	
	margin-top: 20px;
	margin-left: 15px;
}

.final-btn{
	margin-right: 8px;
}


/* 제목 입력 모달(저장) */
.title-modal{
	display: none;
	position: fixed;
	z-index: 999;
	
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	
	width: 320px;
	
	background-color: #fff;
	
	border: 3px solid black;
	border-radius: 8px;
	
}

.title-modal__flex{
	display: flex;
	flex-direction: column;
	
	width: 100%;
}

.title-modal__input{
	width: 80%;
	
	margin: 8px 0px 0px 15px;
}
#titleInput {
	height: 35px;
}

.title-modal__btn{
	display: flex;
	justify-content: end;
	
	margin: 10px 10px 8px 0px;
}
#titleModalSave{
	margin-right: 8px;
}

/* 제목 입력 모달(다운) */
.title-modal-down{
	display: none;
	position: fixed;
	z-index: 999;
	
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	
	width: 320px;
	height: 20%;
	
	background-color: #fff;
	
	border: 3px solid black;
	border-radius: 8px;
	
}

.title-modal__flex-down{
	display: flex;
	flex-direction: column;
}

.title-modal__btn-down{
	display: flex;
	justify-content: end;
	
}

</style>

<!-- sjm Zone 영역 전개 -->
<link rel="stylesheet" href="css/sjm/sjm-custom.css">

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
						<div id="estiCard" class="card-body">
							<table id="datatablesEarnings" >
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">견적명</th>
										<th scope="col">평수</th>
										<th scope="col">작성일</th>
									</tr>
								</thead>

								<tbody>
									<!-- javascript 에서 추가됨 -->
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
	<!-- Finally Calculate Modal -->
	<div class="overlay"></div>
	<div class="modal-box__cal">
	
		<!-- 닫기 버튼 -->
		<div class="modal-box__cancel">
			<img
				id="calModalCancel"
				src="${pageContext.request.contextPath}/img/mat-category/cancel_modal.png"
				width="25px">
		</div><!-- 닫기 버튼 -->
		
		<!-- 선택한 자제, 대체 자제 -->
		<div class="only-flex">
			<!-- 결과 모달창 -->
			<div class="modal-box_sort mat-box__flow-y">
				<!-- 기본 자제 -->
				<div class="mat-box__half">
					<div class="mat-box">
						<div class="select-mat">
							<div>외장재</div>
							<!-- div 생성 후 안에 대체 자제명, input__hidden으로 갯수 추가됨 -->
						</div>
						<div class="select-mat">
							<div>지붕재</div>
							<!-- div 생성 후 안에 대체 자제명, input__hidden으로 갯수 추가됨 -->
						</div>
						<div class="select-mat">
							<div>창호재</div>
							<!-- div 생성 후 안에 대체 자제명, input__hidden으로 갯수 추가됨 -->
						</div>
						<div class="select-mat">
							<div>거실</div>
							<!-- div 생성 후 안에 대체 자제명, input__hidden으로 갯수 추가됨 -->
						</div>
					</div> <!-- 기본 자제 -->
				</div>
				
				<div class="mat-box__half">
					<!-- 대체 자제 -->
					<div class="mat-box">
						<div class="select-mat">
							<div>외장재</div>
							<!-- div 생성 후 안에 대체 자제명, input__hidden으로 갯수 추가됨 -->
						</div>
						<div class="select-mat">
							<div>지붕재</div>
							<!-- div 생성 후 안에 대체 자제명, input__hidden으로 갯수 추가됨 -->
						</div>
						<div class="select-mat">
							<div>창호재</div>
							<!-- div 생성 후 안에 대체 자제명, input__hidden으로 갯수 추가됨 -->
						</div>
						<div class="select-mat">
							<div>거실</div>
							<!-- div 생성 후 안에 대체 자제명, input__hidden으로 갯수 추가됨 -->
						</div>
					</div> <!-- 대체 자제 -->
				</div>
				
			</div>
			
		</div>
		
		<div class="modal-box_sort">
			<!-- 기본 자제 최종 가격, 탄소배출량 -->
			<div class="mat-box__half">
				<!-- 탄소, 가격 변경사항 -->
				<div class="compare-percent-box">
					
					<!-- 탄소배출량 -->
					<div class="compare-percent__carbon">
						<div>탄소배출량</div>
						<div class="compare-percent__result">
							<!-- 기본 자제 총 탄소배출량 -->
							<div class="cal-before"></div>
						</div>
					</div>
					
					<!-- 가격 -->
					<div class="compare-percent__price">
						<div>가격</div>
						<div class="compare-percent__result">
							<!-- 기본 자제 총 가격 -->
							<div class="cal-before"></div>
						</div>
					</div>
					
				</div>
			</div>
			
			<!-- 대체 자제 최종 가격, 탄소배출량 -->
			<div class="mat-box__half">
				<!-- 탄소, 가격 변경사항 -->
				<div class="compare-percent-box">
					
					<!-- 탄소배출량 -->
					<div class="compare-percent__carbon">
						<div>탄소배출량</div>
						<div class="compare-percent__result">
							<!-- 기본 자제 총 탄소배출량 -->
							<div class="cal-after"></div>
						</div>
					</div>
					
					<!-- 가격 -->
					<div class="compare-percent__price">
						<div>가격</div>
						<div class="compare-percent__result">
							<!-- 기본 자제 총 가격 -->
							<div class="cal-after"></div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="modal-box__result-btn">
			<!-- 초기화 버튼 -->
			<div id="estiDeleteBtn" class="sjm-btn sjm-btn-primary final-btn">
				삭제
			</div> <!-- 초기화 버튼 -->
		</div>
		
	</div> <!-- Finally Calculate Modal -->

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


	<script type="text/javascript">
		/* 영역 전개 "자리요" feat.SJM */
		let v_modalBoxCal = document.querySelector(".modal-box__cal"); // 전체 모달창
		let v_deleteNo = 0;
		
		const v_ajax = new XMLHttpRequest;
		v_ajax.open("POST", "${pageContext.request.contextPath}/userEstimate", false);
		v_ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		v_ajax.onload = () => {
			if (v_ajax.status == 200){
				let v_list = JSON.parse(v_ajax.response);
				
				console.log(v_list);
				
				/* estiNo 기준으로 묶기 */
				let v_estiNoDict = {};
				let v_noCategoryDict = {};
				
				/* 삭제 시 글번호가 정렬이 이상하게 되있어서 
				임시 글번호를 보여주고 진짜 글번호는 따로 저장 */
				let v_tempIdx = 1;
				let v_realNo = {};
				
				for (let i = 0; i < v_list.length; i++){
					if (v_estiNoDict[v_list[i]["estiNo"]] == null){
						v_estiNoDict[v_list[i]["estiNo"]] = [];
						v_estiNoDict[v_list[i]["estiNo"]].push(v_list[i]);
						
						v_noCategoryDict[v_list[i]["estiNo"]] = [];
						v_noCategoryDict[v_list[i]["estiNo"]].push(v_list[i]["materCategory"]);

						// 진짜 글번호 저장
						v_realNo[v_tempIdx] = v_list[i]["estiNo"];
						v_tempIdx++;
						
					} else {
						v_estiNoDict[v_list[i]["estiNo"]].push(v_list[i]);
						v_noCategoryDict[v_list[i]["estiNo"]].push(v_list[i]["materCategory"]);
					}
				}
				
				console.log(v_estiNoDict);
				
				// 정렬 기준 우선순위를 정의
				const priority = [
				    "외장재", "지붕재", "창호재", "거실",
				    "욕실1", "욕실2", "욕실3", "욕실4", "욕실5", 
				    "주방1", "주방2", "주방3", "주방4", "주방5", 
				    "방1", "방2", "방3", "방4", "방5"
				];

				// 정렬 함수
				function customSort(arr) {
				    return arr.sort((a, b) => {
				        // a와 b의 인덱스를 기준으로 비교
				        const aIndex = getPriorityIndex(a);
				        const bIndex = getPriorityIndex(b);

				        return aIndex - bIndex;
				    });
				}

				// 우선순위 인덱스를 얻는 함수
				function getPriorityIndex(item) {
				    // 정해진 우선순위 배열에 해당 항목이 있는지 확인
				    const staticIndex = priority.indexOf(item);
				    if (staticIndex !== -1) return staticIndex;

				    // 정해진 우선순위 배열에 없으면, 패턴으로 동적 처리
				    const dynamicMatch = item.match(/(욕실|방)(\d+)/);
				    if (dynamicMatch) {
				        const [_, type, number] = dynamicMatch;
				        const baseIndex = priority.indexOf(`${type}1`); // 기본 우선순위에서 해당 타입의 첫 번째 항목 위치
				        if (baseIndex !== -1) {
				            return baseIndex + parseInt(number, 10) - 1; // 숫자에 따라 순서 조정
				        }
				    }

				    // 우선순위가 없는 경우 마지막으로 정렬
				    return Number.MAX_SAFE_INTEGER;
				}

				// 정렬 실행
				for (let i of Object.keys(v_estiNoDict)){
					v_noCategoryDict[i] = [...new Set(v_noCategoryDict[i])];
					v_noCategoryDict[i] = customSort(v_noCategoryDict[i]);
				}
				console.log(v_noCategoryDict);
				
				// 왜인진 모르겠는데 html 코드에 id 든 class 든 추가해도 추가가 안됨. 그래서 근처 id 태그에서 접근 중
				let v_estiTableBody = document.getElementById("datatablesEarnings");
				
				// 순차적 글번호 생성
				let v_cnt = 1;

				for (let i of Object.keys(v_estiNoDict)){
					console.log("키값")
					console.log(i)
					
					let v_query = '';
						v_query += '<tr>';
						v_query += '	<td>' + v_cnt + '</td>';
						v_query += '	<td class="sjm-row-title">' + v_estiNoDict[i][0]["estiTitle"] + '</td>';
						v_query += '	<td>' + v_estiNoDict[i][0]["estiPyeong"] + '</td>';
						v_query += '	<td>' + v_estiNoDict[i][0]["estiDate"] + '</td>';
						v_query += '</tr>';
					
					v_estiTableBody.children[1].insertAdjacentHTML('afterbegin', v_query);
					
					// 순차적 글번호 생성
					v_cnt++;
				}
				
				console.log("왜 클릭 이벤트가 안됨");
				console.log(v_estiTableBody.children[1]);
				v_estiTableBody.addEventListener("click", () => {
					/* 테이블에서 테이블 헤더의 값과 데이블 바디의 값이 같은 것을 클릭 하는 용도 */
/* 					const target = event.target; // 클릭된 요소
					const children = Array.from(target.parentElement.children);
					const index = children.indexOf(target);
					
					// parent - 위 형제 - children - children[1].textContent
					let v_tableHeadEsti = event.target.parentElement.parentElement.previousElementSibling.children[0].children[index].textContent;
					
					console.log(v_tableHeadEsti);
					if (v_tableHeadEsti != "견적"){
						return;
					} */
					
					const v_nowNo = v_realNo[event.target.parentElement.children[0].innerHTML]; // 현재 견적번호
					v_deleteNo = v_nowNo; // 삭제 시 필요

					console.log("현재 글번호 : ", event.target.parentElement.children[0].innerHTML);
					console.log("진짜 글번호 : ", v_nowNo);
					console.log(v_estiNoDict[v_nowNo][0]["estiTitle"]);
					
					/* 최종 결과 계산 */
					
					// 주방1, 욕실 2 같은거 때문에 최종 결과 카테고리 div 추가
					let v_matBox = document.querySelectorAll(".mat-box"); // 기본 자제들, 대체 자제들
					
					for (let k = 0; k < v_matBox.length; k++){
						v_matBox[k].innerHTML = "";
						for (let cateIdx = 0; cateIdx < v_noCategoryDict[v_nowNo].length; cateIdx++){
							
							let v_query = ""
								v_query += '<div class="select-mat">'
								v_query += '	<div class="select-mat__category">' + v_noCategoryDict[v_nowNo][cateIdx] + '</div>'
								v_query += '</div>'
								
							v_matBox[k].innerHTML += v_query;
						}
					}

					/* 기본자제, 대체자제 모달창에 추가 */
					let v_basicCarbonSum = 0; // 기본 자제 총 탄소배출량
					let v_basicPriceSum = 0; // 기본 자제 총 가격
					let v_subCarbonSum = 0; // 대체 자제 총 탄소배출량
					let v_subPriceSum = 0; // 대체 자제 총 가격
					
					let v_selectMat = document.querySelectorAll(".select-mat"); // 각 카테고리별 자제들
					
					for (let i = 0; i < v_matBox[0].children.length; i++){
						// category 공백제거 div - div - div(카테고리명)
						let v_category = v_matBox[0].children[i].children[0].innerHTML.trim();
						
						let v_tempDiv = document.createElement("div"); // 한번 사용하면 두번 사용 못함 그래서 .cloneNode(true) 써줘야됨.
						if (v_matBox[0].children[i].children.length == 1){
							v_matBox[0].children[i].appendChild(v_tempDiv.cloneNode(true));
							v_matBox[1].children[i].appendChild(v_tempDiv.cloneNode(true));
						} else {
							v_matBox[0].children[i].children[1].remove();
							v_matBox[0].children[i].appendChild(v_tempDiv.cloneNode(true));
							v_matBox[1].children[i].children[1].remove();
							v_matBox[1].children[i].appendChild(v_tempDiv.cloneNode(true));
						}
						
						// 자제 정보 html에 추가
						for (let dataIdx = 0; dataIdx < v_estiNoDict[v_nowNo].length; dataIdx++){
							if (v_category == v_estiNoDict[v_nowNo][dataIdx]['materCategory']){
								
								if (v_estiNoDict[v_nowNo][dataIdx]['materClassify'] == "N"){
									
									// 기본 자제
									v_matBox[0].children[i].children[1].innerHTML += v_estiNoDict[v_nowNo][dataIdx]["materName"] + "<br>";

									// 기본 자제들 총 탄소, 가격
									let v_num = v_estiNoDict[v_nowNo][dataIdx]["kgPerPyeong"]; 
									v_basicCarbonSum += v_estiNoDict[v_nowNo][dataIdx]["materGasKg"] * v_num;
									v_basicPriceSum += v_estiNoDict[v_nowNo][dataIdx]["materPrice"] * v_num;
								} else {
									
									// 대체 자제
									v_matBox[1].children[i].children[1].innerHTML += v_estiNoDict[v_nowNo][dataIdx]["materName"] + "<br>";
									
									// 대체 자제들 총 탄소, 가격
									let v_num = v_estiNoDict[v_nowNo][dataIdx]["kgPerPyeong"];
									v_subCarbonSum += v_estiNoDict[v_nowNo][dataIdx]["materGasKg"] * v_num;
									v_subPriceSum += v_estiNoDict[v_nowNo][dataIdx]["materPrice"] * v_num;
								}
							}
						}
					}

					/* 기본 자제들 총합 */
					let v_calBefore = document.querySelectorAll(".cal-before");
					v_calBefore[0].innerHTML = parseFloat(v_basicCarbonSum.toFixed(2));
					v_calBefore[1].innerHTML = insertComma(v_basicPriceSum.toString());

					/* 대체 자제들 총합 */
					let v_calAfter = document.querySelectorAll(".cal-after");
					v_calAfter[0].innerHTML = parseFloat(v_subCarbonSum.toFixed(2));
					v_calAfter[1].innerHTML = insertComma( v_subPriceSum.toString());
					
					// 모달창 출력	
					document.querySelector(".overlay").classList.add("show");
					document.body.style.overflow = "hidden";
					v_modalBoxCal.style.display = "block";
				});
			}
		}
			
		v_ajax.send();
		
		/* 최종 결과 모달창 닫기 */
		let v_calModalCancel = document.getElementById("calModalCancel");
		
		v_calModalCancel.addEventListener("click", () => {
			document.querySelector(".overlay").classList.remove("show");
			document.body.style.overflow = "auto";
			v_modalBoxCal.style.display = "none";
		});
		
		
		/* 해당 견적 삭제 */
		let v_estiDeleteBtn = document.getElementById("estiDeleteBtn");
		
		v_estiDeleteBtn.addEventListener("click", () => {
			let sendDeleteNo = "deleteNo=" + v_deleteNo;
			
			location.reload(); // 새로고침
			
			const v_ajax = new XMLHttpRequest;
			v_ajax.open("POST", "${pageContext.request.contextPath}/estimateDelete", false);
			v_ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			v_ajax.onload = () => {
				if (v_ajax.status == 200){
					
					let v_list = JSON.parse(v_ajax.response);
					
					console.log(v_list);
					
					/* estiNo 기준으로 묶기 */
					let v_estiNoDict = {};
					let v_noCategoryDict = {};
					
					/* 삭제 시 글번호가 정렬이 이상하게 되있어서 
					임시 글번호를 보여주고 진짜 글번호는 따로 저장 */
					let v_tempIdx = 1;
					let v_realNo = {};
					
					for (let i = 0; i < v_list.length; i++){
						if (v_estiNoDict[v_list[i]["estiNo"]] == null){
							v_estiNoDict[v_list[i]["estiNo"]] = [];
							v_estiNoDict[v_list[i]["estiNo"]].push(v_list[i]);
							
							v_noCategoryDict[v_list[i]["estiNo"]] = [];
							v_noCategoryDict[v_list[i]["estiNo"]].push(v_list[i]["materCategory"]);
							
							// 진짜 글번호 저장
							v_realNo[v_tempIdx] = v_list[i]["estiNo"];
							v_tempIdx++;
							
						} else {
							v_estiNoDict[v_list[i]["estiNo"]].push(v_list[i]);
							v_noCategoryDict[v_list[i]["estiNo"]].push(v_list[i]["materCategory"]);
						}
					}
					
					console.log(v_estiNoDict);
					
					// 정렬 기준 우선순위를 정의
					const priority = [
					    "외장재", "지붕재", "창호재", "거실",
					    "욕실1", "욕실2", "욕실3", "욕실4", "욕실5", 
					    "주방1", "주방2", "주방3", "주방4", "주방5", 
					    "방1", "방2", "방3", "방4", "방5"
					];

					// 정렬 함수
					function customSort(arr) {
					    return arr.sort((a, b) => {
					        // a와 b의 인덱스를 기준으로 비교
					        const aIndex = getPriorityIndex(a);
					        const bIndex = getPriorityIndex(b);

					        return aIndex - bIndex;
					    });
					}

					// 우선순위 인덱스를 얻는 함수
					function getPriorityIndex(item) {
					    // 정해진 우선순위 배열에 해당 항목이 있는지 확인
					    const staticIndex = priority.indexOf(item);
					    if (staticIndex !== -1) return staticIndex;

					    // 정해진 우선순위 배열에 없으면, 패턴으로 동적 처리
					    const dynamicMatch = item.match(/(욕실|방)(\d+)/);
					    if (dynamicMatch) {
					        const [_, type, number] = dynamicMatch;
					        const baseIndex = priority.indexOf(`${type}1`); // 기본 우선순위에서 해당 타입의 첫 번째 항목 위치
					        if (baseIndex !== -1) {
					            return baseIndex + parseInt(number, 10) - 1; // 숫자에 따라 순서 조정
					        }
					    }

					    // 우선순위가 없는 경우 마지막으로 정렬
					    return Number.MAX_SAFE_INTEGER;
					}

					// 정렬 실행
					for (let i = 1; i < Object.keys(v_noCategoryDict).length + 1; i++){
						v_noCategoryDict[i] = [...new Set(v_noCategoryDict[i])];
						v_noCategoryDict[i] = customSort(v_noCategoryDict[i]);
					}
					console.log(v_noCategoryDict);
					
					// 왜인진 모르겠는데 html 코드에 id 든 class 든 추가해도 추가가 안됨. 그래서 근처 id 태그에서 접근 중
					let v_estiTableBody = document.getElementById("datatablesEarnings");

					// 순차적 글번호 생성
					let v_cnt = 1;
					
					for (let i of Object.keys(v_estiNoDict)){
						console.log("키값")
						console.log(i)
						
						let v_query = '';
							v_query += '<tr>';
							v_query += '	<td>' + v_cnt + '</td>';
							v_query += '	<td class="sjm-row-title">' + v_estiNoDict[i][0]["estiTitle"] + '</td>';
							v_query += '	<td>' + v_estiNoDict[i][0]["userId"] + '</td>';
							v_query += '	<td>' + v_estiNoDict[i][0]["estiDate"] + '</td>';
							v_query += '</tr>';
						
						console.log(v_estiTableBody.children[1]);
						v_estiTableBody.children[1].insertAdjacentHTML('afterbegin', v_query);
						
						// 순차적 글번호 생성
						v_cnt++;
					}
					
					console.log(v_estiTableBody.children[1]);
					
					v_estiTableBody.children[1].addEventListener("click", () => {
						/* 테이블에서 테이블 헤더의 값과 데이블 바디의 값이 같은 것을 클릭 하는 용도 */
	/* 					const target = event.target; // 클릭된 요소
						const children = Array.from(target.parentElement.children);
						const index = children.indexOf(target);
						
						// parent - 위 형제 - children - children[1].textContent
						let v_tableHeadEsti = event.target.parentElement.parentElement.previousElementSibling.children[0].children[index].textContent;
						
						console.log(v_tableHeadEsti);
						if (v_tableHeadEsti != "견적"){
							return;
						} */
						
						const v_nowNo = v_realNo[event.target.parentElement.children[0].innerHTML]; // 현재 견적번호
						v_deleteNo = v_nowNo; // 삭제 시 필요

						console.log("현재 글번호 : ", event.target.parentElement.children[0].innerHTML);
						console.log("진짜 글번호 : ", v_nowNo);
						console.log(v_estiNoDict[v_nowNo][0]["estiTitle"]);
						
						/* 최종 결과 계산 */
						
						// 주방1, 욕실 2 같은거 때문에 최종 결과 카테고리 div 추가
						let v_matBox = document.querySelectorAll(".mat-box"); // 기본 자제들, 대체 자제들
						
						for (let k = 0; k < v_matBox.length; k++){
							v_matBox[k].innerHTML = "";
							for (let cateIdx = 0; cateIdx < v_noCategoryDict[v_nowNo].length; cateIdx++){
								
								let v_query = ""
									v_query += '<div class="select-mat">'
									v_query += '	<div class="select-mat__category">' + v_noCategoryDict[v_nowNo][cateIdx] + '</div>'
									v_query += '</div>'
									
								v_matBox[k].innerHTML += v_query;
							}
						}

						/* 기본자제, 대체자제 모달창에 추가 */
						let v_basicCarbonSum = 0; // 기본 자제 총 탄소배출량
						let v_basicPriceSum = 0; // 기본 자제 총 가격
						let v_subCarbonSum = 0; // 대체 자제 총 탄소배출량
						let v_subPriceSum = 0; // 대체 자제 총 가격
						
						let v_selectMat = document.querySelectorAll(".select-mat"); // 각 카테고리별 자제들
						
						for (let i = 0; i < v_matBox[0].children.length; i++){
							// category 공백제거 div - div - div(카테고리명)
							let v_category = v_matBox[0].children[i].children[0].innerHTML.trim();
							
							let v_tempDiv = document.createElement("div"); // 한번 사용하면 두번 사용 못함 그래서 .cloneNode(true) 써줘야됨.
							if (v_matBox[0].children[i].children.length == 1){
								v_matBox[0].children[i].appendChild(v_tempDiv.cloneNode(true));
								v_matBox[1].children[i].appendChild(v_tempDiv.cloneNode(true));
							} else {
								v_matBox[0].children[i].children[1].remove();
								v_matBox[0].children[i].appendChild(v_tempDiv.cloneNode(true));
								v_matBox[1].children[i].children[1].remove();
								v_matBox[1].children[i].appendChild(v_tempDiv.cloneNode(true));
							}
							
							// 자제 정보 html에 추가
							for (let dataIdx = 0; dataIdx < v_estiNoDict[v_nowNo].length; dataIdx++){
								if (v_category == v_estiNoDict[v_nowNo][dataIdx]['materCategory']){
									
									if (v_estiNoDict[v_nowNo][dataIdx]['materClassify'] == "N"){
										
										// 기본 자제
										v_matBox[0].children[i].children[1].innerHTML += v_estiNoDict[v_nowNo][dataIdx]["materName"] + "<br>";

										// 기본 자제들 총 탄소, 가격
										let v_num = v_estiNoDict[v_nowNo][dataIdx]["kgPerPyeong"]; 
										v_basicCarbonSum += v_estiNoDict[v_nowNo][dataIdx]["materGasKg"] * v_num;
										v_basicPriceSum += v_estiNoDict[v_nowNo][dataIdx]["materPrice"] * v_num;
									} else {
										
										// 대체 자제
										v_matBox[1].children[i].children[1].innerHTML += v_estiNoDict[v_nowNo][dataIdx]["materName"] + "<br>";
										
										// 대체 자제들 총 탄소, 가격
										let v_num = v_estiNoDict[v_nowNo][dataIdx]["kgPerPyeong"];
										v_subCarbonSum += v_estiNoDict[v_nowNo][dataIdx]["materGasKg"] * v_num;
										v_subPriceSum += v_estiNoDict[v_nowNo][dataIdx]["materPrice"] * v_num;
									}
								}
							}
						}

						/* 기본 자제들 총합 */
						let v_calBefore = document.querySelectorAll(".cal-before");
						v_calBefore[0].innerHTML = parseFloat(v_basicCarbonSum.toFixed(2));
						v_calBefore[1].innerHTML = insertComma(v_basicPriceSum.toString());

						/* 대체 자제들 총합 */
						let v_calAfter = document.querySelectorAll(".cal-after");
						v_calAfter[0].innerHTML = parseFloat(v_subCarbonSum.toFixed(2));
						v_calAfter[1].innerHTML = insertComma( v_subPriceSum.toString());
						
						// 모달창 출력
						document.querySelector(".overlay").classList.add("show");
						document.body.style.overflow = "hidden";
						v_modalBoxCal.style.display = "block";
					});
				}
			}
			
			v_ajax.send(sendDeleteNo);
			
			document.querySelector(".overlay").classList.remove("show");
			document.body.style.overflow = "auto";
			v_modalBoxCal.style.display = "none";
		})
		
		/* 예산 입력 시 세자리마다 콤마 추가 */
		function insertComma(num) {    
			if(num.length <= 3) {        
				return num;    
			}    
			
			var count = Math.ceil(num.length / 3);    
			var newNum = [];    
			for(var i=0; i<count; i++) {
				newNum.unshift(num.slice(-3*(i+1), num.length-(3*i)));
			}    
			
			return newNum.join(',');
		}
	</script>


</body>
</html>
