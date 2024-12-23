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
<title>관리자 자재 등록</title>
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

.btn-secondary.active {
    background-color: #008000 !important; /* 기존보다 어두운 색상 */
    border:none;
}

/* sjm Zone 영역 전개 */

/* index 꾸미 */
.sb-topnav{
	background-color: green !important;
}

.sb-sidenav-menu{
	background-color: green;
}



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
	justify-content: space-between;
	
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
	margin: 0px 10px 15px 0px;
	
	text-align: end;
}

/* 계산 후 모달 */
.mat-division{
	display: flex;
	justify-content: space-around;
	
	width: 85% !important;
	
	margin: auto;
}
.mat-title{
	width: 50%;
	
	padding: 5px 0px 5px 0px;
	
	text-align: center;
	
	background-color: #ccc;
	font-weight: bold;
	font-size: 20px;
}

.mb-mat-box{
	margin-bottom: 15px;
}

.modal-box__cancel{
	position: sticky;
	
	top: 10px;
	
	text-align: end;
	
	margin: 10px 10px 0px 0px;
}

.compare-box{
	width: 85% !important;
	
	margin: auto;
	padding : 8px 12px 8px 12px;
	
	border: 1px solid black;
	border-radius: 8px;
	
	background-color: #ddd;
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
	
	width: 900px;
	padding-bottom: 20px;
	
	background-color: #fff;
	
	border: 3px solid black;
	border-radius: 8px;
	
}

.modal-box_sort{
	display: flex;
	
	width: 100%;
	
	border: 1px solid black;
	background-color: #eee;
}

.mat-box__half{
	width: 100%;
}

.mat-thead{
	display: flex;
	border: 1px solid black;
}

.mat-th{
	padding: 3px 0px 3px 0px;
	text-align : center;
	border: 1px solid black;
}

.mat-td{
	padding: 3px 5px 3px 0px;
	text-align : end;
	border: 1px solid black;
}

.mat-tbody{
	display: flex;
	flex-direction: column;
	flex-wrap: wrap;
	width: 100%;
}

.mat-tr{
	display: flex;
	width: 100%;
}
/* 15 35 20 20 10  */
.th-w-1{
	border: 1px solid black;
	width : calc(100% / 10 + 100% / 20);
}
.th-w-2{
	border: 1px solid black;
	width : calc(100% / 5 + 100% / 10 + 100% / 20);
	text-align: center !important;
}
.th-w-3{
	border: 1px solid black;
	width : calc(100% / 5);
}
.th-w-4{
	border: 1px solid black;
	width : calc(100% / 5);
}
.th-w-5{
	border: 1px solid black;
	width : calc(100% / 10);
}

.mat-box__flow-y{
	width: 85% !important;
	max-height: 400px;
	overflow-y: auto;
	
	margin: auto;
}
.mat-box{
	width: 100%;
	
	margin-right: 10px;
}

.select-mat{
	/* padding: 5px 5px 5px 10px; */
}
.select-mat__category{
	display: inline-block;
	
	padding: 3px 6px 3px 6px;
	
	background-color: yellowgreen;
	/* border: 1px solid green; */
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
	width: 85%;
	margin: auto;
	border: 1px solid black;
}

.result-type-margin{
	width: 100%;
}

.range-header{
	display:flex;
	justify-content: space-between;
}

.modal-box__result-btn{
	display: flex;
	justify-content: end;
	
	width: 85% !important;
	
	margin: auto;
	margin-top: 20px;
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
	
	background-color: #fff;
	
	border: 3px solid black;
	border-radius: 8px;
	
}

.title-modal__flex-down{
	display: flex;
	flex-direction: column;
	
	width: 100%;
}

.title-modal__input-down{
	width: 80%;
	
	margin: 8px 0px 0px 15px;
}


#downTitleInput {
	height: 35px;
}

.title-modal__btn-down{
	display: flex;
	justify-content: end;
	
	margin: 10px 10px 8px 0px;
}
#downModalSave{
	margin-right: 8px;
}


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

