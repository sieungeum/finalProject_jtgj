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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.4/kakao.min.js" integrity="sha384-DKYJZ8NLiK8MN4/C5P2dtSmLQ4KwPaoqAfyA/DfmEc1VDxu4yyC7wy6K1Hs90nka" crossorigin="anonymous"></script>
	
	<style type="text/css">
		
		.dFjcB{
			display: flex;
			justify-content: space-between;
		}
		
		.profileImgBox{
			height: 120px;
			width: 120px;
			border-radius: 60px;
			overflow: hidden;
		}
		
		.profileImg{
			width: auto;
			height: 150px;
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
			min-height: 470px;
		}
		
		.proText{
			min-height: 430px;
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
			min-height: 50px;
		}
		
		.dFjcE{
			display: flex;
			justify-content: flex-end;
		}
		
		.youtubeRink {
			display: flex;
			flex-direction: column;
		}
		
		.projectArea {
			min-height: 400px;
		}
		
		.aE {
			align-items: flex-end;
		}
		
		.mL20 {
			margin-left: 20px;
		}
		
		.boer {
			font-weight: 700;
		}
		
		.marR30 {
			margin-right: 30px;
		}
		
		.fontSize20{
			font-size: 20px;
		}
		
		.fontSize15{
			font-size: 17px;
		}
		
		.w10h10{
			margin-left: 20px;
			height: 34px;
			width: 34px;
		}
		
		.bigImgBox {
			height: 400px;
			width: 1170px;
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
	    	<div class="container"><!-- 이곳에 대표 이미 업로드 대신 대표이미지를 보여줘 -->
		        <div class="bigImgBox">
					<img class="bigImg" id="previewImage" src="${pageContext.request.contextPath}/displayProfImg?atchtype=companyBoard&imgName=${companyBoard.cpBoardReperImg}" 
						alt="대표 이미지">
				</div>
		    </div>    
			<div class="container margin-top">
			    <div class="single-blog-wrapper">
		            <div class="row">
		                <div class="dFjcB marB">
		                    <div class="dF">
								<c:if test="${companyBoard.userProfImg == null}">
									<div class="profileImgBox marR30">
										<img src="img/default_img.png" class="profileImg" alt="기본 프로필 이미지">
									</div>
								</c:if>
								<c:if test="${companyBoard.userProfImg != null}">
									<div class="profileImgBox marR30">
										<img src="${pageContext.request.contextPath}/displayProfImg?atchtype=prof_img&imgName=${companyBoard.userProfImg}" 
										     class="profileImg" alt="프로필 이미지">
									</div>
								</c:if>
								<div class="dFDjcA">
									<p class="boer fontSize15">${companyBoard.userName}</p> <!-- 기업명 -->
									<p class="fontSize15">${companyBoard.cpBoardIntro}</p> <!-- 소개글 -->
								</div>
							</div>
							<%--
		                    <div class="dFjcC">
		                        <button type="button" class="btn btn-primary" onclick="shareOnKakao()">카카오 공유하기</button>
		                    </div>
							 --%>
		                </div>
		            </div>
		            <div class="blog-post">
		                <div class="dFjcB">
		
		                    <!-- 프로필 부분 -->
		                    <div class="proInput">
		                        <label class="marB20 fontSize15" for="inputTitle">프로필</label>
		                        <!-- 기업 소개글 입력 --><!-- 이곳은 기업소개 cpBoardContent textarea 말고 이미 입려되서 보이게  -->
		                        <p class="fontSize15">${companyBoard.cpBoardContent}</p>
		                    </div>
		
		                    <!-- 여기가 카드부분 -->
		                    <div class="companyDetailCard">
		                        <!-- 대표 정보 -->
		                        <div class="DetailCardBox">
		                            <label>대표</label>
		                            <h6>${companyBoard.cpCeoName}</h6><!-- 이곳도 cpCeoName 이글을 등록한 사람이랑 id를 비교해서 -->
		                        </div>
		                        <hr class="width100">
		
		                        <!-- 경력 정보 -->
		                        <div class="NextDetailCardBox">
		                            <label>창업일</label>
		                            <h6>${companyBoard.cpOpenDate}</h6><!-- 이곳도 cpOpenDate 이글을 등록한 사람이랑 id를 비교해서 -->
		                        </div>
		                        <hr class="width100">
		
		                        <!-- 업무 영역 정보 -->
		                        <div class="NextDetailCardBox">
		                            <label>업무영역</label>
		                            <h6>${companyBoard.cpBoardArea}</h6> <!-- 이곳은 입력받았던 cpBoardArea -->
		                        </div>
		                        <hr class="width100">
		
		                        <!-- 연락처 정보 -->
		                        <div class="NextDetailCardBox">
		                            <label>연락처</label>
		                            <h6>${companyBoard.userPhone}</h6><!-- 이곳도 userPhone 이글을 등록한 사람이랑 id를 비교해서 -->
		                        </div>
		                        <hr class="width100">
		
		                        <!-- 이메일 정보 -->
		                        <div class="NextDetailCardBox">
		                            <label>이메일</label>
		                            <h6>${companyBoard.userEmail}</h6><!-- 이곳도 userEmail 이글을 등록한 사람이랑 id를 비교해서 -->
		                        </div>
		                        <hr class="width100">
		
		                        <!-- 주소 정보 -->
		                        <div class="lastDetailCardBox">
		                            <label>주소</label>
		                            <h6>${companyBoard.cpAddress}</h6><!-- 이곳도 cpAddress 이글을 등록한 사람이랑 id를 비교해서 -->
		                            <div class="dFjcC">
				                        <button type="button" class="btn btn-warning" onclick="shareOnKakao()">카카오 공유하기</button>
				                        <img alt="" src="img/katalk.png" class="w10h10">
				                    </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
			        
			        <!-- 여기부터 프로젝트 -->
			        <div class="projectArea">
			        	<label>프로젝트</label>
			        	<br>
			        	<div class="js-masonry">
			                <div class="row" id="work-grid">
			                    <!-- Begin of Thumbs Portfolio -->
			                    <c:forEach items="${companyProjects}" var="project">
					                <div class="col-md-4 col-sm-4 col-xs-12 mix branding">
					                    <div class="img home-portfolio-image">
					                        <!-- 프로젝트 썸네일 -->
					                        <c:if test="${project.ptThumbnail != null}">
					                            <img src="${pageContext.request.contextPath}/displayProfImg?atchtype=companyProject&imgName=${project.ptThumbnail}" alt="${project.ptTitle}">
					                        </c:if>
					                        <c:if test="${project.ptThumbnail == null}">
					                            <img src="${pageContext.request.contextPath}/img/default-thumbnail.jpg" alt="Default Image">
					                        </c:if>
					                        <div class="overlay-thumb">
					                            <div class="details">
					                                <!-- 프로젝트명 -->
					                                <span class="title">${project.ptTitle}</span>
					                                <!-- 완공년도 -->
					                                <span class="info">${project.ptCompletionYear}</span>
					                            </div>
					                            <span class="btnBefore"></span>
					                            <span class="btnAfter"></span>
					                            <a class="main-portfolio-link" href="${pageContext.request.contextPath}/companyProjectDetailView?ptNo=${project.ptNo}"></a>
					                        </div>
					                    </div>
					                </div>
            					</c:forEach>
			                    
			                </div>
			            </div>
			        </div>
			        
			        <div class="dFjcE">
				        <c:if test="${sessionScope.login.userId == companyBoard.userId }">
				        	<a href="${pageContext.request.contextPath}/companyProjectWriteView">
				        		<button class="btn btn-success" type="button">프로젝트 추가</button>
				        	</a>
				        </c:if>
			        </div>
			        
			        <div class="youtubeVideo">
					    <label class="fontSize15">유튜브 영상</label>
					    <c:if test="${not empty companyBoard.cpBoardYoutubeLink}">
					        <div>${companyBoard.cpBoardYoutubeLink}</div>
					    </c:if>
					</div>
					<div class="dFjcE">
				        <c:if test="${sessionScope.login.userId == companyBoard.userId }">
				        	<div class="dFjcE aE">
						        <a href="${pageContext.request.contextPath}/companyBoardEditView?cpBoardNo=${companyBoard.cpBoardNo}">
						            <button class="btn btn-success" type="button">홍보 수정</button>
						        </a>
				        	</div>
				        	<div>
						        <form class="mL20" action="${pageContext.request.contextPath}/companyBoardDelete" method="post" style="margin-top: 20px;">
								    <input type="hidden" name="cpBoardNo" value="${companyBoard.cpBoardNo}" />
								    <button type="submit" class="btn btn-danger">게시글 삭제</button>
								</form>
				        	</div>
				        </c:if>
					</div>
			        
			    </div>
			</div>
	</section>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp" %>
	
	<script type="text/javascript">
		function previewImage(event) {
	        const reader = new FileReader();
	        reader.onload = function () {
	            document.getElementById('preview').src = reader.result;
	        };
	        if (event.target.files && event.target.files[0]) {
	            reader.readAsDataURL(event.target.files[0]);
	        } else {
	            document.getElementById('preview').src = 'img/blog-header.jpg';
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