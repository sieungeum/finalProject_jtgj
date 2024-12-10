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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	<style type="text/css">
		.no-pointer{
			pointer-events: none;
			opacity: 0.5; 
		}
		
		.blog-front-image img {
		    width: 870px; /* 이미지 너비 */
		    height: 400px; /* 이미지 높이 */
		    object-fit: cover; /* 이미지를 비율에 맞게 잘라서 박스에 맞춤 */
		    border-radius: 8px; /* 필요 시 모서리를 둥글게 */
		    display: block; /* 이미지를 블록 요소로 표시 */
		    margin: 0 auto; /* 이미지를 카드 중앙 정렬 */
		}
		
		.custom-container{
			width:100%;
			height:600px;
		}
		
		.video-container{
			position: relative;
		    overflow: hidden; /* 넘치는 부분 숨김 */
		    height:100%;
		}
		
		.video-bg {
		    position: absolute;
		    top: 50%; /* 비디오를 수직 중앙 정렬 */
		    left: 50%; /* 비디오를 수평 중앙 정렬 */
		    width: 100%; /* 화면 너비 전체로 설정 */
		    height: auto; /* 비율에 맞게 자동으로 높이 조정 */
		    transform: translate(-50%, -50%); /* 비디오 중심을 기준으로 이동 */
		    object-fit: cover; /* 화면을 꽉 채우도록 설정 */
		    z-index: -1; /* 다른 콘텐츠 뒤로 보냄 */
		}
		
		.video-box{
			width:100%;
			height:100%;
			opacity:60%;
		}
		
		.info-box{
			display:flex;
			flex-direction:column;
			justify-content:center;
			align-items:center;
			top:30%;
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
	
	<section class="page-section" >
	    <div class="custom-container">
		    <div class="header-page video-container ef-parallax-bg">
				<video autoplay muted playsinline class="video-bg video-box" id="videoPlayer">
				    <source id="videoSource" src="${pageContext.request.contextPath}/resources/video/cpTest1.mp4" type="video/mp4">
				    Your browser does not support the video tag.
				</video>
				
				<div class="slider-description info-box">
					<div class="slider-description-inner" style="margin:0;">
						<h1 style="color:#FFFFFF;">
							<!-- span 태그를 붙이면 민트 바탕이 나타남 -->
							기업홍보 게시판
						</h1>
					</div>
				</div>
		    </div>      
	    </div>
		
		<div class="container margin-top">
		
		
	        <div class="blog-wrapper">
	        
				<c:forEach items="${companyBoardList }" var="companyBoard">
		            <div class="blog-post">
		                <div class="blog-front-image">
		                    <div class="row">
		                        <div class="col-md-6 wow animated fadeInUp" data-wow-delay="0.10s">
		                            <!-- 대표 이미지 -->
		                            <a href="${pageContext.request.contextPath}/companyBoardDetailView?cpBoardNo=${companyBoard.cpBoardNo}">
	                    				<img src="${pageContext.request.contextPath}/displayProfImg?atchtype=companyBoard&imgName=${companyBoard.cpBoardReperImg}" 
	     									alt="Blog Image">
		                            </a>
		                            
		                        </div>
		                        <div class="col-md-5 col-md-offset-1">
		                            <div class="blog-front-content wow animated fadeInUp" data-wow-delay="0.20s" style="background-color:rgba(200, 200, 200, 0.9);border-radius:10px;box-shadow: 5px 5px 5px 2px gray;">
		                                <div class="blog-front-content-inner">
		                                	<div style="display:flex;flex-direction:column;border-bottom:1px solid black;">
			                                	<!-- 작성자 이름 -->
					                            <span class="post-date" style="color:rgb(50, 50, 50);text-align:start;font-weight:bolder;">${companyBoard.userName} </span> <!-- userName이 출력됨 -->
					                            <!-- 업무 영역 -->
					                            <p style="padding:0;color:rgb(100, 100, 100);font-weight:bolder;">${companyBoard.cpBoardArea}</p>
		                                	</div>
				                            <!-- 소개글 -->
				                            <h1 style="font-size:20px;font-weight:400;color:rgb(100, 100, 100)">${companyBoard.cpBoardIntro}</h1>
				                            
				                            <!-- 게시글 상세보기 링크 (추후 수정 가능) -->
					                        <div>
						                        <a href="${pageContext.request.contextPath}/companyBoardDetailView?cpBoardNo=${companyBoard.cpBoardNo}">
					                            	<i class="read-more-blog-icon pe-7s-angle-right-circle"></i>
					                            </a>
					                        </div>
				                        </div>		                        
		                            </div>
		                           		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
				</c:forEach>
	            
	        </div>
	    </div>
		
	</section>

	<script type="text/javascript">
	    document.addEventListener("DOMContentLoaded", () => {
	        // 동영상 경로 리스트
	        const videoSources = [
	            "${pageContext.request.contextPath}/resources/video/cpTest1.mp4",
	            "${pageContext.request.contextPath}/resources/video/cpTest2.mp4",
	            "${pageContext.request.contextPath}/resources/video/cpTest3.mp4",
	            "${pageContext.request.contextPath}/resources/video/cpTest4.mp4",
	            "${pageContext.request.contextPath}/resources/video/cpTest5.mp4",
	            "${pageContext.request.contextPath}/resources/video/cpTest6.mp4",
	            "${pageContext.request.contextPath}/resources/video/cpTest7.mp4"
	        ];
	
	        let currentVideoIndex = 0;
	        const videoPlayer = document.getElementById('videoPlayer');
	        const videoSource = document.getElementById('videoSource');
	
	        // 동영상 재생 완료 이벤트
	        videoPlayer.addEventListener('ended', () => {
	            currentVideoIndex = (currentVideoIndex + 1) % videoSources.length; // 다음 동영상 인덱스
	            videoSource.src = videoSources[currentVideoIndex]; // 소스 업데이트
	            videoPlayer.load(); // 새 동영상 로드
	            videoPlayer.play(); // 재생
	        });
	    });
	</script>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>