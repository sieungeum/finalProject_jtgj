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
<title>관리자 자재 수정</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>


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
    background-color: #9C9C9C !important; /* 기존보다 어두운 색상 */
    border:none;
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
				class="sb-sidenav accordion sb-sidenav-dark bg-primary text-white" id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav"
						style="font-size: 30px; color: black; padding-top: 30px;">
						<a class="nav-link" style="color: white; padding-top: 30px;" href="${pageContext.request.contextPath}/myPage"> 마이페이지 </a> 
						<c:if test="${sessionScope.login.userAccount == 'C'}">
							<a class="nav-link" style="color: white; padding-top: 30px;" href="${pageContext.request.contextPath }/companyEditView">수정</a>
						</c:if>
						<c:if test="${sessionScope.login.userAccount != 'C'}">
							<a class="nav-link" style="color: white; padding-top: 30px;" href="${pageContext.request.contextPath }/personalEditView">수정</a>
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
						<c:if test="${sessionScope.login.userRank == 'Y' || sessionScope.login.userRank == 'K' || sessionScope.login.userRank == 'L'  }">
							<a class="nav-link" style="color: white; padding-top: 30px;" href="${pageContext.request.contextPath }/adminPage">관리자페이지</a>
						</c:if>
							<div style="margin: 10px; margin-left:0; padding-right: 100px;"><a class="nav-link" style="color: white; font-size: 20px;'" href="${pageContext.request.contextPath }/logoutDo">로그아웃</a></div> 
					</div>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<div class="mt-4"
						style="text-align: center; font-size: 35px; font-weight: bolder;">
						<a style="text-decoration: none; color: inherit;" href="${pageContext.request.contextPath }/adminMateEditView?materNo=${mater.materNo}">자재수정</a>
					</div>

					<div style="display: flex; justify-content: center;">
						<hr style="width: 68%;">
					</div>


					<div class="row d-flex justify-content-center">


						<div class="col-xl-4 col-lg-5">
							<div class="card mb-4">
								<div class="card-header">자재정보 수정</div>
								<div class="card-body">
									<!-- materImg -->
									<div class="d-flex" style="flex-direction:column;align-items:center;margin-top:20px;margin-bottom:20px;">
										<div style="width:100%;font-align:left;margin-bottom:20px;">
											<label for="inputImage" style="font-weight: bolder;">자재 사진 첨부</label>
										</div>
										<c:if test="${mater.materImg == 'N' }">
											<div class="mater-div d-flex justifiy-content-center align-items-center">
												<img id="materImagePreview" class="mater-img" src="img/question_mark.jpg">
											</div>
										</c:if>
										<c:if test="${mater.materImg != 'N' }">
											<div class="mater-div d-flex justifiy-content-center align-items-center">
												<img id="materImagePreview" class="mater-img" src="${pageContext.request.contextPath }/displayProfImg?atchtype=mater_img&imgName=${mater.materImg}">
											</div>
										</c:if>
										
										<input class="d-none" id="inputImage" type="file" accept="image/*" onchange="readImage(this);">
										<button class="btn btn-success mt-3 mb-3" onclick="resetImage()">사진 초기화</button>
									</div>

									<!-- materName -->
									<div class="mb-3">
										<label for="materName" style="font-weight: bolder;">자재이름</label>
										<div class="input-group mb-3 mt-2">
											<input type="text" class="form-control" value="${mater.materName}" id="materName" required /><br />
										</div>
									</div>

									<div class="mb-3" style="display:flex;flex-direction:column;">
										<div><label for="materCategory" style="font-weight:bolder;">카테고리</label>
										<div class="btn-group mb-3 mt-2" style="width:100%;" role="group" aria-label="카테고리 선택">
										  <button type="button" class="btn btn-secondary me-2 ${mater.materCategory == '외장재' ? 'active' : ''}" 
										          id="category-exterior" onclick="selectCategory('외장재', this)">외장재</button>
										  <button type="button" class="btn btn-secondary me-2 ${mater.materCategory == '지붕재' ? 'active' : ''}" 
										          id="category-roof" onclick="selectCategory('지붕재', this)">지붕재</button>
										  <button type="button" class="btn btn-secondary me-2 ${mater.materCategory == '창호재' ? 'active' : ''}" 
										          id="category-window" onclick="selectCategory('창호재', this)">창호재</button>
										  <button type="button" class="btn btn-secondary me-2 ${mater.materCategory == '거실' ? 'active' : ''}" 
										          id="category-living" onclick="selectCategory('거실', this)">거실</button>
										  <button type="button" class="btn btn-secondary me-2 ${mater.materCategory == '욕실' ? 'active' : ''}" 
										          id="category-bathroom" onclick="selectCategory('욕실', this)">욕실</button>
										  <button type="button" class="btn btn-secondary me-2 ${mater.materCategory == '방' ? 'active' : ''}" 
										          id="category-room" onclick="selectCategory('방', this)">방</button>
     									  <button type="button" class="btn btn-secondary me-2 ${mater.materCategory == '주방' ? 'active' : ''}" 
										          id="category-room" onclick="selectCategory('주방', this)">주방</button>
										</div>
										<input type="hidden" id="materCategory" value="${mater.materCategory}" required />
									</div>

									<div class="mb-3">
										<label for="materGasKg" style="font-weight: bolder;">탄소 배출량</label>
										<div class="input-group">
											<input type="number" class="form-control" id="materGasKg" value="${mater.materGasKg}" required /><br />
										</div>
									</div>

									<div class="mb-3">
										<label for="materPrice" style="font-weight: bolder;">가격</label>
										<div class="input-group ">
											<input type="number" class="form-control" id="materPrice" value="${mater.materPrice}" required /><br />
										</div>
									</div>

									<div class="mb-3" style="display:flex;flex-direction:column;">
										<label for="materDurability" style="font-weight: bolder;">강도</label>
										<div class="btn-group" style="width:100%;" role="group" aria-label="강도 선택">
										  <button type="button" class="btn btn-secondary me-2 ${mater.materDurability == '매우높음' ? 'active' : ''}" 
										          id="durability-very-high" onclick="selectDurability('매우높음', this)">매우높음</button>
										  <button type="button" class="btn btn-secondary me-2 ${mater.materDurability == '높음' ? 'active' : ''}" 
										          id="durability-high" onclick="selectDurability('높음', this)">높음</button>
  										  <button type="button" class="btn btn-secondary me-2 ${mater.materDurability == '보통' ? 'active' : ''}" 
										          id="durability-normal" onclick="selectDurability('보통', this)">보통</button>
										  <button type="button" class="btn btn-secondary me-2 ${mater.materDurability == '낮음' ? 'active' : ''}" 
										          id="durability-low" onclick="selectDurability('낮음', this)">낮음</button>
										  <button type="button" class="btn btn-secondary ${mater.materDurability == '매우낮음' ? 'active' : ''}" 
										          id="durability-very-low" onclick="selectDurability('매우낮음', this)">매우낮음</button>
										</div>
										<input type="hidden" id="materDurability"
											name="materDurability" value="${mater.materDurability}"
											required />
									</div>


									<div class="mb-3">
										<label for="materInfo" style="font-weight: bolder;">정보</label>
										<div class="input-group">
											<textarea id="materInfo" class="form-control" required>${mater.materInfo}</textarea>
											<br />
										</div>
									</div>

									<div class="mb-3" style="display:flex;flex-direction:column;">
										<label for="materClassify" style="font-weight: bolder;">대체자재여부</label>
										<div class="btn-group mb-3" style="width:100%;" role="group" aria-label="대체자재 여부 선택">
										  <button type="button" class="btn btn-secondary ${mater.materClassify == 'Y' ? 'active' : ''}" 
										          id="classify-yes" onclick="selectClassify('Y', this)">Y</button>
										  <button type="button" class="btn btn-secondary ${mater.materClassify == 'N' ? 'active' : ''}" 
										          id="classify-no" onclick="selectClassify('N', this)">N</button>
										</div>
										<input type="hidden" id="materClassify" value="${mater.materClassify}" required />
									</div>
									
									<!-- materNo -->
									<input type="hidden" id="materNo" value="${mater.materNo}">
									
									<div class="d-flex mar-buttom mt-2" style="flex-direction:column;">
										<button class="btn btn-primary btn-xl m-right mb-2" id="registBtn" type="button" disabled>수정</button>
										<div class="d-flex">
											<a class="btn btn-success btn-xl a-sor w-50 me-2" href="${pageContext.request.contextPath}/adminPage">돌아가기</a>
											<button class="btn btn-danger btn-xl a-sor w-50" id="deleteBtn" type="button">자재삭제</button>
										</div>
										
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


	<script>
		// 자재 이미지 추가
		let imgElement  = document.getElementById('materImagePreview');
		const initialImg = imgElement.src;
		console.log(initialImg);
		let initialImgName = initialImg.split("=")[2];
		if(!initialImgName){
			initialImgName = 'N';
		}
		console.log(initialImgName);
		let selectedFile = null;
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
				console.log(selectedFile);
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
		let materNameOn = true;
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
		let materCategoryOn = true;
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
		let masterGasKgOn = true;
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
		let materPriceOn = true;
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
		let materDurabilityOn = true;
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
		let materClassifyOn = true;
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
		
		// 페이지 로드 시 초기화
		toggleSignUpButton(); // 페이지 로드 시 조건 확인
		
		document.addEventListener('DOMContentLoaded', () => {
			document.getElementById('registBtn').addEventListener('click', () => {
				if(confirm('자재의 정보를 수정하시겠습니까?')){
					
					console.log(selectedFile);
					console.log(initialImgName);
					
					// 1. 자재정보 DB에 추가
					let v_materInfo = document.getElementById('materInfo').value;
					let v_formData = new FormData();
					
					let materCategory = $("#materCategory").val();
					let materName = $("#materName").val();
					let materGasKg = $("#materGasKg").val();
					let materPrice = $("#materPrice").val();
					let materDurabilit = $("#materDurability").val();
					let materInfo = $("#materInfo").val();
					let materClassify = $("#materClassify").val();
					let materNo = $("#materNo").val();

					v_formData.append("materCategory", materCategory);
					v_formData.append("beforeCategory", "${mater.materCategory}");
					v_formData.append("materName", materName);
					v_formData.append("materGasKg", materGasKg);
					v_formData.append("materPrice", materPrice);
					v_formData.append("materDurabilit", materDurabilit);
					v_formData.append("materInfo", v_materInfo);
					v_formData.append("materClassify", materClassify);
					v_formData.append("materNo", materNo);
					v_formData.append("roleClassification", "edit");
					
					console.log(initialImgName);
					
					if(selectedFile != null){
						v_formData.append("file", selectedFile);	
						v_formData.append("profImgName", initialImgName);
					} else{
						v_formData.append("file", "N");
						v_formData.append("profImgName", initialImgName);
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
								alert("성공적으로 자재가 수정됐습니다!");
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
		});
		
		
		document.getElementById('deleteBtn').addEventListener("click", () => {
			if(confirm("정말로 삭제하시겠습니까?")){
				
				let v_materNo = $("#materNo").val();

				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/deleteMater",
					data:{
						materNo: v_materNo
					},
					dataType:'json',
					success:function(result){
						if(result === true){
							alert('성공적으로 자재가 삭제됐습니다!');
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
