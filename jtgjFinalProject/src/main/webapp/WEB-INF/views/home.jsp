<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="ko">

<head>
	<meta charset="utf-8">
	<title>저탄고집 홈 화면</title>
	<meta name="description" content="">
	<meta name="msapplication-tap-highlight" content="yes" />
	<meta name="viewport"
		content="width=device-width, user-scalable=no, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0" />
	
	<%@ include file="/WEB-INF/inc/header.jsp" %>
	
	<style type="text/css">
		#slider-ef {
	    	height: 100% !important;
		}
		
		.load-div{
			display:flex;
			justify-content:center;
			align-items:center;
		}
		
		.click-box{
			width:50px;
			height:50px;
		}
		
		#loadCard > img:hover{
			filter: opacity(25%);
			transition-duration: 0.2s;
		}
		
		.zoom-out {
		    opacity: 0;
		    transform: scale(0.5);
		    transition: all 0.5s ease-out;
		}
		
		.zoom-out.visible {
		    opacity: 1;
		    transform: scale(1);
		}
		
		.c-img{
			position:absolute;
			width:100px;
			bottom: 10px;
			right: 10px;
		}
		
		#work-grid > div{
			padding-right:5px;
		}
	</style>
</head>
<script>
    let initialProjectsJson = '${initialProjectsJson}';
    initialProjectsJson = JSON.parse(initialProjectsJson);
    
    // 서버에서 전달받은 JSON 데이터를 활용
    document.addEventListener("DOMContentLoaded", function () {
    	let displayedPtNos = []; 
    	
        initialProjectsJson.forEach(function (project, index) {
            // 카드 DOM 요소 선택
            const card = document.querySelector(".card-" + index);
            if (card) {
                // 이미지 경로 업데이트
                const thumbnail = card.querySelector(".project-thumbnail");
                thumbnail.src = "img/pj-test/" + project.ptThumbnail;
                thumbnail.alt = project.ptTitle;

                // 제목 업데이트
                const title = card.querySelector(".project-title");
                title.textContent = project.ptTitle;

                // 사용자 이름 업데이트
                const user = card.querySelector(".project-user");
                user.textContent = project.userName;

                // 링크 업데이트
                const link = card.querySelector(".main-portfolio-link");
                link.href = "#" + project.ptNo;
                
                // displayedPtNos 배열에 pt_no 추가
                displayedPtNos.push(project.ptNo);
            }
        });
        
        // AJAX에서 사용할 displayedPtNos 전역으로 설정
        // displayedPtNos를 전역 객체로 설정하여 다른 스크립트에서 접근 가능하게 함
        window.displayedPtNos = displayedPtNos;
    });
