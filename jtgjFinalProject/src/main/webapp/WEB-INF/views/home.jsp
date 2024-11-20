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
			<h1 style="">IDEAS</h1>
			<hr>
		</div>
		<div class="portfolio-wrapper">
			<button class="nav">
				<span class="icon-container"> <span class="line line01"></span>
					<span class="line line02"></span> <span class="line line03"></span>
					<span class="line line04"></span>
				</span>
			</button>
			<div class="works-filter">
				<a href="javascript:void(0)" class="filter active" data-filter="mix">All</a>
				<a href="javascript:void(0)" class="filter" data-filter="Insights">Insights</a>
				<a href="javascript:void(0)" class="filter" data-filter="Projects">Projects</a> 
			</div>
			<div class="js-masonry">
				<div class="row" id="work-grid">
					<!-- Insights 혹은 Projects 실행 -->			
				</div>
			</div>
		</div>
	</div>
	
	<div class="load-div">
		<div class="click-box">
			<a href="javascript:void(0)" id="loadCard">
				<img src="img/plus-square.svg" style="width:100%;">
			</a>
		</div>
	</div>
	
	
	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp" %>

	<!-- JSON 데이터를 안전하게 전달 -->
	<script id="jsonData" type="application/json">
   		${jsonData}
	</script>
	<script>
		let jsonData = JSON.parse(document.getElementById('jsonData').textContent);
		let v_workGrid = document.getElementById('work-grid');
		let v_workGridPlut = document.getElementById('work-grid-plus');
		
		console.log(jsonData);
		
		let v_projects = [];
		
		for(let i = 0; i < jsonData.length; i++){
			for(let j = 0; j < jsonData[i]['p_img'].length; j++){
				v_projects.push({
					project: jsonData[i]['p_img'][j],
					title: jsonData[i]['title'],
					c_img: jsonData[i]['img']
				});
			}
		}
		console.log(v_projects);
		
		for(let i = 0; i < 9; i++){
			v_workGrid.innerHTML += [
				'<div class="col-md-4 col-sm-4 col-xs-12 mix Projects" style="width:380px;height:350px; margin-bottom:15px;">' +
		        '<div class="img home-portfolio-image">' +
			        '<img src="' + v_projects[i]['project'] + '" alt="Portfolio Item" style="height:100%;">' +
			        '<img class="c-img" src="' + v_projects[i]['c_img'] + '">' +
			        '<div class="overlay-thumb">' +
				        '<a href="javascript:void(0)" class="like-product">' + 
				        	'<i class="ion-ios-heart-outline"></i>' + 
				        	'<span class="like-product">Liked</span>' +
				           	'<span class="output">250</span>' +
			         	'</a>' +
			           '<div class="details">' +
			              '<span class="title">' + v_projects[i]['title'] + '</span>' +
			           '</div>' +
			           '<span class="btnBefore"></span> <span class="btnAfter"></span> <a' +
			              'class="main-portfolio-link" href="single-project.html"></a>' +
			        '</div>' +
			     '</div>' +
			     '</div>'
			];
		}		
		
/* 		document.getElementById() */

		
		
	</script>


</body>
</html>