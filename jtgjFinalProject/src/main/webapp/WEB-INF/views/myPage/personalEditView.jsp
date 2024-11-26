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
	cursor: pointer;
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
		<!-- nav -->
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
					<div class="mt-4 mb-4" style="text-align:center;font-size:35px;font-weight:bolder;">
						<a style="text-decoration: none;  color: inherit;" href="${pageContext.request.contextPath }/myPage">${sessionScope.login.userName }님의 마이페이지</a>
					</div>
					
					<div style="display:flex; justify-content:center;"><hr style="width:68%;"></div>
					
					<div class="row d-flex justify-content-center">	
						<!-- 프로필 이미지 -->
						<c:if test="${sessionScope.login.userRank != 'Y'}">
							<div class="d-flex" style="flex-direction:column;align-items:center;margin-top:20px;margin-bottom:20px;">
								<div class="profile-div d-flex justifiy-content-center align-items-center">
									<c:if test="${sessionScope.login.userProfImg == 'N' }">
										<img id="profileImagePreview" class="profile-img" src="img/default_img.png">
									</c:if>
									<c:if test="${sessionScope.login.userProfImg != 'N' }">
										<img id="profileImagePreview" class="profile-img" src="${pageContext.request.contextPath }/displayProfImg?atchtype=prof_img&imgName=${sessionScope.login.userProfImg}">
									</c:if>
								</div>
								<input class="d-none" id="inputImage" type="file" accept="image/*" onchange="readImage(this);">
								<button class="btn btn-success mt-3 mb-3" style="width:10%;" onclick="resetImage()">사진 초기화</button>
							</div>
						</c:if>
					
						<!-- 개인정보 수정 -->
						<div class="col-xl-4 col-lg-5">
							<div class="card mb-4" style="padding-bottom:26px;">
								<div class="card-header">개인정보 수정</div>
								<div class="card-body">
							        <div class="mb-3">
							            <label for="inputId" class="form-label" style="font-weight:bolder;">아이디</label>
							            <div class="input-group d-flex">
							                <input type="text" class="form-control" id="inputId" style="background-color: #dddddd" value="${login.userId }" readonly>
							            </div>
							            
							            <div class="d-flex mt-2">
							            	<label class="me-3" id="label1"></label>
							            </div>  
							        </div>
							
							        <div class="mb-3">
							            <label for="inputPassword" class="form-label" style="font-weight:bolder;">새로운 비밀번호</label>
							            <div class="input-group mb-3">
							                <input type="password" class="form-control" id="inputPassword" placeholder="새로운 비밀번호를 입력하세요">
							            </div>
							            <label for="checkPassword" class="form-label" style="font-weight:bolder;">비밀번호 확인</label>
							            <div class="input-group">
							                <input type="password" class="form-control" id="checkPassword" placeholder="비밀번호를 입력하세요">
							            </div>
							            
							            <div class="d-flex mt-2">
							            	<label class="me-3" id="label"></label>
							            </div>  
							        </div>
							        
							        <div class="mb-3">
							            <label for="inputName" class="form-label" style="font-weight:bolder;">닉네임</label>
							            <div class="input-group mb-2">
							                <input type="text" class="form-control me-2" id="inputName" value="${login.userName }">
							            </div>
							        </div>
							
							        <div class="mb-3">
							            <label for="inputEmail" class="form-label" style="font-weight:bolder;">이메일</label>
							            <div class="input-group mb-2">
							                <input type="email" class="form-control me-2" id="inputEmail" value="${login.userEmail }" disabled>
							            </div>
							        </div>
							        
							        <div class="mb-3">
							            <label for="inputPhone" class="form-label" style="font-weight:bolder;">휴대폰</label>
							            <div class="input-group">
							                <input type="text" class="form-control" id="inputPhone" value="${login.userPhone }">
							            </div>
							        </div>												
								</div>
							</div>
							
							<div class="mt-2">
					            <button class="btn btn-primary btn-lg w-100 mb-2" id="editBtn" type="button" >수정하기</button>
					        	<p id="signUpWarning" style="display:none;">비밀번호 일치, 불일치 혹은 다른 항목에 빈칸이 있는지 확인해주세요!</p>
				        	</div>	
						</div>						
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div class="d-flex align-items-center justify-content-between small"></div>
				</div>
			</footer>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<!-- 오류 생김	
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script> 
	-->
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script>
		// 초기 이미지
		let imgElement  = document.getElementById('profileImagePreview');
		const initialImg = imgElement.src;
		const initialImgName = initialImg.split("=")[2];
		console.log(initialImgName);
		let selectedFile = null; // 전역 변수로 선택된 파일 저장
		let inputImageElement = document.getElementById('inputImage');
		
		// 프로필 이미지 클릭 시 숨겨놓은 input file 이 클릭됌
		$(".profile-img").on("click", () => {
			$("#inputImage").click();
		});
		
		$("#inputImage").on("change", function () {
			if(this.files && this.files[0]){
				// 파일이 선택된 경우 readImage 호출
				selectedFile = this.files[0]; // 선택된 파일 저장
				readImage(this); // 이미지 미리보기 없데이트
			} else {
				// 파일이 선택되지 않은 경우
				console.log("파일 선택 취소됨, 기본 이미지 유지");
			}
		});
		
		// 프로필 이미지 임시 변경(아직 수정 X)
		function readImage(input){
			if(selectedFile){
				const reader = new FileReader();
				
				// 파일 읽기가 완료되면 실행되는 콜백
				reader.onload = function (e) {
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
		
		// 서버에 보낼 변수값들
		let email = document.getElementById('inputEmail').value;
		let v_userName;
		let pw = $('#inputPassword');
		let rePw = $('#checkPassword');
		
		let v_editBtn = $('#editBtn'); // 가입하기 버튼
		let v_warning = $('#signUpWarning'); // 가입 조건 안내

		
		// 토글 활성화 boolean
		let pwOn = true;
		let nameOn = true;
		
		// 기업명
		function checkName(){
			v_userName = $('#inputName').val();
			console.log(v_userName);
			
			if(v_userName){
				nameOn = true;
				toggleSignUpButton();
			}else{
				nameOn = false;
				toggleSignUpButton();
			}
		}
		
		// 비밀번호 일치 여부 확인 함수
		function checkPasswordMatch() {
			pw = $('#inputPassword').val();
			rePw = $('#checkPassword').val();
			
			// 입력값이 모두 비어있으면
		    if (!pw || !rePw) {
		    	if(pw === rePw){
		    		pwOn = true;
		    		$('#label').text('');
		    	} else{
			        pwOn = false; // 비밀번호 확인 실패
			        $('#label').text('비밀번호를 입력해주세요.').css("color", "red").css("font-size", "13px");
		    	}
		    } else if (pw === rePw) { // 비밀번호가 일치할 때		   
		    	$.ajax({
		    		url:"${pageContext.request.contextPath}/ConfirmPassword",
		    		data: {
		    			email: email,
		    			password: pw
		    		},
		    		type:"POST",
		    		dataType:'json',
		    		success:function(result){
		    			if(result){
		    				pwOn = true;
		    				$('#label').text('비밀번호가 일치합니다.').css("color", "green").css("font-size", "13px");
		    			}else{
		    				pwOn = false;
		    				$('#label').text('이전 비밀번호와 동일합니다.').css("color", "red").css("font-size", "13px");
		    			}
		    			
		    			toggleSignUpButton();
		    		},
					error: function(xhr, status, error){
						console.error('AJAX 에러 발생:', error);
						alert('인증 요청 중 오류가 발생했습니다.');
					}
		    	});   
		    } else { // 비밀번호가 불일치할 때
		        pwOn = false; // 비밀번호 확인 실패
		        $('#label').text('비밀번호가 일치하지 않습니다.').css('color', 'red').css("font-size", "13px");
		    }
			
			toggleSignUpButton();
		}
		
		
		// 가입 버튼 활성화 상태 관리 함수
		function toggleSignUpButton() {
			if(pwOn && nameOn){
				v_editBtn.prop('disabled', false);
				v_warning[0]['attributes']['style']['value'] = "text-align:center;font-size:13px;color:red;font-weight:bolder;display:none;"
			} else {
				v_editBtn.prop('disabled', true);
				v_warning[0]['attributes']['style']['value'] = "text-align:center;font-size:13px;color:red;font-weight:bolder;display:'';"
			}
		}
		
		$('#inputPassword, #checkPassword').on("input", checkPasswordMatch); // 비밀번호 focusout 이벤트
		$("#inputName").on("focusout", checkName); // 유저이름 focusout 이벤트
		
		// 수정 버튼 클릭
		document.getElementById("editBtn").addEventListener("click", () => {
			if(confirm("회원정보를 수정하시겠습니까?")){
				
				// 1. 이미지 수정 처리
				if(selectedFile != null){
					let v_formData = new FormData();
					v_formData.append("file", selectedFile);
					
					for(let [key, value] of v_formData.entries()){
						console.log(key, ": ", value);
					}
					
					let v_url = "${pageContext.request.contextPath}/uploadProfile";	
					
					$.ajax({
						type:"POST",
						url:v_url,
						contentType:false,
						processData:false,
						enctype:"multipart/form-data",
						data:v_formData,
						success:function(data){
							console.log(data);
							console.log(data.result);
							
							let filePath = data.result;
							let reqSrcUrl = "${pageContext.request.contextPath}/displayProfImg";
							let atchtype = "prof_img";
							
							$(".profile-img").attr("src", reqSrcUrl + "?atchtype=" + atchtype + "&imgName=" + filePath);
						},
						error : function(req, st, err) {
							console.log('-------------------------------');
							console.log("request", req);
							console.log("status", st);
							console.log("errors", err);
							console.log('-------------------------------');
						}
					});
				} else {
					let reqSrcUrl = "${pageContext.request.contextPath}/displayProfImg";
					let atchtype = "prof_img";
					$(".profile-img").attr("src", reqSrcUrl + "?atchtype=" + atchtype + "&imgName=" + initialImgName);
				}

				
				// 2. 개인, 기업정보
				let phone = $("#inputPhone").val();
				let v_pw = $("#inputPassword").val();
				let id = $("#inputId").val();
				let name = $("#inputName").val();
				
				// inputId 와 inputEmail의 값과 일치하는 user, company_info 테이블 정보 변경
				// undefined 로 값이 매겨지는 것들은 기존 데이터 유지
				let requestData = {
						userId: id,
						userPw: v_pw,
						userEmail: email,
						userPhone: phone,
						userName: name,
				};
				
				console.log(requestData);
 				
				$.ajax({
					type:'POST',
					url:"${pageContext.request.contextPath}/personalEditDo",
					data:JSON.stringify(requestData),
					contentType:"application/json",
					success:function(result){
						if(result === true){
							alert("회원정보가 성공적으로 변경됐습니다!");
							location.href = "${pageContext.request.contextPath}/myPage";
						}else{
							alert("회원수정에 실패했습니다. 고객센터에 문의해주세요.");
						}
					},
					error: function(error){
						alert("오류가 발생했습니다. 고객센터에 문의해주세요.\n오류내용: " + error);
						console.log("Error occured:", error);
					}
				}); 
			}
		});
		
		
	</script>
</body>
</html>
