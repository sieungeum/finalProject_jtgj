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
			<div class="logo">
				<a href="index.html"> <img src="img/logo.png" alt="Logo">
				</a>
			</div>

			<!-- nav -->
			<%@ include file="/WEB-INF/inc/nav.jsp"%>

		</div>
	</div>

	<!-- burget input -->
	<div class="container">
		<div class="main-title">
			<div class="header-font">STEP 1) 예산을, 예산을 입력해라.</div>
			<div class="burget-input-box">
				<input class="input-burget" type="text" placeholder="단위 : 원"
					id="burget">
			</div>
			<div class="burget-btn-box">
				<div class="sjm-btn sjm-btn-success" >다음</div>
			</div>

		</div>
	</div>

	<!-- card -->
	<div class="container">
		<div class="main-title">
			<!-- 글머리 -->
			<div class="header-font">STEP 2) 견적을, 견적을 구성해라</div>

			<div class="card-wrapper">
				<!-- 1. 외장재 -->
				<div class="card-box" style="height: 500px;">
					<div class="card-box__top">
						<div class="mater-category">외장재</div>
						<img src="${pageContext.request.contextPath}/img/mat-category/mat_category1.jpg">
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
						<img src="${pageContext.request.contextPath}/img/mat-category/mat_category2.jpg">
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
						<img src="${pageContext.request.contextPath}/img/mat-category/mat_category3.jpg">
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
						<img src="${pageContext.request.contextPath}/img/mat-category/mat_category4.jpg">
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
						<img src="${pageContext.request.contextPath}/img/mat-category/mat_category5.jpg">
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
						<img src="${pageContext.request.contextPath}/img/mat-category/mat_category6.jpg">
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
						<img src="${pageContext.request.contextPath}/img/mat-category/mat_category7.jpg">
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

	<!-- 총 예산 및 총 탄소배출량 -->
	<div class="container">
		<div class="main-title">
			<div class="calculate-box">
			
				<!-- 탄소배출량 계산량(처음엔 0) -->
				<div class="calculate-carbon calculate-sort">
					<div class="cal-subtitle" style="letter-spacing: 1px;">탄소배출량</div>
					<div class="calculate-sort">
						<div id="calCarbon" class="cal-result-style" >
							<span class="cal-mr" >0</span>
							<!-- 여기부터 자제 선택 시 hidden으로 탄소배출량, kg 저장 -->
						</div>
						<span class="cal-ml" >KG</span>
					</div>
				</div>
				
				<!-- 자제 가격 계산(처음엔 0) -->
				<div class="calculate-cost calculate-sort">
					<div class="cal-subtitle" style="letter-spacing: 16px;">자제비</div>
					<div class="calculate-sort">
						<div id="calPrice" class="cal-result-style" >
							<span class="cal-mr" >0</span>
							<!-- 여기부터 자제 선택 시 hidden으로 가격, kg 저장 -->
						</div>
						<span class="cal-ml" >(원)</span>
					</div>
				</div>
			</div>
			
			<!-- 계산버튼 -->
			<div class="cal-btn-box">
				<div id="resultBtn" class="sjm-btn sjm-btn-success">계산</div>
			</div>

		</div>
	</div>
	
	<!-- Modal -->
	<div class="sjm_mocdal-box">
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
		/* card */
		let v_materials = document.querySelectorAll(".materials"); // 선택한 자제들
		let v_materCategory = document.querySelectorAll(".mater-category"); // 자제 카테고리
		
		let v_btnModal = document.querySelectorAll(".btn-modal"); // 자제 선택 버튼
	
		/* modal */
		let v_addModal = document.querySelector(".add-modal"); // 선택한 카테고리별 모달 생성
		let v_modalBox = document.querySelector(".sjm_mocdal-box");
		
		/* 예산 입력 정규식 */
		document.getElementById('burget').addEventListener('keyup', function(event) {
			// 0으로 시작하면 0 지우기 / 숫자 외 문자 입력방지        
			this.value = this.value.replace(/^[0]|[^0-9,]/g, '');
			this.value = insertComma(this.value.replace(/[,]/g, ''));
		});
		
		/* 자제 선택 클릭 이벤트 */
		for (let i = 0; i < v_btnModal.length; i++) { 
			v_btnModal[i].addEventListener("click", () => {
				let v_category = "materCategory=" + v_materCategory[i].innerHTML;
				sendCategory(v_category, i); // 바닐라 ajax, 카테고리별 자제 정보 요청

				v_modalBox.style.display = "block"; // 모달창 활성화
			});
		}
		
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
					let v_data = v_ajax.response;
					
					// JSON 문자열을 자바스크립트 배열로 변환
					v_data = JSON.parse(v_data);
					
					// 이미 선택된 것은 모달창에 추가 X
					let v_calCarbon = document.querySelector("#calCarbon");
					let v_calPrice = document.querySelector("#calPrice");
					
					/* 모달창 생성 */
					v_addModal.innerHTML = "" // 카테고리 변경할 때마다 모달 초기화
					for (let i = 0; i < v_data.length; i++){
						
						// 모달 html 태그
						let v_query = ""
							v_query += '<div class="modal-box__top">'
							v_query += '	<img src="' + v_data[i]['materImg'] + '">'
							v_query += '</div>'
							v_query += '<div class="modal-box__bottom">'
							v_query += '	<div class="modal-botton__material">' + v_data[i]['materName'] + '</div>'
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
							v_query += '	<div class="modal-botton__explain">'
							v_query += '		' + v_data[i]['materInfo']
							v_query += '	</div>'
							v_query += '	<div>'
							v_query += '		<button class="sjm-btn sjm-btn-primary btn-select">선택</button>'
							v_query += '		<button class="sjm-btn sjm-btn-danger btn-cancel">닫기</button>'
							v_query += '	</div>'
							v_query += '</div>'
							
						v_addModal.innerHTML += v_query;

						// 이미 선택된 것은 모달창에 출력 안하기
						if (v_calCarbon.children[1]){
							for (let j = 0; j < v_calCarbon.children.length; j++){
								let v_sameName = v_calCarbon.children[j].textContent.split(",")[0];
								if (v_sameName == v_data[i]['materName']){
									
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
							v_materials[cate_idx].appendChild(v_price);
							v_materials[cate_idx].appendChild(v_carbon);
							
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
						
						// 클릭 시 모달 닫기
						v_btnCancel[i].addEventListener("click", ()=>{
							v_modalBox.style.display = "none";
						})
					}
					
				}
			}
			
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
			if (v_calCarbon.children){ // input태그가 있을 경우 실행(= 첫 실행일 경우 실행 X)
				for (let i = 1; i < v_calCarbon.children.length; i++){
					let v_sameName = v_calCarbon.children[i].textContent.split(",")[0];
					if (v_sameName == v_materDataDict['matName']){
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
				// 탄소배출량 input 태그 추가
				let v_carbon = document.createElement("input");
				v_carbon.type = "hidden";
				// v_carbon.id = v_materDataDict['matName'] + "Carbon";
				v_carbon.value = v_materDataDict['matCarbon'] + "," + inputNum;
				
				let v_tempDiv = document.createElement("div");
				v_tempDiv.style.display = "none";
				v_tempDiv.innerHTML = v_materDataDict['matName'] + "," + v_materDataDict['matCategory'];
				v_tempDiv.appendChild(v_carbon);
				
				v_calCarbon.appendChild(v_tempDiv);
				
				// 가격 input 태그 추가
				let v_price = document.createElement("input");
				v_price.type = "hidden";
				// v_price.id = v_materDataDict['matName'] + "Price";
				v_price.value = v_materDataDict['matPrice'] + "," + inputNum;
				
				v_tempDiv = document.createElement("div");
				v_tempDiv.style.display = "none";
				v_tempDiv.innerHTML = v_materDataDict['matName'] + "," + v_materDataDict['matCategory'];
				v_tempDiv.appendChild(v_price);
				
				v_calPrice.appendChild(v_tempDiv);
	 			
	 			v_existInput = false;
			}
			
			// 최종 계산 출력
			f_finalCal(v_calCarbon, v_calPrice);
		}
		
		/* 선택 제외하기 */
		function f_deleteValue(v_materDataDict){
			
			let v_calCarbon = document.querySelector("#calCarbon");
			let v_calPrice = document.querySelector("#calPrice");
			
			for (let i = 0; i < v_calCarbon.children.length; i++){
				let v_sameName = v_calCarbon.children[i].textContent.split(",")[0];
				if (v_sameName == v_materDataDict['matName']){
					v_calCarbon.children[i].remove();
					v_calPrice.children[i].remove();
					
					break;
				}
			}
			
			// 최종 계산 출력
			f_finalCal(v_calCarbon, v_calPrice);
		}
		
		function f_finalCal(v_calCarbon, v_calPrice){

			// 총 합 선언
			let v_carbonCost = 0;
			let v_priceCost = 0;
			
 			for (let i = 1; i < v_calCarbon.children.length; i++){
 				// ex) 4000,6 형식으로 저장되어 있음
				let v_splitCarbon = v_calCarbon.children[i].children[0].value.split(",");
				let v_splitPrice = v_calPrice.children[i].children[0].value.split(",");

				v_carbonCost += parseInt(v_splitCarbon[1]) * parseFloat(v_splitCarbon[0]);
				v_carbonCost = parseFloat(v_carbonCost.toFixed(2)); // 소수 둘째자리 까지 출력
				v_priceCost += parseInt(v_splitPrice[1]) * parseFloat(v_splitPrice[0]);
			}
			
 			// 최종 합계 출력
			v_calCarbon.children[0].innerHTML = v_carbonCost;
			v_calPrice.children[0].innerHTML = insertComma(v_priceCost.toString());
		}
		
	</script>
	
	<script type="text/javascript">
		
		// 계산 버튼
		let v_resultBtn = document.getElementById("resultBtn");
		
		let v_sendMaterials = {};
		v_resultBtn.addEventListener("click", ()=>{
			
			// 선택한 자제들
			let v_calCarbons = document.getElementById("calCarbon");
			let v_sendCarbons = v_calCarbons.querySelectorAll("div");
			let v_calPrices = document.getElementById("calPrice");
			let v_sendPrices = v_calPrices.querySelectorAll("div");
			
			for (let i = 0; i < v_sendCarbons.length; i++){
				let v_matCategory = v_sendCarbons[i].textContent.split(",")[1];
				let v_matName = v_sendCarbons[i].textContent.split(",")[0];
				let v_matCarbon = v_sendCarbons[i].children[0].value.split(",")[0];
				
				let v_matPrice = v_sendPrices[i].children[0].value.split(",")[0];
				let v_matKg = v_sendPrices[i].children[0].value.split(",")[1];
				
				v_sendMaterials[i] = {'matCategory': v_matCategory
						, 'matName' : v_matName
						, 'matKg': v_matKg}
			}
			
			v_sendMaterials = JSON.stringify(v_sendMaterials);
			
			f_ajaxJsonStrin("sendMaterials=" + v_sendMaterials);
		});
		
		
		
		function f_ajaxJsonStrin(v_sendMaterials){
			
			const v_ajax = new XMLHttpRequest();
			
			v_ajax.open("POST", "${pageContext.request.contextPath}/calMaterial", false);
			
			v_ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			
			v_ajax.onload = () =>{
				// 통신 성공 시
				if (v_ajax.status == 200){
					let v_data = v_ajax.response;
					// v_data = JSON.parse(v_data);
					
					console.log(v_data);
				}
			}
			
			v_ajax.send(v_sendMaterials);
		}
		
	</script>
</body>
</html>