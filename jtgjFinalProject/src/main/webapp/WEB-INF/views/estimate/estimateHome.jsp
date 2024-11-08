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

	<div class="container">
		<div class="main-title">
			<div class="header-font">STEP 1) 예산을, 예산을 입력해라.</div>
			<div class="burget-input-box">
				<input class="input-burget" type="text" placeholder="단위 : 원" id="burget">
			</div>
			<div class="burget-btn-box">
				<div class="btn btn-primary">다음</div>
			</div>

		</div>
	</div>

	<div class="container">
		<div class="main-title">
			<div class="header-font">STEP 2) 견적을, 견적을 구성해라</div>

			<div class="card-wrapper">
				<div class="card-box" style="height: 500px;">
					<div class="card-box__top">
						<div class="mater-category">외장재</div>
						<img src="${pageContext.request.contextPath}/img/test/아이젠소스케.png">
					</div>
					<div class="card-box__bottom">
						<div class="materials" style="height: 80%;">
						</div>
						<div class="btn-box" style="height: 20%;">
							<div class="btn btn-primary btn-modal">자제 추가하기</div>
						</div>
					</div>
				</div>
				<div class="card-box" style="height: 500px;">
					<div class="card-box__top">
						<div class="mater-category">지붕재</div>
						<img src="${pageContext.request.contextPath}/img/test/아이젠소스케.png">
					</div>
					<div class="card-box__bottom">
						<div class="materials" style="height: 80%;">
							<div>어쩌구</div>
							<div>저쩌구</div>
							<div>어절시구</div>
						</div>
						<div class="btn-box" style="height: 20%;">
							<div class="btn btn-primary">자제 추가하기</div>
						</div>
					</div>
				</div>
				<div class="card-box" style="height: 500px;">
					<div class="card-box__top">
						<div class="mater-category">창호재</div>
						<img src="${pageContext.request.contextPath}/img/test/아이젠소스케.png">
					</div>
					<div class="card-box__bottom">
						<div class="materials" style="height: 80%;">
							<div>어쩌구</div>
							<div>저쩌구</div>
							<div>어절시구</div>
						</div>
						<div class="btn-box" style="height: 20%;">
							<div class="btn btn-primary">자제 추가하기</div>
						</div>
					</div>
				</div>
				<div class="card-box" style="height: 500px;">
					<div class="card-box__top">
						<div class="mater-category">주방</div>
						<img src="${pageContext.request.contextPath}/img/test/아이젠소스케.png">
					</div>
					<div class="card-box__bottom">
						<div class="materials" style="height: 80%;">
							<div>어쩌구</div>
							<div>저쩌구</div>
							<div>어절시구</div>
						</div>
						<div class="btn-box" style="height: 20%;">
							<div class="btn btn-primary">자제 추가하기</div>
						</div>
					</div>
				</div>
				<div class="card-box" style="height: 500px;">
					<div class="card-box__top">
						<div class="mater-category">욕실</div>
						<img src="${pageContext.request.contextPath}/img/test/아이젠소스케.png">
					</div>
					<div class="card-box__bottom">
						<div class="materials" style="height: 80%;">
							<div>어쩌구</div>
							<div>저쩌구</div>
							<div>어절시구</div>
						</div>
						<div class="btn-box" style="height: 20%;">
							<div class="btn btn-primary">자제 추가하기</div>
						</div>
					</div>
				</div>
				<div class="card-box" style="height: 500px;">
					<div class="card-box__top">
						<div class="mater-category">거실</div>
						<img src="${pageContext.request.contextPath}/img/test/아이젠소스케.png">
					</div>
					<div class="card-box__bottom">
						<div class="materials" style="height: 80%;">
							<div>어쩌구</div>
							<div>저쩌구</div>
							<div>어절시구</div>
						</div>
						<div class="btn-box" style="height: 20%;">
							<div class="btn btn-primary">자제 추가하기</div>
						</div>
					</div>
				</div>
				<div class="card-box" style="height: 500px;">
					<div class="card-box__top">
						<div class="mater-category">방</div>
						<img src="${pageContext.request.contextPath}/img/test/아이젠소스케.png">
					</div>
					<div class="card-box__bottom">
						<div class="materials" style="height: 80%;">
							<div>어쩌구</div>
							<div>저쩌구</div>
							<div>어절시구</div>
						</div>
						<div class="btn-box" style="height: 20%;">
							<div class="btn btn-primary">자제 추가하기</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- Modal -->
	<div class="sjm_mocdal-box">
		<div class="modal-box__top">
			<img src="${pageContext.request.contextPath}/img/test/아이젠소스케2.png">
		</div>
		<div class="modal-box__bottom">
			<div class="modal-botton__material"></div>
			<div class="modal-botton__rating">
				<div>
					<div>
						배출량
					</div>
					<div>
						가격
					</div>
					<div>
						내구성
					</div>
				</div>
				<div>
					<div class="modal-botton__carbon">
						<!-- db값 -->
					</div>
					<div class="modal-botton__price">
						<!-- db값 -->
					</div>
					<div class="modal-botton__durability">
						<!-- db값 -->
					</div>
				</div>
			</div>
			<div class="modal-botton__explain">
				<!-- db값 -->
			</div>
			<div>
				<button class="btn btn-primary btn-select">선택</button>
				<button class="btn btn-danger btn-cancel">닫기</button>
			</div>
		</div>
	</div>




	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
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

	<script type="text/javascript">
	
	
		// card
		let v_materials = document.querySelector(".materials");
		let v_materCategory = document.querySelector(".mater-category");
	
		// modal
		let v_modalBox = document.querySelector(".sjm_mocdal-box");

		let v_modalMterial = document.querySelector(".modal-botton__material");
		let v_modalCarbon = document.querySelector(".modal-botton__carbon");
		let v_modalPrice = document.querySelector(".modal-botton__price");
		let v_modalDurability = document.querySelector(".modal-botton__durability");
		let v_modalExplain = document.querySelector(".modal-botton__explain");
		
		// modal btn
		let v_btnModal = document.querySelector(".btn-modal");
		let v_btnSelect = document.querySelector(".btn-select");
		let v_btnCancel = document.querySelector(".btn-cancel");
		
		// 클릭 시 모달 생성
		v_btnModal.addEventListener("click", ()=>{
			let v_category = "materCategory=" + v_materCategory.innerHTML;
			sendCategory(v_category);
			console.log("굳");
			v_modalBox.style.display = "block";
		})
		
		// 클릭 시 선택한 값 넣기
		v_btnSelect.addEventListener("click", ()=>{
			let v_meterName = v_modalMterial.innerHTML;
			
			v_materials.innerHTML += '<div>' + v_meterName + ' <input type="number">kg' + '</div>';
			v_modalBox.style.display = "none";
		})
		
		// 클릭 시 모달 닫기
		v_btnCancel.addEventListener("click", ()=>{
			v_modalBox.style.display = "none";
		})
		
		
		
		
		// 바닐라 ajax
		function sendCategory(v_category) {
			// 1. v_ajax 선언
			const v_ajax = new XMLHttpRequest();
			
			// 2. Http 요청 준비
			v_ajax.open('POST', '${pageContext.request.contextPath}/getMaterials', false);
			
			// 3. 요청 헤더 설정
			v_ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			// v_ajax.responseType = "json"; // 응답을 JSON 객체로 설정
			
			// 응답 처리
			v_ajax.onload = () => {
				// 통신 성공 시
				if (v_ajax.status == 200){
					let v_data = v_ajax.response;
					// JSON 문자열을 자바스크립트 배열로 변환
					v_data = JSON.parse(v_data);
					console.log(v_data);
					
					v_modalMterial.innerHTML = v_data[0]['materName']
					v_modalCarbon.innerHTML = v_data[0]['materGasKg']
					v_modalPrice.innerHTML = v_data[0]['materPrice']
					v_modalDurability.innerHTML = v_data[0]['materDurability']
					v_modalExplain.innerHTML = v_data[0]['materInfo']
					
				}
			}
			
			v_ajax.send(v_category);
		}
		
	</script>
</body>
</html>