<!-- sjm Zone 영역 전개 -->
<link rel="stylesheet" href="css/sjm/sjm-custom.css">

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
					<div class="nav"
						style="font-size: 30px; color: black; padding-top: 30px;">
						<a class="nav-link" style="color: white; padding-top: 30px;"
							href="${pageContext.request.contextPath}/myPage"> 마이페이지 </a>  
						<c:if test="${sessionScope.login.userAccount == 'C'}">
							<a class="nav-link" style="color: white; padding-top: 15px;"
								href="${pageContext.request.contextPath }/companyEditView">
								수정 </a>
						</c:if>
						<c:if test="${sessionScope.login.userAccount != 'C'}">
							<a class="nav-link" style="color: white; padding-top: 15px;"
								href="${pageContext.request.contextPath }/personalEditView">
								수정 </a>
						</c:if>
						<c:if test="${sessionScope.login.userAccount == 'C'}">
                  	  <c:if test="${sessionScope.login.userRank == 'M'}">
	                  	<a class="nav-link" style="color: white; padding-top: 15px;" href="${pageContext.request.contextPath }/companyBoardWriteView"> 홍보 </a>
	                  </c:if>
	                  <c:if test="${sessionScope.login.userRank == 'N'}">
	                  	<a class="nav-link" style="color: white; padding-top: 15px;" href="${pageContext.request.contextPath }/noinjungCompany"> 홍보 </a>
	                  </c:if>
                  </c:if>
                  
						<c:if
							test="${sessionScope.login.userRank == 'Y' || sessionScope.login.userRank == 'K' || sessionScope.login.userRank == 'L'  }">
							<a class="nav-link" style="color: white; padding-top: 15px;"
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
					<div class="mt-4" style="text-align:center;font-size:35px;font-weight:bolder;">
						<a style="text-decoration: none;  color: inherit;" href="${pageContext.request.contextPath }/materWriteView">자재추가</a>
					</div>
					
					<div style="display:flex; justify-content:center;"><hr style="width:68%;"></div>
					
					<div class="row d-flex justify-content-center mt-3">
						<div class="col-xl-4 col-lg-5">
							<div class="card mb-4">
								<div class="card-header">자재등록</div>
								<div class="card-body">
									<div class="d-flex" style="flex-direction:column;align-items:center;margin-top:20px;margin-bottom:20px;">
										<div style="width:100%;font-align:left;margin-bottom:20px;">
											<label for="inputImage" style="font-weight: bolder;">자재 사진 첨부</label>
										</div>
										<div class="mater-div d-flex justifiy-content-center align-items-center">
											<img id="materImagePreview" class="mater-img" src="img/question_mark.jpg">
										</div>
										<input class="d-none" id="inputImage" type="file" accept="image/*" onchange="readImage(this);">
										<button class="btn btn-success mt-3 mb-3" onclick="resetImage()">사진 초기화</button>
									</div>

									<div class="mb-3">
										<label for="materName" style="font-weight: bolder;">자재이름</label>
										<div class="input-group mb-3 mt-2">
											<input type="text" class="form-control" id="materName" required /><br />
										</div>
									</div>

									<div class="mb-3" style="display:flex;flex-direction:column;">
										<div><label for="materCategory" style="font-weight:bolder;">카테고리</label></div>
										<div class="btn-group mb-3 mt-2" role="group" aria-label="카테고리 선택" >
											<button type="button" class="btn btn-secondary me-2" onclick="selectCategory('외장재', this)">외장재</button>
											<button type="button" class="btn btn-secondary me-2" onclick="selectCategory('지붕재', this)">지붕재</button>
											<button type="button" class="btn btn-secondary me-2" onclick="selectCategory('창호재', this)">창호재</button>
											<button type="button" class="btn btn-secondary me-2" onclick="selectCategory('거실', this)">거실</button>
											<button type="button" class="btn btn-secondary me-2" onclick="selectCategory('욕실', this)">욕실</button>
											<button type="button" class="btn btn-secondary me-2" onclick="selectCategory('방', this)">방</button>
											<button type="button" class="btn btn-secondary" onclick="selectCategory('주방', this)">주방</button>
										</div>
										<input type="hidden" id="materCategory" required />
									</div>

									<div class="mb-3">
										<label for="materGasKg" style="font-weight: bolder;">탄소 배출량</label>
										<div class="input-group mb-3 mt-2">
											<input type="number" class="form-control" id="materGasKg" required /><br />
										</div>
									</div>

									<div class="mb-3">
										<label for="materPrice" style="font-weight: bolder;">가격</label>
										<div class="input-group mb-3 mt-2">
											<input type="number" class="form-control" id="materPrice" required /><br />
										</div>
									</div>

									<div class="mb-3" style="display:flex;flex-direction:column;">
										<label for="materDurability" style="font-weight:bolder;">강도</label>
										<div class="btn-group mb-3 mt-2" role="group" aria-label="강도 선택">
											<button type="button" class="btn btn-secondary me-2" onclick="selectDurability('매우높음', this)">매우높음</button>
											<button type="button" class="btn btn-secondary me-2" onclick="selectDurability('높음', this)">높음</button>
											<button type="button" class="btn btn-secondary me-2" onclick="selectDurability('보통', this)">보통</button>
											<button type="button" class="btn btn-secondary me-2" onclick="selectDurability('낮음', this)">낮음</button>
											<button type="button" class="btn btn-secondary" onclick="selectDurability('매우낮음', this)">매우낮음</button>
										</div>
										<input type="hidden" id="materDurability"
											name="materDurability" required />
									</div>

									<div class="mb-3">
										<label for="materInfo" style="font-weight: bolder;">정보</label>
										<div class="input-group mb-3 mt-2">
											<textarea id="materInfo" class="form-control" required></textarea><br />
										</div>
									</div>

									<div class="mb-3" style="display:flex;flex-direction:column;">
										<label for="materClassify" style="font-weight:bolder;">대체자재여부</label>
										<div class="btn-group mb-3 mt-2" role="group" aria-label="대체자재여부 선택">
											<button type="button" class="btn btn-secondary me-2" onclick="selectClassify('Y', this)">Y</button>
											<button type="button" class="btn btn-secondary" onclick="selectClassify('N', this)">N</button>
										</div>
										<input type="hidden" id="materClassify" name="materClassify" required />
									</div>

									<div class="d-flex mar-buttom mt-2" style="flex-direction:column;">
										<button class="btn btn-primary btn-xl m-right mb-2" id="registBtn" type="button" disabled>등록</button>
										<a class="btn btn-primary btn-xl a-sor mb-2" href="${pageContext.request.contextPath}/adminPage">돌아가기</a>
										<div id="warningText" style="text-align:center;color:red;font-weight:bolder;"><p>'정보'를 제외한 모든 입력란을 채워주세요!</p></div>
									</div>
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
	
	<script>
		// 자재 이미지 추가
		let imgElement = document.getElementById('materImagePreview');
		const initialImg = "img/question_mark.jpg";
		const initialImgName = initialImg
		let selectedFile = null; // 전역 변수로 선택된 파일 저장
		let inputImageElement = document.getElementById('inputImage');
		
		// 프로필 이미지 클릭 시 숨겨놓은 input file이 클릭됌
		$(".mater-img").on('click', () => {
			$("#inputImage").click();
		});
		
		$("#inputImage").on("change", function(){
			if(this.files && this.files[0]){
				// 파일이 선택된 경우 readImage 호출
				selectedFile = this.files[0]; // 선택된 파일 저장
				readImage(this); // 이미지 미리보기 업데이트
			} else{
				// 파일이 선택되지 않은 경우
				console.log("파일 선택 취소됨, 기본 이미지 유지");
			}
		});
		
		// 프로필 이미지 임시 변경(아직 수정 X)
		function readImage(input){
			if(selectedFile){
				const reader = new FileReader();
				
				// 파일 읽기가 완료되면 실행되는 콜백
				reader.onload = function(e){
					// 미리보기 이미지를 변경
					imgElement.src = e.target.result;
				}
				
				// 파일 읽기 시작
				reader.readAsDataURL(selectedFile);
			}	
		}
		
		// 프로필 이미지 초기화 함수
		function resetImage(){
			imgElement.src = initialImg;
			selectedFile = null;
			inputImageElement.value = "";
			console.log("이미지가 초기화됐습니다.");
		}
		
		// 버튼 active 부여
		function updateButtonState(selectedButton) {
			var buttons = selectedButton.closest('.btn-group')
					.getElementsByTagName('button');
			for (var i = 0; i < buttons.length; i++) {
				buttons[i].classList.remove('active');
			}

			// 클릭된 버튼에 'active' 클래스 추가
			selectedButton.classList.add('active');
		}
	
		// 자재이름
		let v_materName;
		let materNameOn = false;
		function checkMaterName(){
			v_materName = $('#materName').val();
			
			if(v_materName){
				materNameOn = true;
				toggleSignUpButton();
			}else{
				materNameOn = false;
				toggleSignUpButton();
			}
		}
		
		// 카테고리 버튼
		let v_materCategory;
		let materCategoryOn = false;
		function selectCategory(category, button) {
			v_materCategory = document.getElementById('materCategory');
			v_materCategory.value = category;
			updateButtonState(button);
			
			if(v_materCategory.value){
				materCategoryOn = true;
				toggleSignUpButton();
			} else{
				toggleSignUpButton();
			}
		}
		
		// 탄소 배출량
		let v_materGasKg;
		let masterGasKgOn = false;
		function checkMasterGasKg(){
			v_materGasKg = $('#materGasKg').val();
			
			if(v_materGasKg){
				masterGasKgOn = true;
				toggleSignUpButton();
			}else{
				masterGasKgOn = false;
				toggleSignUpButton();
			}
		}
		
		// 가격
		let v_materPrice;
		let materPriceOn = false;
		function checkMaterPrice(){
			v_materPrice = $('#materPrice').val();
			
			if(v_materPrice){
				materPriceOn = true;
				toggleSignUpButton();
			}else{
				materPriceOn = false;
				toggleSignUpButton();
			}
		}
		
		// 강도 버튼
		let v_materDurability;
		let materDurabilityOn = false;
		function selectDurability(durability, button) {
			v_materDurability = document.getElementById('materDurability') 
			v_materDurability.value = durability;
			updateButtonState(button);
			
			if(v_materDurability.value){
				materDurabilityOn = true;
				toggleSignUpButton();
			} else{
				toggleSignUpButton();
			}
		}

		// 대체자제여부 버튼
		let v_materClassify;
		let materClassifyOn = false;
		function selectClassify(classify, button) {
			v_materClassify = document.getElementById('materClassify')
			v_materClassify.value = classify;
			updateButtonState(button);
			
			if(v_materClassify.value){
				materClassifyOn = true;
				toggleSignUpButton();
			} else{
				toggleSignUpButton();
			}
		}
		
		$("#materName").on('focusout', checkMaterName); 
		$('#materGasKg').on("focusout", checkMasterGasKg); 
		$("#materPrice").on("focusout", checkMaterPrice); 
		
		let v_registBtn = $("#registBtn");
		let v_warning = document.getElementById('warningText');
		// 가입 버튼 활성화 상태 관리 함수
		function toggleSignUpButton() {
			if(masterGasKgOn && materPriceOn && materPriceOn && materCategoryOn && materDurabilityOn && materClassifyOn){
				v_warning['attributes']['style']['value'] = "display:none;"
				v_registBtn.prop('disabled', false);
			} else {
				v_warning['attributes']['style']['value'] = "text-align:center;color:red;font-weight:bolder;display:block;"
				v_registBtn.prop('disabled', true);
			}
		} 
		
		document.getElementById('registBtn').addEventListener('click', () => {
			if(confirm('입력하신 자재를 추가하시겠습니까?')){
				
				// 1. 자재정보 DB에 추가
				let v_materInfo = document.getElementById('materInfo').value;
				let v_formData = new FormData();
				
				v_formData.append("materCategory", v_materCategory.value);
				v_formData.append("materName", v_materName);
				v_formData.append("materGasKg", v_materGasKg);
				v_formData.append("materPrice", v_materPrice);
				v_formData.append("materDurabilit", v_materDurability.value);
				v_formData.append("materInfo", v_materInfo);
				v_formData.append("materClassify", v_materClassify.value);
				v_formData.append("materNo", 0);
				v_formData.append("roleClassification", "plus");
				v_formData.append("beforeCategory", "N");
				
				console.log(selectedFile);
				
				if(selectedFile != null){
					v_formData.append("file", selectedFile);
					v_formData.append("profImgName", "N");
				} else{
					v_formData.append("file", "N");
					v_formData.append("profImgName", "N");
				}
				
				for(let [key, value] of v_formData.entries()){
					console.log(key, ": ", value);
				}
				
				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/writeMater",
					data:v_formData,
					contentType:false,
					processData:false,
					enctype:"multipart/form-data",
					success:function(result){
						if(result === true){
							alert("성공적으로 자재가 추가됐습니다!");
							location.href = "${pageContext.request.contextPath}/adminPage";
						}
						
					}, error:function(req, st, err) {
						console.log('-------------------------------');
						console.log("request", req);
						console.log("status", st);
						console.log("errors", err);
						console.log('-------------------------------');
					}
				});
				
				
			}
		});
		
	</script>
	

</body>
</html>
