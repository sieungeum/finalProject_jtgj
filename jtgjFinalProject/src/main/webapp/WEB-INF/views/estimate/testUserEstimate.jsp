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
                  <c:if test="${sessionScope.login.userAccount == 'C'}">
                  <a class="nav-link" style="color: white; padding-top: 30px;" href="${pageContext.request.contextPath }/companyEditView"> 수정 </a> 
                  </c:if>
                  <c:if test="${sessionScope.login.userAccount != 'C'}">
                  <a class="nav-link" style="color: white; padding-top: 30px;" href="${pageContext.request.contextPath }/personalEditView"> 수정 </a> 
                  </c:if>
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
					<h1 class="mt-4"><a style="text-decoration: none; color: inherit;" href="${pageContext.request.contextPath }/myPage">마이페이지</a></h1>

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
											<c:if test="${sessionScope.login.userProfImg == 'N' }">
												<img src="img/default_img.png" class="profile-img">
											</c:if>
											<c:if test="${sessionScope.login.userProfImg != 'N' }">
												<img src="<c:url value="/displayProfImg?atchtype=prof_img&imgName=${sessionScope.login.userProfImg }"/>" class="profile-img">
											</c:if>
										</div>
										
									</div>
									<div class="d-flex justify-content-center"
										style="font-size: 30px; font-weight: bold; margin-top: 30px;">${sessionScope.login.userName }</div>
								</div>
							</div>
						</div>
						</c:if>
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
							<table id="datatablesSimple">
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
															    	<button class="btn btn-primary btn-xl" id="checkBtnN" type="submit" disabled>미답변</button>
															</form>
													</c:if>
													
													<c:if test="${faq.faqAst == 'Y'}">
														<form action="${pageContext.request.contextPath }/faqAstDelDo" method="POST" id="checkFormY">
															<input type="hidden" name="faqNo" value="${faq.faqNo}">
															    <button class="btn btn-primary btn-xl" id="checkBtnY" type="submit" disabled>답변완료</button>
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
	<div class="modal-box__cal">
	
		<!-- 닫기 버튼 -->
		<div class="modal-box__cancel">
			<img
				id="calModalCancel"
				src="${pageContext.request.contextPath}/img/mat-category/cancel_modal.png"
				width="25px">
		</div><!-- 닫기 버튼 -->

		<!-- 최적, 가격, 탄소배출량으로 결과를 나눔 -->
		<div class="result-type-box">
			<div id="rtOptimum" class="result-type__optimum result-type-margin sjm-btn sjm-btn-dark">
				최적 대체
			</div>
			<div id="rtPrice" class="result-type__price result-type-margin sjm-btn sjm-btn-light">
				가격 감소
			</div>
			<div id="rtCarbon" class="result-type__carbon result-type-margin sjm-btn sjm-btn-light">
				탄소배출량 감소
			</div>
		</div>
		
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
			<div id="resetSaveBtn" class="sjm-btn sjm-btn-primary final-btn">
				초기화
			</div> <!-- 초기화 버튼 -->
			
			<!-- 임시 저장 버튼 -->
			<div id="tempSaveBtn" class="sjm-btn sjm-btn-primary final-btn">
				임시 저장
			</div> <!-- 임시 저장 버튼 -->
			
			<!-- 저장 버튼 -->
			<div id="resultSaveBtn" class="sjm-btn sjm-btn-primary final-btn">
				저장
			</div> <!-- 저장 버튼 -->
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
		
		const v_ajax = new XMLHttpRequest;
		v_ajax.open("POST", "${pageContext.request.contextPath}/userEstimate", false);
		v_ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		v_ajax.onload = () => {
			if (v_ajax.status == 200){
				let v_list = JSON.parse(v_ajax.response);
				
				console.log(v_list);
				
				// 왜인진 모르겠는데 html 코드에 id 든 class 든 추가해도 추가가 안됨. 그래서 근처 id 태그에서 접근 중
				let v_datatablesEarnings = document.getElementById("datatablesEarnings");
				let v_tbody = v_datatablesEarnings.querySelector("tbody");
				
				let v_cnt = 1;
				for (let i = 0; i < Object.keys(v_list).length; i++){
					if (v_list[i]["estiNo"] == v_cnt){
						let v_query = '';
							v_query += '<tr>';
							v_query += '	<td>' + v_list[i]["estiNo"] + '</td>';
							v_query += '	<td>' + v_list[i]["estiTitle"] + '</td>';
							v_query += '	<td>' + v_list[i]["userId"] + '</td>';
							v_query += '	<td>' + v_list[i]["estiDate"] + '</td>';
							v_query += '</tr>';
							
							v_tbody.insertAdjacentHTML('afterbegin', v_query);
						
						// 각각 견적마다 클릭 이벤트 추가
						v_tbody.querySelectorAll("tr")[0].children[1].addEventListener("click", () => {
							console.log("good");
							
							
							
							
							
							
							
						});
						
						v_cnt++;
					}
				}
			}
		}
		
		v_ajax.send();
		
		
		
		/* 최종 결과 출력 */
		// parameter : json 형식의 선택 자제들 데이터, 현재 범위 input의 this.value
		function f_ajaxJsonString(v_sendMaterials, v_range){
			// 선택한 자제들 ajax로 보내기 전에 원본 유지
			let v_basicMatDict = JSON.parse(JSON.stringify(v_sendMaterials));
			
			// 주방1, 욕실2 같은거 있어서 서버에 보낼 때는 지워주기
			for (let i = 0; i < Object.keys(v_sendMaterials).length; i++){
				v_sendMaterials[i]['matCategory'] = v_sendMaterials[i]['matCategory'].replace(/[0-9]/g, '');
			}
			
			// JSONString으로 변환 및 ajax로 보내기 위한 변형
			v_sendMaterials = JSON.stringify(v_sendMaterials);
			v_sendMaterials = "sendMaterials=" + v_sendMaterials;
			
			// 범위 input value
			v_sendMaterials += "&calRange=" + v_range;
			
			// ajax 요청
			const v_ajax = new XMLHttpRequest();
			v_ajax.open("POST", "${pageContext.request.contextPath}/calMaterial", false);
			v_ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			
			v_ajax.onload = () =>{
				// 통신 성공 시
				if (v_ajax.status == 200){
					// 받은 데이터 JSON으로 변형
					let v_subMat = v_ajax.response; 
					v_subMat = JSON.parse(v_subMat);
					
					/* dict to arr */
					let v_basicMat = []; // arr
					for (let key in Object.keys(v_basicMatDict)){
						v_basicMat.push(v_basicMatDict[key]);
					}
					
					for (let i = 0; i < v_basicMat.length; i++){
						v_subMat[i]["materCategory"] = v_basicMat[i]["matCategory"]
					}

					console.log("선택된 자제들");
					console.log(v_basicMat);
					console.log(v_subMat);
					console.log("선택된 자제들 - 완 - ");

					/* 기본자제, 대체자제 모달창에 추가 */
					let v_subCarbonSum = 0; // 대체 자제 총 탄소배출량
					let v_subPriceSum = 0; // 대체 자제 총 가격
					
					// 주방1, 욕실 2 같은거 때문에 최종 결과 카테고리 div 추가
					let v_matBox = document.querySelectorAll(".mat-box"); // 기본 자제들, 대체 자제들
					let v_materCategory = document.querySelectorAll(".mater-category"); // 자제 카테고리
					
					for (let k = 0; k < v_matBox.length; k++){
						v_matBox[k].innerHTML = "";
						for (let i = 0; i < v_materCategory.length; i++){
							
							let v_query = ""
								v_query += '<div class="select-mat">'
								v_query += '	<div class="select-mat__category">' + v_materCategory[i].innerHTML + '</div>'
								v_query += '</div>'
								
							v_matBox[k].innerHTML += v_query;
						}
					}
					
					let v_selectMat = document.querySelectorAll(".select-mat"); // 각 카테고리별 자제들
					
					// for (let k = 0; k < v_matBox.length; k++){ // k = 0:기본자제, 1:대체자제
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
						for (let dataIdx = 0; dataIdx < v_basicMat.length; dataIdx++){
							if (v_category == v_basicMatDict[dataIdx]['matCategory']){
								// 기본 자제
								v_matBox[0].children[i].children[1].innerHTML +=  v_basicMat[dataIdx]["matName"] + "<br>";
								v_matBox[0].children[i].children[1].innerHTML += '<input type="hidden" value='+ v_basicMat[dataIdx]["matKg"] +'>';
								
								// 대체 자제
								v_matBox[1].children[i].children[1].innerHTML += v_subMat[dataIdx]["materName"] + "<br>";
								let v_num = v_basicMat[dataIdx]["matKg"]; 
								
								// 대체 자제들 총 탄소, 가격
								v_subCarbonSum += v_subMat[dataIdx]['materGasKg'] * v_num;
								v_subPriceSum += v_subMat[dataIdx]['materPrice'] * v_num;

							}
						}
					}
					
					let v_carbonSum = document.getElementById("carbonSum").innerHTML; // 기본 자제들 총 탄소배출량
					let v_priceSum = document.getElementById("priceSum").innerHTML.replaceAll(",", ""); // 기본 자제들 총 가격

					/* 기본 자제들 총합 */
					let v_calBefore = document.querySelectorAll(".cal-before");
					v_calBefore[0].innerHTML = v_carbonSum;
					v_calBefore[1].innerHTML = insertComma(v_priceSum.toString());

					/* 대체 자제들 총합 */
					let v_calAfter = document.querySelectorAll(".cal-after");
					v_calAfter[0].innerHTML = parseFloat(v_subCarbonSum.toFixed(2));
					v_calAfter[1].innerHTML = insertComma( v_subPriceSum.toString());
					
					// 모달창 출력	
					document.querySelector(".overlay").classList.add("show");
					document.body.style.overflow = "hidden";
					v_modalBoxCal.style.display = "block";
 					
 					v_matInfo = {}; // 선택한 기본 자제들의 정보, 계산마다 초기화 해줘야함
 					v_matNum = []; // 선택한 기본 자제들 Kg(갯수), 계산마다 초기화 해줘야함
 					// 모든 기본 자제들(v_matInfoDict) 에서 선택 자제들(v_basicMat)의 정보만 가져오기
 					
 					for (let i = 0; i < Object.keys(v_matInfoDict).length; i++){
 						for (let j = 0; j < v_basicMat.length; j++){
 							if (v_basicMat[j]['matName'] == v_matInfoDict[i]['materName'] && v_basicMat[j]['matCategory'].replace(new RegExp('[0-9]', 'g'), '') == v_matInfoDict[i]['materCategory']){

 								// 값 추가
 			 					v_matInfo[Object.keys(v_matInfo).length] = structuredClone(v_matInfoDict[i]);
 			 					v_matNum.push(v_basicMat[j]['matKg']);
 			 					
 			 					if (v_matInfo[Object.keys(v_matInfo).length - 1]["materCategory"] == "주방" || v_matInfo[Object.keys(v_matInfo).length - 1]["materCategory"] == "욕실" || v_matInfo[Object.keys(v_matInfo).length - 1]["materCategory"] == "방"){
 			 						
 			 						v_matInfo[Object.keys(v_matInfo).length - 1]["materCategory"] = v_basicMat[j]['matCategory'];
 			 						console.log(v_matInfo[Object.keys(v_matInfo).length - 1]["materCategory"]);
 			 					}
 			 					
 			 					
 							}
 						}
 					}
 					
 					// 선택된 대체 자제들
					v_subMatInfo = v_subMat;
				}
			}
			
			v_ajax.send(v_sendMaterials);
		}
		
		/* 최종 결과 모달창 닫기 */
		let v_calModalCancel = document.getElementById("calModalCancel");
		
		v_calModalCancel.addEventListener("click", () => {
			document.querySelector(".overlay").classList.remove("show");
			document.body.style.overflow = "auto";
			v_modalBoxCal.style.display = "none";
		});
	</script>
</body>
</html>
