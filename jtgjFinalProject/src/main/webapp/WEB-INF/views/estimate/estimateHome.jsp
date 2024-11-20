<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="ko">

<head>
<meta charset="utf-8">
<title>견적 구성</title>
<meta name="description" content="">
<meta name="msapplication-tap-highlight" content="yes" />
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0" />


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<%@ include file="/WEB-INF/inc/header.jsp"%>

<link rel="stylesheet" href="css/sjm/estimateHome.css">
<link rel="stylesheet" href="css/sjm/sjm-custom.css">

</head>
<body>

	<!-- Preloader -->
	<div class="cover"></div>

	<div class="header">
		<div class="container">

			<!-- nav -->
			<%@ include file="/WEB-INF/inc/nav.jsp"%>

		</div>
	</div>

	<!-- budget input -->
	<div class="container">
		<div class="main-title">
			<div class="header-font">원하시는 평수를 입력하세요</div>
			<div class="budget-input-box">
				<input class="input-budget" type="text" placeholder="단위 : ㎡"
					id="budget">
			</div>
			<div class="budget-btn-box">
				<div id="budgetBtn" class="sjm-btn sjm-btn-success">다음</div>
			</div>

		</div>
	</div>

	<!-- card -->
	<div class="container">
		<div class="main-title">
			<!-- 글머리 -->
			<div class="header-font">견적을 구성해주세요.</div>

			<div class="card-wrapper">
				<!-- 1. 외장재 -->
				<div class="card-box" style="height: 500px;">
					<div class="card-box__top">
						<div class="mater-category">외장재</div>
						<img
							src="${pageContext.request.contextPath}/img/mat-category/mat_category1.jpg">
					</div>
					<div class="card-box__bottom">
						<div class="materials" style="height: 80%;"></div>
						<div class="btn-box" style="height: 20%;">
							<div class="sjm-btn sjm-btn-primary btn-modal">자제 추가하기</div>
						</div>
					</div>
				</div>

				<!-- 2. 지붕재 -->
				<div class="card-box" style="height: 500px;">
					<div class="card-box__top">
						<div class="mater-category">지붕재</div>
						<img
							src="${pageContext.request.contextPath}/img/mat-category/mat_category2.jpg">
					</div>
					<div class="card-box__bottom">
						<div class="materials" style="height: 80%;"></div>
						<div class="btn-box" style="height: 20%;">
							<div class="sjm-btn sjm-btn-primary btn-modal">자제 추가하기</div>
						</div>
					</div>
				</div>

				<!-- 3. 창호재 -->
				<div class="card-box" style="height: 500px;">
					<div class="card-box__top">
						<div class="mater-category">창호재</div>
						<img
							src="${pageContext.request.contextPath}/img/mat-category/mat_category3.jpg">
					</div>
					<div class="card-box__bottom">
						<div class="materials" style="height: 80%;"></div>
						<div class="btn-box" style="height: 20%;">
							<div class="sjm-btn sjm-btn-primary btn-modal">자제 추가하기</div>
						</div>
					</div>
				</div>

				<!-- 4. 주방 -->
				<div class="card-box" style="height: 500px;">
					<div class="card-box__top">
						<div class="mater-category">주방</div>
						<img
							src="${pageContext.request.contextPath}/img/mat-category/mat_category4.jpg">
					</div>
					<div class="card-box__bottom">
						<div class="materials" style="height: 80%;"></div>
						<div class="btn-box" style="height: 20%;">
							<div class="sjm-btn sjm-btn-primary btn-modal">자제 추가하기</div>
						</div>
					</div>
				</div>

				<!-- 5. 욕실 -->
				<div class="card-box" style="height: 500px;">
					<div class="card-box__top">
						<div class="mater-category">욕실</div>
						<img
							src="${pageContext.request.contextPath}/img/mat-category/mat_category5.jpg">
					</div>
					<div class="card-box__bottom">
						<div class="materials" style="height: 80%;"></div>
						<div class="btn-box" style="height: 20%;">
							<div class="sjm-btn sjm-btn-primary btn-modal">자제 추가하기</div>
						</div>
					</div>
				</div>

				<!-- 6. 거실 -->
				<div class="card-box" style="height: 500px;">
					<div class="card-box__top">
						<div class="mater-category">거실</div>
						<img
							src="${pageContext.request.contextPath}/img/mat-category/mat_category6.jpg">
					</div>
					<div class="card-box__bottom">
						<div class="materials" style="height: 80%;"></div>
						<div class="btn-box" style="height: 20%;">
							<div class="sjm-btn sjm-btn-primary btn-modal">자제 추가하기</div>
						</div>
					</div>
				</div>

				<!-- 7. 방 -->
				<div class="card-box" style="height: 500px;">
					<div class="card-box__top">
						<div class="mater-category">방</div>
						<img
							src="${pageContext.request.contextPath}/img/mat-category/mat_category7.jpg">
					</div>
					<div class="card-box__bottom">
						<div class="materials" style="height: 80%;"></div>
						<div class="btn-box" style="height: 20%;">
							<div class="sjm-btn sjm-btn-primary btn-modal">자제 추가하기</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- 임시 저장된 제자들 -->
	<div class="container">
		<div class="main-title">
			<div id="tempSave" class="temp-save-box">
				<!-- 여기에 임시저장 버튼 클릭마다 하나씩 추가됨 -->
			</div>
		</div>
	</div>

	<!-- 총 예산 및 총 탄소배출량 -->
	<div class="container">
		<div class="main-title">
			<div class="calculate-box">

				<!-- 총 탄소배출량 계산량(처음엔 0) -->
				<div class="calculate-carbon calculate-sort">
					<div class="cal-subtitle" style="letter-spacing: 1px;">탄소배출량</div>
					<div class="calculate-sort">
						<div id="calCarbon" class="cal-result-style">
							<span id="carbonSum" class="cal-mr">0</span>
							<!-- 여기부터 자제 선택 시 hidden으로 탄소배출량, kg 저장 -->
						</div>
						<span class="cal-ml">KG</span>
					</div>
				</div>

				<!-- 총 자제 가격 계산(처음엔 0) -->
				<div class="calculate-cost calculate-sort">
					<div class="cal-subtitle" style="letter-spacing: 16px;">자제비</div>
					<div class="calculate-sort">
						<div id="calPrice" class="cal-result-style">
							<span id="priceSum" class="cal-mr">0</span>
							<!-- 여기부터 자제 선택 시 hidden으로 가격, kg 저장 -->
						</div>
						<span class="cal-ml">(원)</span>
					</div>
				</div>
			</div>

			<!-- 계산버튼 -->
			<div class="cal-btn-box">
				<div id="resultBtn" class="sjm-btn sjm-btn-success">계산</div>
			</div>

		</div>
	</div>

	<!-- Material Modal -->
	<div class="sjm_mocdal-box">

		<!-- 자제 모달창 닫기 버튼 -->
		<div class="modal-box__cancel">
			<img
				id="selectModalCancel" 
				src="${pageContext.request.contextPath}/img/mat-category/cancel_modal.png"
				width="25px">
		</div>
		<!--   	이건 일단 삭제 ㄴㄴ
		<div class="modal-box__top">
			<img class="modal-top__img" src="">
		</div>
		<div class="modal-box__bottom">
			<div class="modal-botton__material"></div>
			<div class="modal-botton__rating">
				<div>
					<div>배출량</div>
					<div>가격</div>
					<div>내구성</div>
				</div>
				<div>
					<div class="modal-botton__carbon">
						db값
					</div>
					<div class="modal-botton__price">
						db값
					</div>
					<div class="modal-botton__durability">
						db값
					</div>
				</div>
			</div>
			<div class="modal-botton__explain">
				db값
			</div>
			<div>
				<button class="btn btn-primary btn-select">선택</button>
				<button class="btn btn-danger btn-cancel">닫기</button>
			</div>
		</div> -->
		<div class="add-modal">
			<!-- ajax로 가져옴 -->
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

		<!-- range Controler -->
		<div class="modal-box__range">
			<div class="range-header w-range">
				<div>가격</div>
				<div>기준</div>
				<div>탄소</div>
			</div>
			<input type="range" class="form-range w-range" min="1" max="100" id="calRange">
		</div><!-- range Controler -->
		
		<!-- 선택한 자제, 대체 자제 -->
		<div class="only-flex">
			<!-- 결과 모달창 -->
			<div class="modal-box_sort">
				<!-- 기본 자제 -->
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
						<div>주방</div>
						<!-- div 생성 후 안에 대체 자제명, input__hidden으로 갯수 추가됨 -->
					</div>
					<div class="select-mat">
						<div>욕실</div>
						<!-- div 생성 후 안에 대체 자제명, input__hidden으로 갯수 추가됨 -->
					</div>
					<div class="select-mat">
						<div>거실</div>
						<!-- div 생성 후 안에 대체 자제명, input__hidden으로 갯수 추가됨 -->
					</div>
					<div class="select-mat">
						<div>방</div>
						<!-- div 생성 후 안에 대체 자제명, input__hidden으로 갯수 추가됨 -->
					</div>
				</div> <!-- 기본 자제 -->
	
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
						<div>주방</div>
						<!-- div 생성 후 안에 대체 자제명, input__hidden으로 갯수 추가됨 -->
					</div>
					<div class="select-mat">
						<div>욕실</div>
						<!-- div 생성 후 안에 대체 자제명, input__hidden으로 갯수 추가됨 -->
					</div>
					<div class="select-mat">
						<div>거실</div>
						<!-- div 생성 후 안에 대체 자제명, input__hidden으로 갯수 추가됨 -->
					</div>
					<div class="select-mat">
						<div>방</div>
						<!-- div 생성 후 안에 대체 자제명, input__hidden으로 갯수 추가됨 -->
					</div>
				</div> <!-- 대체 자제 -->
				
			</div> <!-- 선택한 자제, 대체 자제 -->
	
			<!-- 탄소, 가격 변경사항 -->
			<div class="compare-percent-box">
				
				<!-- 탄소배출량 -->
				<div class="compare-percent__carbon">
					<div>탄소배출량</div>
					<div class="modal-box_sort">
						<!-- 기본 자제 총 탄소배출량 -->
						<div class="cal-before"></div>
						<!-- 대체 자제 총 탄소배출량 -->
						<div class="cal-after"></div>
					</div>
				</div>
				
				<!-- 가격 -->
				<div class="compare-percent__price">
					<div>가격</div>
					<div class="modal-box_sort">
						<!-- 기본 자제 총 가격 -->
						<div class="cal-before"></div>
						<!-- 대체 자제 총 가격 -->
						<div class="cal-after"></div>
					</div>
				</div>
				
			</div> <!-- 탄소, 가격 변경사항 -->
			
		</div> <!-- 선택한 자제, 대체 자제 -->
		
		<!-- 초기화 버튼 -->
		<div id="resetSaveBtn" class="sjm-btn sjm-btn-primary">
			초기화
		</div> <!-- 초기화 버튼 -->
		
		<!-- 임시 저장 버튼 -->
		<div id="tempSaveBtn" class="sjm-btn sjm-btn-primary">
			임시 저장
		</div> <!-- 임시 저장 버튼 -->
		
		<!-- 저장 버튼 -->
		<div id="resultSaveBtn" class="sjm-btn sjm-btn-primary">
			저장
			
			<!-- 비로그인 시 로그인 창으로 가야됨 -->
		</div> <!-- 저장 버튼 -->
		
	</div> <!-- Finally Calculate Modal -->

	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<!-- 부트스트랩 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
		integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
		crossorigin="anonymous"></script>

	<!-- custom JavaScript -->
	<script type="text/javascript">
	
		// (추가할 기능) 처음 들어왔을 때 비로그인 시 로그인 안하면 저장 못한다고 알려주기
		if ("${login.userId}" == ""){
			if (window.confirm("비로그인 시 해당 견적을 저장해둘 수 없습니다. 로그인 하시겠습니까?")) {
				  // 사용자가 "확인"을 클릭한 경우 실행할 코드
					alert("로그인창으로 이동합니다.")
					location.href = "${pageContext.request.contextPath}/loginView";
				} else {
				  // 사용자가 "취소"를 클릭한 경우 실행할 코드
				}
		}


		/* model로 가져온 "basicMatter" : 모든 기본 자제들 */
		let v_matInfoDict = {}; // 모든 기본 자제들이 담길 dictionary
		
		let v_matInfoList = "${basicMatter}"; // model로 가져온 값들, estimateDTO 리스트를 string으로 가져오기 때문에 정제가 필요
		
		// 1. 모든 [ ,] 지우기
		v_matInfoList = v_matInfoList.replaceAll("\[", "").replaceAll("\]", "");
		
		// 2. EstimateDTO 로 split
		v_matInfoList = v_matInfoList.split("EstimateDTO");
		
		for (let i = 1; i < v_matInfoList.length; i++){// 3. 앞에 "" 이거 하나 생기는데 i = 1 로 무시
			let v_mat = v_matInfoList[i].split(","); // 4. ,로 다시 split
			v_matInfoDict[i-1] = {}; // 5. 숫자 키 지정
			
			// 6. = 으로 다시 split 후 dict으로 묶기
			for (let j = 0; j < v_mat.length; j++){
				v_matInfoDict[i-1][v_mat[j].trim().split("=")[0]] = v_mat[j].trim().split("=")[1]; // 딕셔너리 형태로 저장
			}
		}
		
		/* 예산 입력 정규식 */
		let v_budget = document.getElementById("budget");
		
		// 예산 입력 시 이벤트 발생
		v_budget.addEventListener('keyup', function(event) {
			// 0으로 시작하면 0 지우기 / 숫자 외 문자 입력방지
			this.value = this.value.replace(/^[0]|[^0-9,]/g, '');
			this.value = insertComma(this.value.replace(/[,]/g, ''));
		});
		
		/* 예산 입력 후 다음단계 */
		let v_container = document.querySelectorAll(".container");
		
		// 예산 입력 전까지 숨기기
		v_container[2].style.display = "none"; // 견적 구성
		v_container[3].style.display = "none"; // 임시 저장 리스트
		v_container[4].style.display = "none"; // 총 탄소배출량, 가격
		
		// 다음 버튼 클릭 시
		document.getElementById("budgetBtn").addEventListener("click", ()=>{
			while(true){
				if (!v_budget.value){
					alert("예산 입력 후 눌러주세요");
					break;
				} else {
					let v_intBudget = parseInt(v_budget.value.replaceAll(",", ""));
					console.log(v_intBudget);
					if (v_intBudget < 10000000){
						alert("최소 천만원 이상 입력해주세요.");
						break;
					}
					
					// 알맞은 예산 입력 시 숨겨진 기능들 보이기
					v_container[2].style.display = "block";
					v_container[3].style.display = "block";
					v_container[4].style.display = "block";
					break;
				}
			}
		});

		/* card */
		let v_materials = document.querySelectorAll(".materials"); // 선택한 자제들
		let v_materCategory = document.querySelectorAll(".mater-category"); // 자제 카테고리
		
		let v_btnModal = document.querySelectorAll(".btn-modal"); // 자제 선택 버튼
	
		/* modal */
		let v_addModal = document.querySelector(".add-modal"); // 선택한 카테고리별 모달 생성
		let v_modalBox = document.querySelector(".sjm_mocdal-box"); // 카테고리별 자제들 모달창 box(x 누를 경우 닫을 때 사용)
		
		/* 자제 선택 클릭 이벤트 */
		for (let i = 0; i < v_btnModal.length; i++) { 
			v_btnModal[i].addEventListener("click", () => {
				let v_category = "materCategory=" + v_materCategory[i].innerHTML; // 카테고리 ajax로 보낼 형태로 저장
				sendCategory(v_category, i); // 바닐라 ajax, 카테고리별 자제 정보 요청

				v_modalBox.style.display = "block"; // 모달창 활성화
			});
		}
		
		/* 닫기 클릭 */
		let v_selectModalCancel = document.getElementById("selectModalCancel");
		
		v_selectModalCancel.addEventListener("click", () => {
			v_modalBox.style.display = "none";
		});
		
		// 바닐라 ajax
		function sendCategory(v_category, cate_idx) {
			// 1. v_ajax 선언
			const v_ajax = new XMLHttpRequest();
			
			// 2. Http 요청 준비
			v_ajax.open('POST', '${pageContext.request.contextPath}/getMaterials', false);
			
			// 3. 요청 헤더 설정
			v_ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			
			// 응답 처리
			v_ajax.onload = () => {
				// 통신 성공 시
				if (v_ajax.status == 200){
					let v_data = v_ajax.response; // 카테고리에 맞는 모든 자제들 정보
					
					// JSON 문자열을 자바스크립트 배열로 변환
					v_data = JSON.parse(v_data);
					
					/* 모달창 생성 */
					v_addModal.innerHTML = "" // 카테고리 변경할 때마다 모달 초기화
					for (let i = 0; i < v_data.length; i++){
						
						// 모달 html 태그 (나중에 이거 한데 모아놓은 div 추가해야 다지안 가능 고칠거 개 많을듯;;)
						let v_query = ""
							/* 자제 이미지 */
							v_query += '<div class="modal-box__top">'
							v_query += '	<img src="' + v_data[i]['materImg'] + '">'
							v_query += '</div>'
							
							/* 자제 정보 */
							v_query += '<div class="modal-box__bottom">'
							v_query += '	<div class="modal-botton__material">' + v_data[i]['materName'] + '</div>'
							
							/* 자제 수치들(나중에 별점 5개로 시각화 필요) */
							v_query += '	<div class="modal-botton__rating">'
							v_query += '		<div>'
							v_query += '			<div>배출량</div>'
							v_query += '			<div>가격</div>'
							v_query += '			<div>내구성</div>'
							v_query += '		</div>'
							v_query += '		<div>'
							v_query += '			<div class="modal-botton__carbon">'
							v_query += '				' + v_data[i]['materGasKg']
							v_query += '			</div>'
							v_query += '			<div class="modal-botton__price">'
							v_query += '				' + v_data[i]['materPrice']
							v_query += '			</div>'
							v_query += '			<div class="modal-botton__durability">'
							v_query += '				' + v_data[i]['materDurability']
							v_query += '			</div>'
							v_query += '		</div>'
							v_query += '	</div>'
							
							/* 자제 설명 */
							v_query += '	<div class="modal-botton__explain">'
							v_query += '		' + v_data[i]['materInfo']
							v_query += '	</div>'
								
							/* 선택 버튼 */
							v_query += '	<div>'
							v_query += '		<button class="sjm-btn sjm-btn-primary btn-select">선택</button>'
							v_query += '	</div>'
							v_query += '</div>'
							
						v_addModal.innerHTML += v_query; // 태그 추가

						// 이미 선택된 것은 모달창에 출력 안하기
						// 총 탄소배출량이 나오는 span 태그(.children[0])
						// 밑에 hidden input(.children[1])에 생성되어 있는 경우
						let v_calCarbon = document.querySelector("#calCarbon");
						let v_calPrice = document.querySelector("#calPrice");
						
						if (v_calCarbon.children[1]){ // 한번이라도 작동했을 경우 실행
							for (let j = 0; j < v_calCarbon.children.length; j++){
								// ex) 구조용 강철,외장재 이런 식으로 저장되어 있음.
								let v_sameName = v_calCarbon.children[j].textContent.split(",")[0];
								let v_sameCategory = v_calCarbon.children[j].textContent.split(",")[1];
								if (v_sameName == v_data[i]['materName'] && v_sameCategory == v_data[i]['materCategory']){
									/* 이미 선택한 자제는 display:none를 줘서 안보이게 하기 */
									let v_modalBoxTop = document.querySelectorAll(".modal-box__top")[i];
									let v_modalBoxBottom = document.querySelectorAll(".modal-box__bottom")[i];
									
									v_modalBoxTop.style.display = "none";
									v_modalBoxBottom.style.display = "none";
									break;
								}
							}
						}
						
					}
					
					/* 모달 별 자제 등록 버튼 및 닫기 버튼(닫기 버튼은 다른 걸로 수정 예정) */
					let v_btnSelect = document.querySelectorAll(".btn-select"); // 등록
					let v_btnCancel = document.querySelectorAll(".btn-cancel"); // 닫기
					
					for (let i = 0; i < v_data.length; i++){
						// 클릭 시 선택한 자제 등록
						v_btnSelect[i].addEventListener("click", ()=>{
							
							// 새로운 자재 요소를 생성
							let v_newMaterialDiv = document.createElement("div");
							v_newMaterialDiv.classList.add("material-box__add");
							
							// 등록한 자제 html 태그
							v_newMaterialDiv.innerHTML = v_data[i]['materName'] + '<br> <input type="number" oninput="f_inputValue()" value="0">kg';
							// 닫기 이미지
							v_newMaterialDiv.innerHTML += '<img width="18px" height="18px" src="${pageContext.request.contextPath}/img/delete_icon.png">'
							
							// 숨겨진 input 요소 생성
							let v_price = document.createElement("input");
							v_price.type = "hidden";
							v_price.value = v_data[i]['materPrice'];
							
							let v_carbon = document.createElement("input");
							v_carbon.type = "hidden";
							v_carbon.value = v_data[i]['materGasKg'];
							
							// 새로 생성한 요소들을 추가
							v_materials[cate_idx].appendChild(v_newMaterialDiv);
							v_newMaterialDiv.appendChild(v_price);
							v_newMaterialDiv.appendChild(v_carbon);
							
							v_modalBox.style.display = "none"; // 모달창 닫기
							
							// 등록할 자제 정보 딕셔너리로 저장
							let v_materDataDict = {'matName' : v_data[i]['materName']
								, 'matPrice' : v_data[i]['materPrice']
								, 'matCarbon' : v_data[i]['materGasKg']
								, 'matCategory' : v_data[i]['materCategory']}
							
							// 따로 먼저 실행 안할 시 input에 입력해야만 실행되기 때문에 먼저 실행
							f_inputValue(0, v_materDataDict);
							
							// 자제 kg 입력 시 정규식 규정 및 계산
						    let inputElement = v_newMaterialDiv.querySelector("input[type='number']");
							
							// 선택한 자제의 input 태그 입력 시 이벤트 발생
						    inputElement.addEventListener("keyup", function (event) {
						        if (!(this.value == 0)){ // 그냥 0일 경우 실행 X
							        // 0으로 시작하면 0 지우기 / 숫자 외 문자 입력 방지
							        this.value = this.value.replace(/^[0]|[^0-9,]/g, '');
						        }
						        
						        // 계산 실행
						        f_inputValue(this.value, v_materDataDict);
						    });

						    // 선택 자제 삭제하기
						    let imgElement = v_newMaterialDiv.querySelector("img");
						    imgElement.addEventListener("click", () => {
						    	v_newMaterialDiv.remove();
								f_deleteValue(v_materDataDict);
						    });
						    
						})
					}
					
				}
			}
			
			/* parameter : 카테고리 */
			v_ajax.send(v_category); // 서버에 요청
		}
		
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
		
		/* 계산식 */
		// parameter : 자제 Kg(갯수) , 해당 자제 정보
		function f_inputValue(inputNum, v_materDataDict){
			
			// 가끔 undefined로 값이 와서 추가
			if (inputNum == null){
				return;
			}
			
			let v_calCarbon = document.querySelector("#calCarbon"); // 총 탄수배출량
			let v_calPrice = document.querySelector("#calPrice"); // 총 가격

			// str to int
			inputNum = parseInt(inputNum);
			
			/* 이미 같은 input 태그 생성 시 넘어가기 */
			let v_existInput = false; // 존재 시 on
			if (v_calCarbon.children[1]){ // input태그가 있을 경우 실행(= 첫 실행일 경우 실행 X)
				for (let i = 1; i < v_calCarbon.children.length; i++){
					// ex) 구조용 강철,외장재 이런 식으로 저장되어 있음.
					let v_sameName = v_calCarbon.children[i].textContent.split(",")[0];
					let v_sameCategory = v_calCarbon.children[i].textContent.split(",")[1];
					if (v_sameName == v_materDataDict['matName'] && v_sameCategory == v_materDataDict['matCategory']){
						// 계산 대상과 그 갯수를 다음과 같이 저장 ex) 1.23,5
						v_calCarbon.children[i].children[0].value = v_materDataDict['matCarbon'] + "," + inputNum;
						v_calPrice.children[i].children[0].value = v_materDataDict['matPrice'] + "," + inputNum;
						
						v_existInput = true;
						break;
					}
				}
			}
			
			// 첫 선택일 경우만 실행
			if (!v_existInput) {
				console.log("생성이 안된다고??")
				/* 탄소배출량 태그 추가 */
				let v_tempDiv = document.createElement("div");
				v_tempDiv.style.display = "none";
				v_tempDiv.innerHTML = v_materDataDict['matName'] + "," + v_materDataDict['matCategory'];
				
				// 탄소배출량 input 태그 추가
				let v_carbon = document.createElement("input");
				v_carbon.type = "hidden";
				v_carbon.value = v_materDataDict['matCarbon'] + "," + inputNum; // 계산 대상과 그 갯수를 다음과 같이 저장 ex) 1.23,5
				v_tempDiv.appendChild(v_carbon); // div 태그에 추가
				
				// 총 탄소배출량 밑에 추가
				v_calCarbon.appendChild(v_tempDiv);

				/* 가격 태그 추가 */
				v_tempDiv = document.createElement("div");
				v_tempDiv.style.display = "none";
				v_tempDiv.innerHTML = v_materDataDict['matName'] + "," + v_materDataDict['matCategory'];

				// 가격 input 태그 추가
				let v_price = document.createElement("input");
				v_price.type = "hidden";
				v_price.value = v_materDataDict['matPrice'] + "," + inputNum; // 계산 대상과 그 갯수를 다음과 같이 저장 ex) 5000,5
				v_tempDiv.appendChild(v_price); // div 태그에 추가
				
				// 총 가격 밑에 추가
				v_calPrice.appendChild(v_tempDiv);
	 			
	 			v_existInput = false; // 굳이 넣어야 되나?
			}
			
			// 최종 계산 출력
			f_finalCal(v_calCarbon, v_calPrice);
		}
		
		/* 선택 제외하기 */
		function f_deleteValue(v_materDataDict){
			
			let v_calCarbon = document.querySelector("#calCarbon");
			let v_calPrice = document.querySelector("#calPrice");
			
			for (let i = 0; i < v_calCarbon.children.length; i++){
				// ex) 구조용 강철,외장재 이런 식으로 저장되어 있음.
				let v_sameName = v_calCarbon.children[i].textContent.split(",")[0];
				let v_sameCategory = v_calCarbon.children[i].textContent.split(",")[1];
				if (v_sameName == v_materDataDict['matName'] && v_sameCategory == v_materDataDict['matCategory']){
					v_calCarbon.children[i].remove();
					v_calPrice.children[i].remove();
					
					break;
				}
			}
			
			// 최종 계산 출력
			f_finalCal(v_calCarbon, v_calPrice);
		}
		
		/* 최종 계산 함수 */
		// parameter : 총 탄소배출량 태그, 총 가격 태그
		function f_finalCal(v_calCarbon, v_calPrice){
			// 총 합 선언
			let v_carbonCost = 0;
			let v_priceCost = 0;
			
 			for (let i = 1; i < v_calCarbon.children.length; i++){
 				// ex) 4000,6 형식으로 저장되어 있음
				let v_splitCarbon = v_calCarbon.children[i].children[0].value.split(","); // div - div - input 태그
				let v_splitPrice = v_calPrice.children[i].children[0].value.split(","); // div - div - input 태그

				v_carbonCost += parseInt(v_splitCarbon[1]) * parseFloat(v_splitCarbon[0]); // 자제의 Kg(갯수) * 탄소배출량
				v_carbonCost = parseFloat(v_carbonCost.toFixed(2)); // 소수 둘째자리 까지 출력
				v_priceCost += parseInt(v_splitPrice[1]) * parseFloat(v_splitPrice[0]); // 자제의 Kg(갯수) * 가격
			}
			
 			// 최종 합계 출력
			v_calCarbon.children[0].innerHTML = v_carbonCost;
			v_calPrice.children[0].innerHTML = insertComma(v_priceCost.toString());
		}
		
	</script>

	<script type="text/javascript">
		/* 최종 결과 도출 */
		let v_resultBtn = document.getElementById("resultBtn"); // 계산 버튼
		let v_modalBoxCal = document.querySelector(".modal-box__cal"); // 전체 모달창
		
		/* 자제 정보 */
		let v_matInfoStack = []; // 불러오기 창에 추가될 것들 차곡차곡 쌓임
		let v_matInfo = {}; // 최종 결과에 임시저장할 자제들
		let v_subMatInfo = null; // 최종 결과에 임시저장할 대체 자제들
		let v_matNum = []; // 최종 결과에 임시저장할 자제들 갯수
		
		// 계산 버튼 클릭 시
		v_resultBtn.addEventListener("click", ()=>{
			
			let v_sendMaterials = {}; // ajax로 보낼 json 형식의 데이터
			
			// 선택한 자제들의 탄소배출량
			let v_calCarbons = document.getElementById("calCarbon"); 
			let v_sendCarbons = v_calCarbons.querySelectorAll("div");
			
			// 선택한 자제들의 가격
			let v_calPrices = document.getElementById("calPrice");
			let v_sendPrices = v_calPrices.querySelectorAll("div");
			
			for (let i = 0; i < v_sendCarbons.length; i++){
				let v_matCategory = v_sendCarbons[i].textContent.split(",")[1]; // 카테고리
				let v_matName = v_sendCarbons[i].textContent.split(",")[0]; // 자제명
				let v_matCarbon = v_sendCarbons[i].children[0].value.split(",")[0]; // 탄소배출량 
				
				let v_matPrice = v_sendPrices[i].children[0].value.split(",")[0]; // 가격
				let v_matKg = v_sendPrices[i].children[0].value.split(",")[1]; // 사용량(kg)
				
				// ajax에 보낼 데이터는 {카테고리, 자제명, 사용량(kg)}
				v_sendMaterials[i] = {'matCategory': v_matCategory
						, 'matName' : v_matName
						, 'matCarbon' : v_matCarbon
						, 'matPrice' : v_matPrice
						, 'matKg': v_matKg}
			}
			
			// ajax 통신 함수
			f_ajaxJsonString(v_sendMaterials, 50);
			
		});
		
		/* 범위 지정 */
		const v_calRange = document.getElementById("calRange"); // 범위 input 태그
 		document.addEventListener("DOMContentLoaded", function() { // 이건 안넣으면 바뀔 때마다 적용이 안됨
			v_calRange.addEventListener("input", function() { // input 태그 바뀔 시 이벤트 발생
				let v_sendMaterials = {}; // ajax로 보낼 json 형식의 데이터
				
				// 선택한 자제들의 탄소배출량
				let v_calCarbons = document.getElementById("calCarbon"); 
				let v_sendCarbons = v_calCarbons.querySelectorAll("div");
				
				// 선택한 자제들의 가격
				let v_calPrices = document.getElementById("calPrice");
				let v_sendPrices = v_calPrices.querySelectorAll("div");
				
				for (let i = 0; i < v_sendCarbons.length; i++){
					let v_matCategory = v_sendCarbons[i].textContent.split(",")[1]; // 카테고리
					let v_matName = v_sendCarbons[i].textContent.split(",")[0]; // 자제명
					let v_matCarbon = v_sendCarbons[i].children[0].value.split(",")[0]; // 탄소배출량 
					
					let v_matPrice = v_sendPrices[i].children[0].value.split(",")[0]; // 가격
					let v_matKg = v_sendPrices[i].children[0].value.split(",")[1]; // 사용량(kg)
					
					// ajax에 보낼 데이터는 {카테고리, 자제명, 사용량(kg)}
					v_sendMaterials[i] = {'matCategory': v_matCategory
							, 'matName' : v_matName
							, 'matCarbon' : v_matCarbon
							, 'matPrice' : v_matPrice
							, 'matKg': v_matKg}
				}
				
				// ajax 통신 함수
				f_ajaxJsonString(v_sendMaterials, this.value);
			});
		});
		
		
		
		/* 최종 결과 출력 */
		// parameter : json 형식의 선택 자제들 데이터, 현재 범위 input의 this.value
		function f_ajaxJsonString(v_sendMaterials, v_range){
			// 선택한 자제들 ajax로 보내기 전에 원본 유지
			let v_basicMatDict = v_sendMaterials;
			
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

					console.log("선택된 자제들");
					console.log(v_basicMat);
					console.log(v_subMat);
					console.log("선택된 자제들 - 완 - ");

					/* 기본자제, 대체자제 모달창에 추가 */
					let v_change = false; // false : 기본자제, true : 대체자제
					let v_subCarbonSum = 0; // 대체 자제 총 탄소배출량
					let v_subPriceSum = 0; // 대체 자제 총 가격
					
					// 최종 자제들 모달
					let v_matBox = document.querySelectorAll(".mat-box"); // 기본 자제들, 대체 자제들
					let v_selectMat = document.querySelectorAll(".select-mat"); // 각 카테고리별 자제들
					
					for (let k = 0; k < v_matBox.length; k++){ // k = 0:기본자제, 1:대체자제
						for (let i = 0; i < v_matBox[k].children.length; i++){
							// category 공백제거 div - div - div(카테고리명)
							let v_category = v_matBox[k].children[i].children[0].innerHTML.trim();
							
							let v_tempDiv = document.createElement("div");
							
							if (v_matBox[k].children[i].children.length == 1){
								v_matBox[k].children[i].appendChild(v_tempDiv);
							} else {
								v_matBox[k].children[i].children[1].remove();
								v_matBox[k].children[i].appendChild(v_tempDiv);
							}
							
							// 자제 정보 html에 추가
							if (!v_change){ // 기본 자제
								for (let data of v_basicMat){
									if (data['matCategory'] == v_category){
										v_matBox[k].children[i].children[1].innerHTML +=  data["matName"] + "<br>";
										v_matBox[k].children[i].children[1].innerHTML += '<input type="hidden" value='+ data["matKg"] +'>';

									}
								}
							} else { // 대체 자제
								let cnt = 1; // 기본, 대체 자제는 순서가 똑같기 때문에 인덱스 값도 같음
								for (let data of v_subMat){
									if (data['materCategory'] == v_category){
										v_matBox[k].children[i].children[1].innerHTML += data["materName"] + "<br>";
										let v_num = v_matBox[0].children[i].children[1].children[cnt].value; 
										
										// 대체 자제들 총 탄소, 가격
										v_subCarbonSum += data['materGasKg'] * v_num;
										v_subPriceSum += data['materPrice'] * v_num;
										cnt+=2; // 인덱스 증가
									}
								}
							}
						}
						
						// 대체 자제 계산
						v_change = true;
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
					v_modalBoxCal.style.display = "block";
 					
 					v_matInfo = {}; // 선택한 기본 자제들의 정보, 계산마다 초기화 해줘야함
 					v_matNum = []; // 선택한 기본 자제들 Kg(갯수), 계산마다 초기화 해줘야함
 					
 					// 모든 기본 자제들(v_matInfoDict) 에서 선택 자제들(v_basicMat)의 정보만 가져오기
 					for (let i = 0; i < Object.keys(v_matInfoDict).length; i++){
 						for (let j = 0; j < v_basicMat.length; j++){
 							if (v_basicMat[j]['matName'] == v_matInfoDict[i]['materName'] && v_basicMat[j]['matCategory'] == v_matInfoDict[i]['materCategory']){

 								// 값 추가
 			 					v_matInfo[Object.keys(v_matInfo).length] = v_matInfoDict[i];
 			 					v_matNum.push(v_basicMat[j]['matKg']);
 							}
 						}
 					}
 					
 					// 선택된 대체 자제들
					v_subMatInfo = v_subMat;
				}
			}
			
			// 데이터 요청
			v_ajax.send(v_sendMaterials);
		}
		
		/* 최종 결과 모달창 닫기 */
		let v_calModalCancel = document.getElementById("calModalCancel");
		
		v_calModalCancel.addEventListener("click", () => {
			v_modalBoxCal.style.display = "none";
		});

		/* 임시 저장 버튼 클릭 시 이벤트 발생 */
		document.querySelector("#tempSaveBtn").addEventListener("click", () => {
			/* 자제별 갯수 가져오고, 불러오기 창에 hidden으로 카테고리,이름으로 저장해놓기 */
			v_matInfoStack.push(v_matInfo); // 짝수는 자제정보가
			v_matInfoStack.push(v_matNum); // 홀수는 자제갯수가 저장됨.
			
			console.log(v_matInfoStack);
			
			// 임시저장 box
			let v_tempSave = document.getElementById("tempSave");
			
			let v_query = "";
			v_query += '<div class="temp-save__obj">';
			v_query += '	<div class="sjm-btn sjm-btn-primary temp-save-btn">불러오기</div>';
			v_query += '	<div>' + v_matInfo[0]['materName'] + ' 외 ' + (Object.keys(v_matInfo).length - 1)  + '개' + '</div>';
			v_query += '	<input type="hidden" value="' + Object.keys(v_matInfoStack).length + '">'; // 이 값으로 불러오기 버튼 클릭 시 이벤트 구분
			v_query += '</div>';
			
			v_tempSave.innerHTML += v_query;
			let v_tempSaveBtn = document.querySelectorAll(".temp-save-btn");
			
			for (let idx = 0; idx < v_tempSave.children.length; idx++){
				v_tempSaveBtn[idx].addEventListener("click", ()=>{
					// hidden input의 value 값에 각 불러오기 별 key값을 넣어놔서 가져오는 절차(2, 4, 6... 이렇게 가져옴)
					let v_stackKey = v_tempSaveBtn[idx].nextElementSibling.nextElementSibling.value;
					console.log(v_stackKey);
					
					v_matInfo = v_matInfoStack[v_stackKey - 2]; // 자제 정보
					v_matNum = v_matInfoStack[v_stackKey - 1]; // 자제 갯수
					
					let v_materCategorys = document.querySelectorAll(".mater-category"); // 카테고리
					let v_materials = document.querySelectorAll(".materials"); // 선택 자제들 보이는 곳
					
					/* 총합에 저장되어있는 hidden 값들 초기화 */
					// 탄소배출량
					let v_calCarbons = document.getElementById("calCarbon");
					if (v_calCarbons.querySelectorAll("div")){
						let v_sendCarbons = v_calCarbons.querySelectorAll("div");
						for (let i = 0; i < v_sendCarbons.length; i++) {
							  v_sendCarbons[i].remove();
						}
					}
					
					// 가격
					let v_calPrices = document.getElementById("calPrice");
					if (v_calPrices.querySelectorAll("div")){
						let v_sendPrices = v_calPrices.querySelectorAll("div");
						for (let i = 0; i < v_sendPrices.length; i++) {
							v_sendPrices[i].remove();
						}
					}
					
					for (let i = 0; i < v_materials.length; i++){
						/* 불러오기 클릭 시 기존에 있던거 싹다 초기화 */
						v_materials[i].innerHTML = "";
						
						for(let j = 0; j < Object.keys(v_matInfo).length; j++){
							if (v_materCategorys[i].innerHTML == v_matInfo[j]['materCategory']){
								console.log(v_materCategorys[i].innerHTML);
								
								console.log(v_matInfo);
								// 새로운 자재 요소를 생성
								let v_newMaterialDiv = document.createElement("div");
								v_newMaterialDiv.classList.add("material-box__add");
								
								// 등록한 자제 html 태그
								v_newMaterialDiv.innerHTML = v_matInfo[j]['materName'] + '<br> <input type="number" oninput="f_inputValue()" value=' + v_matNum[j] + '>kg';
								v_newMaterialDiv.innerHTML += '<img width="18px" height="18px" src="${pageContext.request.contextPath}/img/delete_icon.png">'
								
								// 숨겨진 input 요소 생성
								let v_price = document.createElement("input");
								v_price.type = "hidden";
								v_price.value =  v_matInfo[j]['materPrice'];
								
								let v_carbon = document.createElement("input");
								v_carbon.type = "hidden";
								v_carbon.value =  v_matInfo[j]['materGasKg'];
								
								// 새로 생성한 요소들을 추가
								v_materials[i].appendChild(v_newMaterialDiv);
								v_newMaterialDiv.appendChild(v_price);
								v_newMaterialDiv.appendChild(v_carbon);
								
								// 등록할 자제 정보 딕셔너리로 저장
								let v_materDataDict = {'matName' : v_matInfo[j]['materName']
									, 'matPrice' : v_matInfo[j]['materPrice']
									, 'matCarbon' : v_matInfo[j]['materGasKg']
									, 'matCategory' : v_matInfo[j]['materCategory']}
								
								console.log(v_materDataDict);
								
								// 따로 먼저 실행 안할 시 input에 입력해야만 실행되기 때문에 먼저 실행
								f_inputValue(v_matNum[j], v_materDataDict);
								
								// 자제 kg 입력 시 정규식 규정 및 계산
							    let inputElement = v_newMaterialDiv.querySelector("input[type='number']");
							    inputElement.addEventListener("keyup", function (event) {
							        if (!(this.value == 0)){ // 그냥 0일 경우 실행 X
								        // 0으로 시작하면 0 지우기 / 숫자 외 문자 입력 방지
								        this.value = this.value.replace(/^[0]|[^0-9,]/g, '');
							        }
							        
							        // 계산 실행
							        f_inputValue(this.value, v_materDataDict);
							    });
	
							    // 선택 자제 삭제하기
							    let imgElement = v_newMaterialDiv.querySelector("img");
							    imgElement.addEventListener("click", () => {
							    	v_newMaterialDiv.remove();
									f_deleteValue(v_materDataDict);
							    });
							}
						}
					}
				})
			}
			
			// 모달창 닫기
			v_modalBoxCal.style.display = "none";
		});
		
		/* 저장 버튼 클릭 시 값들 DB에 저장 */
		let v_resultSaveBtn = document.getElementById("resultSaveBtn");
		
		v_resultSaveBtn.addEventListener("click", () => {
			console.log("최종 저장");
			console.log(v_matInfo);
			console.log(v_subMatInfo);
			console.log(v_matNum);
			
			// JSONString으로 변환 및 ajax로 보내기 위한 변형
			let basicMater = {};
			
			for (let i = 0; i < Object.keys(v_matInfo).length; i++){
				basicMater[i] = {};
				basicMater[i]['materNo'] = v_matInfo[i]['materNo'];
				basicMater[i]['materCategory'] = v_matInfo[i]['materCategory'];
				basicMater[i]['materName'] = v_matInfo[i]['materName'];
				basicMater[i]['materGasKg'] = v_matInfo[i]['materGasKg'];
				basicMater[i]['materPrice'] = v_matInfo[i]['materPrice'];
				basicMater[i]['materKg'] = v_matNum[i];
			}
			
			
			basicMater = JSON.stringify(basicMater);
			console.log(basicMater);
			basicMater = "basicMater=" + basicMater;
			console.log("${login.userId}");
			basicMater += "&userId=" + "${login.userId}";
			
			const v_ajax = XMLHttpRequest();
			v_ajax.open("POST" , "${pageContext.request.contextPath}/saveMaterials", false);
			v_ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			v_ajax.onload = () => {
				if (v_ajax.status == 200){
					console.log(v_ajax.response);
				}
			}
			
			v_ajax.send(basicMater);
		});
	</script>
</body>
</html>