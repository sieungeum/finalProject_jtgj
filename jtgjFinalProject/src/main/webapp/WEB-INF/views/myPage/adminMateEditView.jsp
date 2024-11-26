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
					<h1 class="mt-4">
						<a style="text-decoration: none; color: inherit;"
							href="${pageContext.request.contextPath }/myPage">마이페이지</a>
					</h1>


					<div class="row d-flex justify-content-center" >
					
					
					<div class="col-xl-4 col-lg-5">
							<div class="card mb-4" style="padding-bottom:26px;">
								<div class="card-header">자재정보 수정</div>
								<div class="card-body">
								<form action="${pageContext.request.contextPath}/editMater" method="POST">
								<input type="hidden" name="materNo" value="${mater.materNo}" >
							        <div class="mb-3">
							        	<img id="imagePreview" class="profile-img"  src="${mater.materImg}"  alt="자재 이미지가 없습니다." />
							            <label for="materImg">자재 이미지: !${attach.atchOriginalName }</label>
							            <div class="input-group d-flex">
							                <input type="file" id="materImg" name="materImg" accept="image/*" onchange="previewImage(event)" /><br />
							            </div>
							        </div>
							
							        <div class="mb-3">
							           		<label for="materName" style="font-weight:bolder;">자재 이름:</label>
							            <div class="input-group mb-3">
									   	 	<input type="text"  class="form-control" id="materName" name="materName" value="${mater.materName}" required /><br />
							            </div>
							        </div>
							        
							        <div class="mb-3">
							           		<label for="materCategory" style="font-weight:bolder;">카테고리:</label>
							            <div class="input-group mb-3">
										    <input type="text" class="form-control"  id="materCategory" name="materCategory" value="${mater.materCategory}" required /><br />
							            </div>
							        </div>
							        
							        <div class="mb-3">
							           		<label for="materGasKg" style="font-weight:bolder;">탄소 배출량:</label>
							            <div class="input-group mb-3">
										    <input type="number" class="form-control"  id="materGasKg" name="materGasKg" value="${mater.materGasKg}" required /><br />
							            </div>
							        </div>
							        
							        <div class="mb-3">
							           		<label for="materPrice" style="font-weight:bolder;">가격:</label>
							            <div class="input-group mb-3">
										    <input type="number" class="form-control"  id="materPrice" name="materPrice" value="${mater.materPrice}" required /><br />
							            </div>
							        </div>
							        
							        <div class="mb-3">
							           		<label for="materDurability" style="font-weight:bolder;">강도:</label>
							            <div class="input-group mb-3">
										    <input type="text" class="form-control"  id="materDurability" name="materDurability" value="${mater.materDurability}" required /><br />
							            </div>
							        </div>
							        
							        <div class="mb-3">
							           		 <label for="materInfo" style="font-weight:bolder;">정보:</label>
							            <div class="input-group mb-3">
										    <textarea id="materInfo" class="form-control"  name="materInfo" required>${mater.materInfo}</textarea><br />
							            </div>
							        </div>
							        
							        <div class="mb-3">
							           		<label for="materClassify" style="font-weight:bolder;">대체자재여부:</label>
							            <div class="input-group mb-3">
										    <input type="text"  class="form-control" id="materClassify" name="materClassify" value="${mater.materClassify}" required /><br />
							            </div>
							        </div>
							        
									<div class="d-flex justify-content-end mar-buttom ">
								   		<button class="btn btn-primary btn-xl m-right" style="margin-right: 10%;" type="submit">저장</button>
										<a class="btn btn-primary btn-xl a-sor" href="${pageContext.request.contextPath }/adminPage">돌아가기</a>
									</div>
								</form>
							        											
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
    function previewImage(event) {
        const input = event.target;
        const preview = document.getElementById("imagePreview");

        if (input.files && input.files[0]) {
            const reader = new FileReader();
            
            // 이미지 로드 후 미리보기 업데이트
            reader.onload = function (e) {
                preview.src = e.target.result;
            };
            
            reader.readAsDataURL(input.files[0]);
        }
    }
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
