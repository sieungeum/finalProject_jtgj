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
	
	<style type="text/css">
		
		.dFjcB{
			display: flex;
			justify-content: space-between;
		}
		
		.profileImg{
			width: 120px;
			height: 120px;
			border-radius: 60px;
		}
		
		.marB{
			margin-bottom: 40px; 
		}
		
		.dF{
		 	display: flex;
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
		
		.width65{
			width: 65%;
			margin-bottom: 10px;
		}
		
		.projectDeatailCard{
			width: 100%;
			min-height: 300px;
			border-radius:20px;
			background-color: #F1F3F5; 
			display: flex;
			justify-content: space-between;
			align-items: center;
		}
		
		.companyProfile{
			width: 30%;
			min-height: 150px;
			border-radius:20px;
			border: 2px solid #F1F3F5;
			display: flex;
			justify-content: space-between;
			position: fixed;
			top: 100px;
			
		}
		
		.hB {
			width:0%;
			height: 270px;
			border-left: 1px solid #868E96;
		}
		
		.width45{
			width: 45%;
		}
		
		.marginL_L{
			margin-left: 50px;
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
	    	<div class="container">
		        <!-- 이미지 업로드 -->
		       <div class="form-group highlight">
                    <label for="thumbnailFile">대표 이미지 업로드</label>
                    <input type="file" name="thumbnailFile" id="thumbnailFile" 
                           class="form-control-file" onchange="previewThumbnail(event)" />
                </div>
                <div class="form-group highlight">
                    <img id="thumbnailPreview" src="${pageContext.request.contextPath}/img/blog-header.jpg" alt="대표 이미지 미리보기" 
                         class="thumbnail-preview" />
                </div>
		    </div>    
			<div class="container margin-top">
			    <div class="single-blog-wrapper">
		            <div class="row">
		                <div class="dFjcE_E marB">
		                    <div class="dFjcE_E companyProfile">
		                        <!-- 프로필 이미지 표시 -->
		                        <c:if test="${sessionScope.login.userProfImg == 'N' }">
									<img src="img/default_img.png" class="profile-img" style="max-width: 300px; max-height: 300px; margin-top: 10px;">
								</c:if>
								<c:if test="${sessionScope.login.userProfImg != 'N' }">
									<img src="<c:url value="/displayProfImg?atchtype=prof_img&imgName=${sessionScope.login.userProfImg }"/>" class="profile-img" style="max-width: 300px; max-height: 300px; margin-top: 10px;">
								</c:if>
		                        <div class="dFDjcA">
		                            <!-- 기업명 -->
		                            <h6>${user.userName}</h6>
		                        </div>
			                    <div class="dFjcC">
			                        <button type="button" class="btn btn-success marR15">기업으로</button>
			                        <button type="button" class="btn btn-primary">프로젝트 공유</button>
			                    </div>
		                    </div>
		                </div>
		            </div>
		            <div class="blog-post">
		                <div class="dFjc_C">
		                
		                	<div class="width65">
			                	<h1>프로젝트명</h1>
			                	<input type="text" id="ptTitle" name="ptTitle" class="form-control" placeholder="프로젝트명을 입력하세요" required>
		                	</div>
		
		                    <div class="proInput">
		                        <!-- 간단한 프로젝트 소개 -->
		                        <h2>프로젝트 소개</h2>
		                        <textarea id="ptContent" name="ptContent" class="form-control" rows="5" placeholder="프로젝트 소개를 입력하세요"></textarea>
		                    </div>
		                    
		                    <div class="dFjc_C width65">
		                    	<!-- 여기가 프로젝트 주소 -->
		                    	<label>프로젝트 주소 입력란</label>
		                    	<input type="text" id="ptLocation" name="ptLocation" class="form-control" placeholder="프로젝트 주소를 입력하세요">
		                    </div>
		
		                    <!-- 여기가 카드부분 -->
		                    <div class="width65">
		                    	<h3>소개</h3>
		                    	
		                    	<div class="projectDeatailCard">
		                    		<div class="marginL_L">
		                    			<div class="width45">
		                    				<label for="ptDesign">설계 기간</label>
		                    				<input type="text" id="ptDesign" name="ptDesign" class="form-control" placeholder="설계 기간을 입력하세요">
		                    			</div>
		                    			<div class="width45">
		                    				<label for="ptConstruction">시공 기간</label>
		                    				<input type="text" id="ptConstruction" name="ptConstruction" class="form-control" placeholder="시공 기간을 입력하세요">
		                    			</div>
		                    			<div class="width45">
		                    				<label for="ptFloorNum">층수</label>
                   							<input type="text" id="ptFloorNum" name="ptFloorNum" class="form-control" placeholder="층수를 입력하세요">
		                    			</div>
		                    			<div class="width45">
		                    				<label for="ptHouseholdNum">가구수</label>
                    						<input type="text" id="ptHouseholdNum" name="ptHouseholdNum" class="form-control" placeholder="가구수를 입력하세요">
		                    			</div>
		                    		</div>
		                    		<div class="hB"></div>
		                    		<div class="marginL_L">
		                    			<div class="width45">
		                    				<label for="ptLandArea">대지 면적 (㎡)</label>
		                    				<div  class="dF">
	                    						<input type="number" id="ptLandArea" name="ptLandArea" class="form-control" step="0.01" placeholder="대지 면적을 입력하세요">
			                    				<span>(㎡)</span>
		                    				</div>
		                    			</div>
		                    			<div class="width45">
		                    				<label for="ptBuildingArea">건축 면적 (㎡)</label>
		                    				<div class="dF">
	                    						<input type="number" id="ptBuildingArea" name="ptBuildingArea" class="form-control" step="0.01" placeholder="건축 면적을 입력하세요">
	                    						<span>(㎡)</span>
		                    				</div>
		                    			</div>
		                    			<div class="width45">
		                    				<label for="ptTotalFloorArea">연면적 (㎡)</label>
		                    				<div class="dF">
	                    						<input type="number" id="ptTotalFloorArea" name="ptTotalFloorArea" class="form-control" step="0.01" placeholder="연면적을 입력하세요">
			                    				<span>(㎡)</span>
		                    				</div>
		                    			</div>
		                    			<div class="width45">
		                    				<label for="ptCompletionYear">준공년도</label>
                    						<input type="text" id="ptCompletionYear" name="ptCompletionYear" class="form-control" placeholder="준공년도를 입력하세요">
		                    			</div>
		                    		</div>
		                    	</div>
		                    	
		                    </div>
		                    
		                    <!-- 보조 사진들 -->
		                    
		                </div>
		            </div>
			        
			        <div class="dFjcE">
				        <button class="btn btn-success" type="submit">프로젝트 등록</button>
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
	
</body>
</html>