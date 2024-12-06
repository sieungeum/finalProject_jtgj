<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="ko">

<head>
	<meta charset="utf-8">
	<title>OAK - HTML Theme</title>
	<meta name="description" content="">
	<meta name="msapplication-tap-highlight" content="yes" />
	<meta name="viewport"
		content="width=device-width, user-scalable=no, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0" />
	
	<%@ include file="/WEB-INF/inc/header.jsp" %>
	
	<script src="${pageContext.request.contextPath}/nse/js/HuskyEZCreator.js" type="text/javascript"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<style type="text/css">
		
		.dFjcB{
			display: flex;
			justify-content: space-between;
		}
		
		.profileImgBox{
			height: 200px;
			width: 200px;
			border-radius: 100px;
			overflow: hidden;
		}
		
		.profileImg{
			width: auto;
			height: 225px;
		}
		
		.marB{
			margin-bottom: 40px; 
		}
		
		.dF{
		 	display: flex;
		 	width:85%;
		}
		
		.marR{
			margin-right: 30px;
		}
		
		.dFDjcA{
			display: flex;
			flex-direction: column;
			justify-content: space-around;
		}
		
		.dFjcC{
			display: flex;
			justify-content: center;
			height: 35px;
			align-items: center;
		}
		
		.marR15{
			margin-right: 15px;
		}
		
		.companyDetailCard{
			width: 30%;
			min-height: 300px;
			border-radius:20px;
			border: 2px solid black; 
			display: flex;
			flex-direction: column;
			
		}
		
		.width100{
			width: 100%;
		}
		
		.marB20{
			margin-bottom: 20px;
		}
		
		.proInput{
			width: 65%;
			min-height: 200px;
			margin-top: 20px;
		}
		
		.proText{
			height: 150px;
		}
		
		.DetailCardBox{
			margin-top: 15px;
			margin-left: 20px;
			margin-right: 20px;
			margin-bottom: 10px;
			display: flex;
			flex-direction: column;
			justify-content:space-between;
			align-items: flex-start;
			height: 50px;
		}
		
		.NextDetailCardBox{
			margin-left: 20px;
			margin-right: 20px;
			margin-bottom: 10px;
			display: flex;
			flex-direction: column;
			justify-content:space-between;
			align-items: flex-start;
			height: 50px;
		}
		
		.lastDetailCardBox{
			margin-left: 20px;
			margin-right: 20px;
			margin-bottom: 20px;
			display: flex;
			flex-direction: column;
			justify-content:space-between;
			align-items: flex-start;
			height: 50px;
		}
		
		.dFjcE{
			display: flex;
			justify-content: flex-end;
		}
		
		.dFjcE_E{
			display: flex;
			justify-content: flex-end;
			flex-direction: column;
			align-items: flex-end; 
		}
		
		.dFjc_C{
			display: flex;
			flex-direction: column;
		}
		
		.projectDeatailCard{
			width: 100%;
			min-height: 300px;
			border-radius:20px;
			background-color: #F1F3F5; 
			display: flex;
			justify-content:space-between;
			align-items: center;
			padding:20px;
		}
		
		.companyProfile{
			
			
		}
		
		.hB {
			width:0%;
			height: 270px;
			border-left: 5px solid #868E96;
		}
		
		.width45{
			width: 45%;
		}
		
		.marginL_L{
			margin-left: 10px;
			width:48%;
		}
		
		.marR15{
			margin-right: 15px;
		}
		
		.marR30{
			margin-right: 30px;
		}
		
		.marTop10{
			margin-top: 10px;
		}
		
		.imgboxD{
			display: flex;
			flex-direction: column;
			
		}
		
		.width65{
			width: 65%; 
		}
		
		.bigImgBox {
			height: 400px;
			width: 100%;
			border-radius: 15px;
			overflow: hidden;
			display: flex;
			align-items: center;
			justify-content: center;
			background-color: rgb(245, 245, 245);
		}
		
		.bigImg {
			height: 400px;
			width: auto;
			
			display: flex;
			align-items: center;
			justify-content: center;
		}
		
		button{
			border-radius:5px !important;
		}
		
		.input-label{
			width:15%;
			display:flex;
			align-items:center;
			font-size:15px;
		}
		
		.input-value{
			width:80% !important;
			height:50px !important;
			font-size:16px;
			border-radius: 10px;
		}
		
		.input-value-sec{
			width:95% !important;
			height:50px !important;
			font-size:16px;
			border-radius: 10px;
			border: 0px;
			padding-left:10px;
		}
		
		#ptCompletionYear{
			width:81% !important;
			height:50px !important;
			font-size:16px;
			border-radius: 10px;
			border: 0px;
			padding-left:10px;
		}
		
		.width100{
			width:100%;
			display:flex;
			margin-bottom:15px;
		}
		
		.center{
			display:flex;
			justify-content:center;
			align-items:center;
		}
		
	</style>
	
