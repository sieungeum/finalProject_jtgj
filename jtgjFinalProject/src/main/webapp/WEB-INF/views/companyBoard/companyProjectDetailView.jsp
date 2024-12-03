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
	
	<!-- 카카오 공유기능 -->
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.4/kakao.min.js" integrity="sha384-DKYJZ8NLiK8MN4/C5P2dtSmLQ4KwPaoqAfyA/DfmEc1VDxu4yyC7wy6K1Hs90nka" crossorigin="anonymous"></script>
	
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
			align-items: center;
		}
		
		.companyProfile{
			width: 25%;
			min-height: 150px;
			border-radius:20px;
			border: 2px solid #F1F3F5;
			display: flex;
			justify-content: space-between;
			position: fixed;
			top: 100px;
			background-color: #F1F3F5;
			
		}
		
		.hB {
			width:0%;
			height: 270px;
			border-left: 1px solid #868E96;
			margin-left: 22%;
		}
		
		.width45{
			width: 190px;
			display: flex;
			flex-direction: column;
			margin-bottom: 10px;
		}
		
		.marginL_L{
			margin-left: 20px;
		}
		
		.bigImgBox {
			height: 400px;
			width: 65%;
			border-radius: 15px;
			overflow: hidden;
			
			display: flex;
			align-items: center;
			justify-content: center;
			
			background-color: #e9ecef;
		}
		
		.bigImg {
			height: 400px;
			width: auto;
			
			display: flex;
			align-items: center;
			justify-content: center;
		}
		
		.marR15{
			margin-right: 15px;
		}
		
		.marTop10{
			margin-top: 10px;
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
		
	    	<div class="container">
		        <!-- 대표이미지 -->
		       
                <div class="form-group highlight bigImgBox">
                    <img id="thumbnailPreview" src="${pageContext.request.contextPath}/displayProfImg?atchtype=companyProject&imgName=${companyProject.ptThumbnail}" alt="대표 이미지 미리보기" 
                         class="thumbnail-preview bigImg" />
                </div>
		    </div>    
			<div class="container margin-top">
			    <div class="single-blog-wrapper">
		            <div class="row">
		                <div class="dFjcE_E marB marTop10">
		                    <div class="dFjcE_E companyProfile">
		                    	<div class="marR15 marTop10">
								    <!-- 프로필 이미지 표시 -->
								    <c:if test="${companyBoard.userProfImg == null || companyBoard.userProfImg == ''}">
								        <img src="${pageContext.request.contextPath}/img/default_img.png" class="profileImg" alt="기본 프로필 이미지">
								    </c:if>
								    <c:if test="${companyBoard.userProfImg != null && companyBoard.userProfImg != ''}">
								        <img src="${pageContext.request.contextPath}/displayProfImg?atchtype=prof_img&imgName=${companyBoard.userProfImg}" 
								             class="profileImg" alt="프로필 이미지">
								    </c:if>
		                    	</div>
							    <div class="dFDjcA marR15">
							        <!-- 기업명 -->
							        <h4>기업명 : ${companyBoard.userName}</h4>
							        <!-- users 테이블에서 가져온 userName -->
							        <!-- 기타 추가 정보 필요 시 아래에 추가 가능 -->
							    </div>
							    <div class="dFjcC marR15 marB20">
							        <c:if test="${companyProject.cpBoardNo != null}">
									    <button 
									        type="button" 
									        class="btn btn-success marR15" 
									        onclick="location.href='${pageContext.request.contextPath}/companyBoardDetailView?cpBoardNo=${companyProject.cpBoardNo}'">
									        기업으로
									    </button>
									</c:if>
							        <button type="button" class="btn btn-primary" onclick="shareOnKakao()">카카오 공유하기</button>
							    </div>
							</div>
		                </div>
		            </div>
		            <div class="blog-post">
		                <div class="dFjc_C">
		                
		                	<div class="width65">
			                	<h1>프로젝트명</h1>
			                	<span>${companyProject.ptTitle }</span>
		                	</div>
		
		                    <div class="proInput">
		                        <!-- 간단한 프로젝트 소개 -->
		                        <h2>프로젝트 소개</h2>
		                        <span>${companyProject.ptContent }</span>
		                    </div>
		                    
		                    <div class="dFjc_C width65">
		                    	<!-- 여기가 프로젝트 주소 -->
		                    	<label>프로젝트 주소</label>
		                    	<span>${companyProject.ptLocation }</span>
		                    </div>
		
		                    <!-- 여기가 카드부분 -->
		                    <div class="width65">
		                    	<h3>소개</h3>
		                    	
		                    	<div class="projectDeatailCard">
		                    		<div class="marginL_L">
		                    			<div class="width45">
		                    				<label for="ptDesign">설계 기간</label>
		                    				<span>${companyProject.ptDesign }</span>
		                    			</div>
		                    			<div class="width45">
		                    				<label for="ptConstruction">시공 기간</label>
		                    				<span>${companyProject.ptConstruction }</span>
		                    			</div>
		                    			<div class="width45">
		                    				<label for="ptFloorNum">층수</label>
		                    				<span>${companyProject.ptFloorNum }</span>
		                    			</div>
		                    			<div class="width45">
		                    				<label for="ptHouseholdNum">가구수</label>
		                    				<span>${companyProject.ptHouseholdNum }</span>
		                    			</div>
		                    		</div>
		                    		<div class="hB"></div>
		                    		<div class="marginL_L">
		                    			<div class="width45">
		                    				<label for="ptLandArea">대지 면적</label>
		                    				<div  class="dF">
		                    					<span>${companyProject.ptLandArea }</span>
			                    				<span>(㎡)</span>
		                    				</div>
		                    			</div>
		                    			<div class="width45">
		                    				<label for="ptBuildingArea">건축 면적</label>
		                    				<div class="dF">
		                    					<span>${companyProject.ptBuildingArea }</span>
	                    						<span>(㎡)</span>
		                    				</div>
		                    			</div>
		                    			<div class="width45">
		                    				<label for="ptTotalFloorArea">연면적</label>
		                    				<div class="dF">
		                    					<span>${companyProject.ptTotalFloorArea }</span>
			                    				<span>(㎡)</span>
		                    				</div>
		                    			</div>
		                    			<div class="width45">
		                    				<label for="ptCompletionYear">준공년도</label>
		                    				<span>${companyProject.ptCompletionYear }</span>
		                    			</div>
		                    		</div>
		                    	</div>
		                    	
		                    </div>
		                    
		                    <!-- 보조 사진들 -->
		                    
		                </div>
		            </div>
			        
			        <c:if test="${sessionScope.login.userId == companyProject.userId }">
				        <a href="${pageContext.request.contextPath}/companyProjectEditView?ptNo=${companyProject.ptNo}">
					        <button class="btn btn-success" type="button">프로젝트 수정</button>
					    </a>
					    <form action="${pageContext.request.contextPath}/companyProjectDelete" method="post" style="margin-top: 20px;">
						    <input type="hidden" name="ptNo" value="${companyProject.ptNo}" />
						    <button type="submit" class="btn btn-danger">프로젝트 삭제</button>
						</form>
			        </c:if>
			        
			    </div>
			</div>
		
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
        document.addEventListener("DOMContentLoaded", function () {
            // Kakao 초기화
            const personalKey = '412d4c0eb4efb269990b831dedba9e52'; // Kakao JavaScript 앱 키
            Kakao.init(personalKey);

            // 카카오톡 공유 함수
            window.shareOnKakao = function () {
                const currentUrl = window.location.href; // 현재 페이지 URL
                Kakao.Share.sendDefault({
                    objectType: 'feed',
                    content: {
                        title: '공유하기',
                        description: '이 페이지를 확인해보세요!',
                        imageUrl: currentUrl + '/resources/images/kakao_share.png', // 카카오톡 공유 이미지 경로
                        link: {
                            mobileWebUrl: currentUrl,
                            webUrl: currentUrl
                        }
                    },
                    buttons: [
                        {
                            title: '자세히 보기',
                            link: {
                                mobileWebUrl: currentUrl,
                                webUrl: currentUrl
                            }
                        }
                    ]
                }).then(() => console.log('카카오 공유 성공!'))
                  .catch(error => console.error('카카오 공유 실패:', error));
            };
        });
    </script>
	
</body>
</html>