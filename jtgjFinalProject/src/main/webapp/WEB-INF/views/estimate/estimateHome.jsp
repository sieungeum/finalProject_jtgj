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

<%@ include file="/WEB-INF/inc/header.jsp"%>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">


<link rel="stylesheet" href="css/sjm/estimateHome.css">

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
				<div class="btn btn-primary">다음</div>
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
						<img src="${pageContext.request.contextPath}/img/test/아이젠소스케.png">
					</div>
					<div class="card-box__bottom">
						<div class="materials" style="height: 80%;"></div>
						<div class="btn-box" style="height: 20%;">
							<div class="btn btn-primary btn-modal">자제 추가하기</div>
						</div>
					</div>
				</div>
				
				<!-- 2. 지붕재 -->
				<div class="card-box" style="height: 500px;">
					<div class="card-box__top">
						<div class="mater-category">지붕재</div>
						<img src="${pageContext.request.contextPath}/img/test/아이젠소스케.png">
					</div>
					<div class="card-box__bottom">
						<div class="materials" style="height: 80%;"></div>
						<div class="btn-box" style="height: 20%;">
							<div class="btn btn-primary btn-modal">자제 추가하기</div>
						</div>
					</div>
				</div>
				
				<!-- 3. 창호재 -->
				<div class="card-box" style="height: 500px;">
					<div class="card-box__top">
						<div class="mater-category">창호재</div>
						<img src="${pageContext.request.contextPath}/img/test/아이젠소스케.png">
					</div>
					<div class="card-box__bottom">
						<div class="materials" style="height: 80%;"></div>
						<div class="btn-box" style="height: 20%;">
							<div class="btn btn-primary btn-modal">자제 추가하기</div>
						</div>
					</div>
				</div>
				
				<!-- 4. 주방 -->
				<div class="card-box" style="height: 500px;">
					<div class="card-box__top">
						<div class="mater-category">주방</div>
						<img src="${pageContext.request.contextPath}/img/test/아이젠소스케.png">
					</div>
					<div class="card-box__bottom">
						<div class="materials" style="height: 80%;"></div>
						<div class="btn-box" style="height: 20%;">
							<div class="btn btn-primary btn-modal">자제 추가하기</div>
						</div>
					</div>
				</div>
				
				<!-- 5. 욕실 -->
				<div class="card-box" style="height: 500px;">
					<div class="card-box__top">
						<div class="mater-category">욕실</div>
						<img src="${pageContext.request.contextPath}/img/test/아이젠소스케.png">
					</div>
					<div class="card-box__bottom">
						<div class="materials" style="height: 80%;"></div>
						<div class="btn-box" style="height: 20%;">
							<div class="btn btn-primary btn-modal">자제 추가하기</div>
						</div>
					</div>
				</div>
				
				<!-- 6. 거실 -->
				<div class="card-box" style="height: 500px;">
					<div class="card-box__top">
						<div class="mater-category">거실</div>
						<img src="${pageContext.request.contextPath}/img/test/아이젠소스케.png">
					</div>
					<div class="card-box__bottom">
						<div class="materials" style="height: 80%;"></div>
						<div class="btn-box" style="height: 20%;">
							<div class="btn btn-primary btn-modal">자제 추가하기</div>
						</div>
					</div>
				</div>
				
				<!-- 7. 방 -->
				<div class="card-box" style="height: 500px;">
					<div class="card-box__top">
						<div class="mater-category">방</div>
						<img src="${pageContext.request.contextPath}/img/test/아이젠소스케.png">
					</div>
					<div class="card-box__bottom">
						<div class="materials" style="height: 80%;"></div>
						<div class="btn-box" style="height: 20%;">
							<div class="btn btn-primary btn-modal">자제 추가하기</div>
						</div>
					</div>
				</div>
				
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
	<%@ include file="/WEB-INF/inc/footer.jsp"%>\
	
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
					
					/* 모달창 생성 */
					v_addModal.innerHTML = "" // 카테고리 변경할 때마다 모달 초기화
					for (let i = 0; i < v_data.length; i++){
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
							v_query += '		<button class="btn btn-primary btn-select">선택</button>'
							v_query += '		<button class="btn btn-danger btn-cancel">닫기</button>'
							v_query += '	</div>'
							v_query += '</div>'
							
						v_addModal.innerHTML += v_query;
					}
					
					/* 모달 별 자제 등록 버튼 및 닫기 버튼(닫기 버튼은 다른 걸로 수정 예정) */
					let v_btnSelect = document.querySelectorAll(".btn-select"); // 등록
					let v_btnCancel = document.querySelectorAll(".btn-cancel"); // 닫기
					
					for (let i = 0; i < v_data.length; i++){
						// 클릭 시 선택한 자제 등록
						v_btnSelect[i].addEventListener("click", ()=>{
							v_materials[cate_idx].innerHTML += '<div>' + v_data[i]['materName'] + ' <input type="number">kg' + '</div>';
							v_modalBox.style.display = "none";
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
		
	</script>
</body>
</html>