</script>
<body>

	<!-- Preloader -->
	<div class="cover"></div>

	<div class="header">
		<div class="container">

			<!-- nav -->
			<%@ include file="/WEB-INF/inc/nav.jsp" %>

		</div>
	</div>

	<div class="container" style="height:800px;">
		<div class="slider-wrapper" style="height:100%;">
			<!-- 사진 -->
			<div id="slider-ef" class="slider-images-wrapper"">
				<img class="img-responsive" src="img/test/test1.jpg">
				<img class="img-responsive" src="img/test/test2.jpg">
				<img class="img-responsive" src="img/test/test3.jpg">
				<img class="img-responsive" src="img/test/test6.jpg">
				<img class="img-responsive" src="img/test/test7.jpg">
				<img class="img-responsive" src="img/test/test8.jpg">
				<img class="img-responsive" src="img/test/test9.jpg">
				<img class="img-responsive" src="img/test/test10.jpg">
				<img class="img-responsive" src="img/test/test11.jpg">
			</div>
		
			<div class="slider-description">
				<div class="slider-description-inner">
					<h1 style="color:white;">
						<!-- span 태그를 붙이면 민트 바탕이 나타남 -->
						Project<span style="color:black;font-weight:bolder;">JTGJ</span>
					</h1>
				</div>
				
				<div class="cd-intro">
					<div class="cd-headline clip" style="color:white;">
						<span class="cd-words-wrapper"> 
							<b class="is-visible">Redefining Materials</b> 
							<b>Innovating Construction</b> 
							<b>Sustainable by Design</b>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container margin-top">
		<div class="history-wrapper">
			<div class="col-md-6 wow fadeInUp" data-wow-duration="0.6s"
				data-wow-delay="0.5s">
				<div class="row">
					<article>
						<h1 style="margin:0;padding-bottom:15px;">Green Materials, Better Buildings</h1>
						<hr>
						<h4 style="margin-bottom:0;">프로젝트 저탄고집은 친환경 건축을 향한 여정을 시작하는</h4>
						<h4 style="margin-top:0;margin-bottom:30px;">모든 이에게 실현 가능한 솔루션을 제공합니다.</h4>
						<p style="font-weight:bolder;font-size:15px;list-style:none;padding-left:0;margin-bottom:10px;">저탄고집은..</p>
						<ul style="padding-left:15px;padding-right:45px;">
							<li style="margin-bottom:5px;padding-left:0;">고객이 건축하고자 하는 프로젝트의 자재를 친환경 자재로 변환하여, 지속 가능한 미래를 위한 첫걸음을 돕습니다.
							<li style="margin-bottom:5px;padding-left:0;">기업이 탄소를 줄이기 위해 효율적인 자재 변환 솔루션을 활용하도록 돕고, 개인이 꿈꾸던 건물의 자재를 직접 설계할 수 있도록 지원하며, 나아가 친환경 건축을 실현할 수 있는 건설사와 연결합니다.
							<li style="padding-left:0;">기업과 개인 모두를 위한 플랫폼으로, 친환경 건축을 일상화하고 건축 산업의 변화를 이끌며, 지속 가능한 삶과 미래를 만들어가는 데 기여하고자 합니다.
						</ul> 
					</article>
				</div>
			</div>
			<div class="col-md-5 col-md-offset-1 wow fadeInUp"
				data-wow-duration="0.8s" data-wow-delay="0.3s" style="height:400px;">
				<div class="row" style="height:100%;">
					<div id="history-images" class="owl-carousel" style="margin-right:0;">
						<div>
							<img class="img-responsive center-block" src="img/test/test15.jpg" style="width:90%;height:450px;overflow:hidden;margin-right:0;">
						</div>
						<div>
							<img class="img-responsive center-block" src="img/test/test14.jpg" style="width:90%;height:450px;overflow:hidden;margin-right:0;">
						</div>
						<div>
							<img class="img-responsive center-block" src="img/test/test16.jpg" style="width:90%;height:450px;overflow:hidden;margin-right:0;">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container margin-top">
		<div class="main-title">
			<h1 style="padding-bottom:15px;">WHY CHOOSE US?</h1>
			<hr>
		</div>
		<div class="services-home-page">
			<div class="row">
				<div class="col-md-4">
					<div class="services-icon">
						<span class="icon-global"></span>
						<hr>
					</div>
					<h4>SUSTAINABILITY</h4>
					<p>
						저탄고집은 플랫폼의 모든 요소에서 지속 가능성을 최우선으로 합니다.
						친환경 건축 자재 추천부터 제로 에너지 빌딩을 지원하는 솔루션까지,
						우리는 건축 산업에서 탄소 발자국을 줄이고자 노력합니다.
					</p>
				</div>
				<div class="col-md-4">
					<div class="services-icon">
						<span class="icon-globe"></span>
						<hr>
					</div>
					<h4>INNOVATION</h4>
					<p>
						저탄고집은 친환경 건축 분야에서 혁신을 선도합니다.
						자재 변환부터 설계까지 최첨단 솔루션을 제공하며,
						기업과 개인 모두가 상상하던 지속 가능한 건축물을 실현할 수 있도록 돕습니다.
						또한, 신뢰할 수 있는 건설사와의 연결을 통해 혁신적인 아이디어가 현실로 구현될 수 있도록 지원합니다.
					</p>
				</div>
				<div class="col-md-4">
					<div class="services-icon">
						<span class="icon-search"></span>
						<hr>
					</div>
					<h4>ACCESSIBILITY</h4>
					<p>
						지속 가능한 건축은 누구에게나 열려 있어야 한다고 믿습니다.
						저탄고집은 기업이든 개인이든, 누구나 간편하게 친환경 건축 자재와 서비스를 이용할 수 있도록 설계되었습니다.
						기술적 전문 지식이 없어도 괜찮습니다.
						사용자 친화적인 도구와 자원을 통해 아이디어와 실행의 간극을 좁혀드립니다.
					</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container margin-top">
		<div class="main-title">
			<h1 style="padding-bottom:15px;">Projects</h1>
			<hr>
		</div>
		<div class="portfolio-wrapper">
			<div class="js-masonry">
				<div class="row" id="work-grid">
					<!-- Insights 혹은 Projects 실행 -->	
				    <div class="col-md-6 col-sm-6 col-xs-12 card-0">
				        <div class="img home-portfolio-image" style="width:550px; height:300px;">
				            <img src="" alt="Portfolio Item" class="project-thumbnail" style="width:100%;height:100%;">
				            <div class="overlay-thumb">
				                <div class="details">
				                    <span class="title project-title"></span>
				                    <span class="info project-user"></span>
				                </div>
				                <span class="btnBefore"></span>
				                <span class="btnAfter"></span>
				                <a class="main-portfolio-link" href="#"></a>
				            </div>
				        </div>
				    </div>
				    
				    <div class="col-md-6 col-sm-6 col-xs-12 card-1">
				        <div class="img home-portfolio-image" style="width:550px; height:300px;">
				            <img src="" alt="Portfolio Item" class="project-thumbnail" style="width:100%;height:100%;">
				            <div class="overlay-thumb">
				                <div class="details">
				                    <span class="title project-title"></span>
				                    <span class="info project-user"></span>
				                </div>
				                <span class="btnBefore"></span>
				                <span class="btnAfter"></span>
				                <a class="main-portfolio-link" href="#"></a>
				            </div>
				        </div>
				   </div>
				</div>
			</div>
			<div class="load-more">
            	<a href="javascript:void(0)" id="load-more-2col"><i class="icon-refresh"></i></a>
       		</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp" %>
	
	<script>
	
	</script>

</body>
</html>