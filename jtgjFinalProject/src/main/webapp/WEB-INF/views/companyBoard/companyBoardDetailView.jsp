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
			height: 50px;
		}
		
		.dFjcE{
			display: flex;
			justify-content: flex-end;
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
		        <div>
					<img id="previewImage" src="${pageContext.request.contextPath}/displayProfImg?atchtype=companyBoard&imgName=${companyBoard.cpBoardReperImg}" 
						alt="대표 이미지">
				</div>
		    </div>    
			<div class="container margin-top">
			    <div class="single-blog-wrapper">
		            <div class="row">
		                <div class="dFjcB marB">
		                    <div class="dF">
								<c:if test="${companyBoard.userProfImg == null}">
									<img src="img/default_img.png" class="profileImg" alt="기본 프로필 이미지">
								</c:if>
								<c:if test="${companyBoard.userProfImg != null}">
									<img src="${pageContext.request.contextPath}/displayProfImg?atchtype=prof_img&imgName=${companyBoard.userProfImg}" 
									     class="profileImg" alt="프로필 이미지">
								</c:if>
								<div class="dFDjcA">
									<h6>${companyBoard.userName}</h6> <!-- 기업명 -->
									<p>${companyBoard.cpBoardIntro}</p> <!-- 소개글 -->
								</div>
							</div>
		                    <div class="dFjcC">
		                        <button type="button" class="btn btn-success marR15">팔로우하기</button>
		                        <button type="button" class="btn btn-primary">공유하기</button>
		                    </div>
		                </div>
		            </div>
		            <div class="blog-post">
		                <div class="dFjcB">
		
		                    <!-- 프로필 부분 -->
		                    <div class="proInput">
		                        <label class="marB20" for="inputTitle">프로필</label>
		                        <!-- 기업 소개글 입력 --><!-- 이곳은 기업소개 cpBoardContent textarea 말고 이미 입려되서 보이게  -->
		                        <p>${companyBoard.cpBoardContent}</p>
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
		                            <label>경력</label>
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
			                    <div class="col-md-4 col-sm-4 col-xs-12 mix branding">
			                        <div class="img home-portfolio-image">
			                            <img src="img/home-portfolio/img_1.jpg" alt="Portfolio Item">
			                            <div class="overlay-thumb">
			                                <a href="javascript:void(0)" class="like-product">
			                                    <i class="ion-ios-heart-outline"></i>
			                                    <span class="like-product">Liked</span>
			                                    <span class="output">250</span>
			                                </a>
			                                <div class="details">
			                                    <span class="title">STYLE FASHION</span>
			                                    <span class="info">NEW BAG & STYLE FASHION</span>
			                                </div>
			                                <span class="btnBefore"></span>
			                                <span class="btnAfter"></span>
			                                <a class="main-portfolio-link" href="single-project.html"></a>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="col-md-4 col-sm-4 col-xs-12 mix web">
			                        <div class="img home-portfolio-image">
			                            <img src="img/home-portfolio/img_2.jpg" alt="Portfolio Item">
			                            <div class="overlay-thumb">
			                                <a href="javascript:void(0)" class="like-product">
			                                    <i class="ion-ios-heart-outline"></i>
			                                    <span class="like-product">Liked</span>
			                                    <span class="output">60</span>
			                                </a>
			                                <div class="details">
			                                    <span class="title">WATCH-J</span>
			                                    <span class="info">NEW TREND FASHION</span>
			                                </div>
			                                <span class="btnBefore"></span>
			                                <span class="btnAfter"></span>
			                                <a class="main-portfolio-link" href="single-project.html"></a>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="col-md-4 col-sm-4 col-xs-12 mix graphic">
			                        <div class="img home-portfolio-image">
			                            <img src="img/home-portfolio/img_3.jpg" alt="Portfolio Item">
			                            <div class="overlay-thumb">
			                                <a href="javascript:void(0)" class="like-product">
			                                    <i class="ion-ios-heart-outline"></i>
			                                    <span class="like-product">Liked</span>
			                                    <span class="output">1060</span>
			                                </a>
			                                <div class="details">
			                                    <span class="title">STYLE FASHION</span>
			                                    <span class="info">NEW BAG & STYLE FASHION</span>
			                                </div>
			                                <span class="btnBefore"></span>
			                                <span class="btnAfter"></span>
			                                <a class="main-portfolio-link" href="single-project.html"></a>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="col-md-4 col-sm-4 col-xs-12 mix branding">
			                        <div class="img home-portfolio-image">
			                            <img src="img/home-portfolio/img_4.jpg" alt="Portfolio Item">
			                            <div class="overlay-thumb">
			                                <a href="javascript:void(0)" class="like-product">
			                                    <i class="ion-ios-heart-outline"></i>
			                                    <span class="like-product">Liked</span>
			                                    <span class="output">900</span>
			                                </a>
			                                <div class="details">
			                                    <span class="title">STYLE FASHION</span>
			                                    <span class="info">NEW BAG & STYLE FASHION</span>
			                                </div>
			                                <span class="btnBefore"></span>
			                                <span class="btnAfter"></span>
			                                <a class="main-portfolio-link" href="single-project.html"></a>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="col-md-4 col-sm-4 col-xs-12 mix branding">
			                        <div class="img home-portfolio-image">
			                            <img src="img/home-portfolio/img_5.jpg" alt="Portfolio Item">
			                            <div class="overlay-thumb">
			                                <a href="javascript:void(0)" class="like-product">
			                                    <i class="ion-ios-heart-outline"></i>
			                                    <span class="like-product">Liked</span>
			                                    <span class="output">979</span>
			                                </a>
			                                <div class="details">
			                                    <span class="title">STYLE FASHION</span>
			                                    <span class="info">NEW BAG & STYLE FASHION</span>
			                                </div>
			                                <span class="btnBefore"></span>
			                                <span class="btnAfter"></span>
			                                <a class="main-portfolio-link" href="single-project.html"></a>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="col-md-4 col-sm-4 col-xs-12 mix branding">
			                        <div class="img home-portfolio-image">
			                            <img src="img/home-portfolio/img_6.jpg" alt="Portfolio Item">
			                            <div class="overlay-thumb">
			                                <a href="javascript:void(0)" class="like-product">
			                                    <i class="ion-ios-heart-outline"></i>
			                                    <span class="like-product">Liked</span>
			                                    <span class="output">1024</span>
			                                </a>
			                                <div class="details">
			                                    <span class="title">STYLE FASHION</span>
			                                    <span class="info">NEW BAG & STYLE FASHION</span>
			                                </div>
			                                <span class="btnBefore"></span>
			                                <span class="btnAfter"></span>
			                                <a class="main-portfolio-link" href="single-project.html"></a>
			                            </div>
			                        </div>
			                    </div>
			                    
			                    
			                </div>
			            </div>
			        </div>
			        
			        <div class="youtubeRink">
			        	<label> 유튜브 </label>
			        </div>
			        <c:if test="${sessionScope.login.userId == companyBoard.userId }">
				        <a href="${pageContext.request.contextPath}/companyBoardEditView?cpBoardNo=${companyBoard.cpBoardNo}">
				            <button class="btn btn-success" type="button">홍보 수정</button>
				        </a>
			        </c:if>
			        
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
	
</body>
</html>