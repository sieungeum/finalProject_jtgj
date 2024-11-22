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
						<a class="nav-link" style="color: white; padding-top: 30px;" href="${pageContext.request.contextPath }/editView"> 수정 </a> 
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
										<img id="profileImagePreview" class="profile-img" src="${pageContext.request.contextPath }/displayImage?imgName=${sessionScope.login.memProfImg}">"
									</c:if>
								</div>
								<input class="d-none" id="inputImage" type="file" accept="image/*" onchange="readImage(this); uploadFile(this)">
								<button class="btn btn-success mt-3 mb-3" style="width:10%;">사진 초기화</button>
							</div>
						</c:if>
					
						<!-- 개인정보 수정 -->
						<div class="col-xl-4 col-lg-5">
							<div class="card mb-4">
								<div class="card-header">개인정보 수정</div>
								<div class="card-body">
							        <div class="mb-3">
							            <label for="inputId" class="form-label" style="font-weight:bolder;">아이디</label>
							            <div class="input-group d-flex">
							                <input type="text" class="form-control" id="inputId" style="background-color: #dddddd" value="${login.userId }" name="userId" readonly>
							            </div>
							            
							            <div class="d-flex mt-2">
							            	<label class="me-3" id="label1"></label>
							            </div>  
							        </div>
							
							        <div class="mb-3">
							            <label for="inputPassword" class="form-label" style="font-weight:bolder;">새로운 비밀번호</label>
							            <div class="input-group mb-3">
							                <input type="password" class="form-control" id="inputPassword" placeholder="새로운 비밀번호를 입력하세요" name="userPw">
							            </div>
							            <label for="checkPassword" class="form-label" style="font-weight:bolder;">비밀번호 확인</label>
							            <div class="input-group">
							                <input type="password" class="form-control" id="checkPassword" placeholder="비밀번호를 입력하세요">
							            </div>
							            
							            <div class="d-flex mt-2">
							            	<label class="me-3" id="label2"></label>
							            </div>  
							        </div>
							        
							        <div class="mb-3">
							            <label for="inputName" class="form-label" style="font-weight:bolder;">닉네임</label>
							            <div class="input-group">
							                <input type="text" class="form-control" id="inputName" value="${login.userName }" name="userName">
							            </div>
							            
							            <div class="d-flex mt-2">
							            	<label class="me-3" id="label3"></label>
							            </div>  
							        </div>
							
							        <div class="mb-3">
							            <label for="inputEmail" class="form-label" style="font-weight:bolder;">이메일</label>
							            <div class="input-group mb-2">
							                <input type="email" class="form-control me-2" id="inputEmail" value="${login.userEmail }" name="userEmail" disabled>
							            </div>
							        </div>
							        
							        <div class="mb-3">
							            <label for="inputPhone" class="form-label" style="font-weight:bolder;">휴대폰</label>
							            <div class="input-group">
							                <input type="text" class="form-control" id="inputPhone" value="${login.userPhone }" name="userPhone">
							            </div>
							        </div>												
								</div>
							</div>
							
							<!-- 개인회원 수정버튼 -->
					        <c:if test="${sessionScope.login.userAccount != 'C'}">
								<div class="mt-3">
						            <button class="btn btn-primary btn-lg w-100" id="signUpBtn" type="button" >수정하기</button>
						            <p id="signUpWarning" style="font-size:20px;color:red;font-weight:bolder;text-align:center;margin-top:10px;">중복여부를 확인해주세요!</p>
						        </div>		
							</c:if>	
						</div>
						

						<!-- 기업정보 수정 -->
						<c:if test="${sessionScope.login.userAccount == 'C'}">
							<div class="col-xl-4 col-lg-5">
								<div class="card mb-4">
									<div class="card-header">기업정보 수정</div>
									<div class="card-body" style="padding-bottom:42px;">
										<div class="mb-4">
								            <label for="inputCorName" class="form-label" style="font-weight:bolder;">기업명</label>
								            <div class="input-group">
								                <input type="text" class="form-control" id="inputCorName" placeholder="기업명 입력(사업자등록증명원 기업명)">
								            </div>
							        	</div>
							
								        <div class="mb-4">
								            <label for="inputCEO" class="form-label" style="font-weight:bolder;">대표자</label>
								            <div class="input-group">
								                <input type="text" class="form-control" id="inputCEO" placeholder="예시) 이재완 외 1명 (사업자등록증명원 대표자명)">
								            </div>
								        </div>
							
								        <div class="mb-4">
								            <label for="inputAddress" class="form-label" style="font-weight:bolder;">회사 주소</label>
								            <div class="input-group mb-1">
								            	<input type="text" class="form-control d-block" id="inputAddress" placeholder="클릭하시면 주소검색 창이 뜹니다." onclick="DaumPostCode()">
								            </div>
								            <div class="input-group" id="addressBox">
								            	<input type="text" class="form-control d-block me-2" style="width:18%;" id="zipCode" placeholder="우편번호" disabled>
								                <input type="text" class="form-control me-2" style="width:48%;" id="detailAddress" placeholder="상세주소">
								                <input type="text" class="form-control" style="width:30%;" id="extraAddress" placeholder="참고항목" disabled>
								            </div>
								        </div>
							
								        <div class="mb-4">
								            <label for="inputDate" class="form-label" style="font-weight:bolder;">개업일</label>
								            <div class="input-group">
								                <input type="date" class="form-control" id="inputDate">
								            </div>
								        </div>
							        
								        <div class="mb-4">
								            <label for="inputCarbon" class="form-label" style="font-weight:bolder;">총 탄소배출량</label>
								            <div class="input-group">
								                <input type="input" class="form-control" id="inputCarbon" placeholder="귀하의 회사 총 탄소배출량을 기입해주십시오(단위 ton)">
								            </div>
								        </div>							
									</div>
								</div>
							</div>
						</c:if>
									
						<!-- 기업회원 수정버튼 -->
						<c:if test="${sessionScope.login.userAccount == 'C'}">
							<div class="mt-2" style="width:66.5%;">
					            <button class="btn btn-primary btn-lg w-100" id="signUpBtn" type="submit" >수정하기</button>
					            <p id="signUpWarning" style="font-size:20px;color:red;font-weight:bolder;text-align:center;margin-top:10px;">중복여부를 확인해주세요!</p>
					        </div>		
						</c:if>						
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
		// 프로필 이미지 클릭 시 숨겨놓은 input file 이 클릭됌
		$(".profile-img").on("click", () => {
			$("#inputImage").click();
		});
		
		function readImage(input){
			if(input.files && input.files[0]){
				const reader = new FileReader();
				
				// 파일 읽기가 완료되면 실행되는 콜백
				reader.onload = function (e) {
					// 미리보기 이미지를 변경
					$("#profileImagePreview").attr('src', e.target.result);
				};
				
				// 파일 읽기 시작
				reader.readAsDataURL(input.files[0]);
			}
		}
		
		function uploadFile(p_this){
			
		}
		
		
		
	</script>
</body>
</html>