</head>
<body>

	<!-- Preloader -->
	<div class="cover"></div>

	<div class="header">
		<div class="container">

			<!-- nav -->
			<%@ include file="/WEB-INF/inc/nav.jsp" %>
		</div>
	</div>
	
	<section class="page-section" id="contact">
		<form id="companyBoardWriteForm" action="${pageContext.request.contextPath }/companyProjectWriteDo" method="POST" enctype="multipart/form-data">
	    	<input type="hidden" name="cpBoardNo" value="${param.cpBoardNo}"> <!-- cpBoardNo 추가 -->
	    	<div class="container ">
				<div class="dFjcE_E center companyProfile" style="margin-bottom:30px;padding:25px;border-radius:15px;">
                    <!-- 프로필 이미지 표시 -->
                    <div class="profileImgBox">
	                    <c:if test="${sessionScope.login.userProfImg == 'N' }">
							<img src="img/default_img.png" class="profileImg" style="max-width: 300px; max-height: 300px; margin-top: 10px;">
						</c:if>
						<c:if test="${sessionScope.login.userProfImg != 'N' }">
							<img src="<c:url value="/displayProfImg?atchtype=prof_img&imgName=${sessionScope.login.userProfImg }"/>" class="profileImg">
						</c:if>
                    </div>
                    <div class="dFDjcA" style="margin-top:20px;">
                       	<!-- 기업명 -->
                        <h4 style="font-size:25px;font-weight:bolder;">${sessionScope.login.userName}님의 PROJECT</h4>
                    </div>
               </div>	    		
	    		
		        <!-- 이미지 업로드 -->
		       <div class="form-group highlight imgboxD">
				    <label for="thumbnailFile" style="font-size:20px;margin-bottom:20px;">대표 이미지</label>
				    <!-- 클릭 가능한 이미지 -->
				    <div class="bigImgBox">
					    <img id="thumbnailPreview" src="${pageContext.request.contextPath}/img/blog-header.jpg" alt="대표 이미지 미리보기" 
					         class="thumbnail-preview" style=" width: 85%; height: auto; cursor: pointer;" 
					         onclick="document.getElementById('thumbnailFile').click();" />
					    <!-- 숨겨진 파일 입력 -->
					    <input type="file" name="thumbnailFile" id="thumbnailFile" class="form-control-file"  
					           style="display: none;"  accept="image/*" onchange="previewThumbnail(event)" />
				    </div>
				</div>
		    </div>    
			<div class="container" style="margin-top:30px;">
			    <div class="single-blog-wrapper">
		            <div style="margin-bottom:25px;">
		                <div class="dFjc_C">
		                	<div style="width:100%;display:flex;">
		                		<div style="width:50%;display:flex;flex-direction:column;justify-content:space-between;">
			                		<div style="margin-bottom:15px;">
					                	<h1 style="font-size:20px;font-weight:bolder;">프로젝트명</h1>
					                	<input style="width:90%;" type="text" id="ptTitle" name="ptTitle" class="form-control" placeholder="프로젝트명을 입력하세요" required>
				                	</div>
				                	
				                	<div class="dFjc_C">
									    <!-- 프로젝트 주소 검색 -->
									    <label for="ptLocation" style="font-size:20px;margin-bottom:10px;">프로젝트 주소</label>
									    <div style="display: flex; gap: 10px; width:90%;">
									        <input type="text" id="ptLocation" name="ptLocation" class="form-control" 
									               placeholder="프로젝트 주소를 입력하세요" style="width:80%;" readonly required>
									        <button style="width:20%;" type="button" class="btn btn-primary" onclick="searchAddress()">주소 검색</button>
									    </div>
									</div>
			                	</div>
			                	
			                	<div style="width:50%;">
			                        <!-- 간단한 프로젝트 소개 -->
			                        <h2 style="font-size:20px;font-weight:bolder;">프로젝트 소개</h2>
			                        <textarea id="ptContent" name="ptContent" class="form-control" style="height:75%;" rows="5" placeholder="프로젝트 소개를 입력하세요"></textarea>
			                    </div>	   
		                	</div>	
		                	       
		                	
		                    

		                    <!-- 여기가 카드부분 -->
		                    <div style="width:100%;margin-top:30px;">
		                    	<h3 style="font-size:20px;font-weight:bolder;">소개</h3>
		                    	
		                    	<div class="projectDeatailCard">
		                    		<div class="marginL_L">
		                    			<div class="width100">
		                    				<label for="ptDesign" class="input-label">설계 기간</label>
		                    				<input type="text" class="input-value" id="ptDesign" name="ptDesign" placeholder="설계 기간을 입력하세요">
		                    			</div>
		                    			<div class="width100">
		                    				<label for="ptConstruction" class="input-label">시공 기간</label>
		                    				<input type="text" class="input-value" id="ptConstruction" name="ptConstruction" placeholder="시공 기간을 입력하세요">
		                    			</div>
		                    			<div class="width100">
		                    				<label for="ptFloorNum" class="input-label">층수</label>
                   							<input type="text" class="input-value" id="ptFloorNum" name="ptFloorNum" placeholder="층수를 입력하세요">
		                    			</div>
		                    			<div class="width100">
		                    				<label for="ptHouseholdNum" class="input-label">가구수</label>
                    						<input type="text" class="input-value" id="ptHouseholdNum" name="ptHouseholdNum" placeholder="가구수를 입력하세요">
		                    			</div>
		                    		</div>
		                    		<div class="hB"></div>
		                    		<div class="marginL_L">
		                    			<div class="width100">
		                    				<label for="ptLandArea" class="input-label">대지 면적</label>
		                    				<div  class="dF">
	                    						<input type="number" class="input-value-sec" id="ptLandArea" name="ptLandArea" step="0.01" placeholder="대지 면적을 입력하세요">
			                    				<span class="center">(㎡)</span>
		                    				</div>
		                    			</div>
		                    			<div class="width100">
		                    				<label for="ptBuildingArea" class="input-label">건축 면적</label>
		                    				<div class="dF">
	                    						<input type="number" class="input-value-sec" id="ptBuildingArea" name="ptBuildingArea" step="0.01" placeholder="건축 면적을 입력하세요">
	                    						<span class="center">(㎡)</span>
		                    				</div>
		                    			</div>
		                    			<div class="width100">
		                    				<label for="ptTotalFloorArea" class="input-label">연면적</label>
		                    				<div class="dF">
	                    						<input type="number" class="input-value-sec" id="ptTotalFloorArea" name="ptTotalFloorArea" step="0.01" placeholder="연면적을 입력하세요">
			                    				<span class="center">(㎡)</span>
		                    				</div>
		                    			</div>
		                    			<div class="width100">
		                    				<label for="ptCompletionYear" class="input-label">준공년도</label>
                    						<input type="date" id="ptCompletionYear" name="ptCompletionYear" placeholder="준공년도를 입력하세요">
		                    			</div>
		                    		</div>
		                    	</div>
		                    	
		                    </div>
		                    
		                    <!-- 보조 사진들 -->
		                    
		                </div>
		            </div>
			        
			        <div class="dFjcE" style="width:100%;">
				        <button class="btn btn-success" style="font-size:20px;" type="submit">프로젝트 등록</button>
			        </div>
			        
			    </div>
			</div>
		</form>
	</section>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp" %>
	
	<script type="text/javascript">
		function previewThumbnail(event) {
	        const reader = new FileReader();
	        reader.onload = function () {
	            document.getElementById('thumbnailPreview').src = reader.result;
	        };
	        if (event.target.files && event.target.files[0]) {
	            reader.readAsDataURL(event.target.files[0]);
	        } else {
	            document.getElementById('thumbnailPreview').src = `${pageContext.request.contextPath}/img/blog-header.jpg`;
	        }
	    }
	</script>
	
	<script>
	function searchAddress() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 도로명 주소만 추출
	            var roadAddress = data.roadAddress;
	
	            // 도로명 주소를 input에 삽입
	            document.getElementById('ptLocation').value = roadAddress;
	        }
	    }).open();
	}
	</script>
	
</body>
</html>