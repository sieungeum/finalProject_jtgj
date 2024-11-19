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
</head>
<body>

	<!-- Preloader -->
	<div class="cover"></div>

	<div class="header">
		<div class="container">

			<!-- nav -->
			<%@ include file="/WEB-INF/inc/nav.jsp" %>00

		</div>
	</div>

	<div class="container">
		<div class="slider-wrapper">
			<!-- 사진 -->
			<div id="slider-ef" class="slider-images-wrapper">
				<img class="img-responsive" src="img/test/test1.jpg">
				<img class="img-responsive" src="img/test/test1.jpg">
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
						<h1>Green Materials, Better Buildings</h1>
						<hr>
						<h4>
						    프로젝트 저탄고집은 친환경 건축을 향한 여정을 시작하는</br>
						    모든 이에게 실현 가능한 솔루션을 제공합니다.
						</h4>
						<p>
							<br />
						    우리 웹사이트는 고객이 건축하고자 하는 프로젝트의 자재를 친환경 자재로 변환하여, 지속 가능한 미래를 위한 첫걸음을 돕습니다.  
						    기업은 탄소를 줄이기 위해 효율적인 자재 변환 솔루션을 활용할 수 있으며,  
						    개인은 꿈꾸던 건물의 자재를 설계하고, 친환경 건축을 실현할 수 있는 건설사와의 연결을 통해 상상을 현실로 만들 수 있습니다.  
						    저탄고집은 기업과 개인 모두를 위한 플랫폼으로, 친환경 건축을 일상화하고 건축 산업의 변화를 이끌며,  
						    지속 가능한 삶과 미래를 만들어가는 데 기여하고자 합니다.
						</p>
					</article>
				</div>
			</div>
			<div class="col-md-5 col-md-offset-1 wow fadeInUp"
				data-wow-duration="0.8s" data-wow-delay="0.3s" style="height:400px;">
				<div class="row" style="height:100%;">
					<div id="history-images" class="owl-carousel">
						<div>
							<img class="img-responsive center-block" src="img/test/test13.jpg" style="width:90%;height:450px;overflow:hidden;">
						</div>
						<div>
							<img class="img-responsive center-block" src="img/test/test14.jpg" style="width:90%;height:450px;overflow:hidden;">
						</div>
						<div>
							<img class="img-responsive center-block" src="img/test/test15.jpg" style="width:90%;height:450px;overflow:hidden;">
						</div>
						<div>
							<img class="img-responsive center-block" src="img/test/test16.jpg" style="width:90%;height:450px;overflow:hidden;">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container margin-top">
		<div class="main-title">
			<h1>WHY CHOOSE US?</h1>
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
			<h1>IDEAS</h1>
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
				<a href="javascript:void(0)" class="filter" data-filter="branding">Branding</a>
				<a href="javascript:void(0)" class="filter" data-filter="web">Web
					Design</a> <a href="javascript:void(0)" class="filter"
					data-filter="graphic">Graphic Design</a>
			</div>
			<div class="js-masonry">
				<div class="row" id="work-grid">
					<!-- Begin of Thumbs Portfolio -->
					<div class="col-md-4 col-sm-4 col-xs-12 mix branding">
						<div class="img home-portfolio-image">
							<img src="img/home-portfolio/img_1.jpg" alt="Portfolio Item">
							<div class="overlay-thumb">
								<a href="javascript:void(0)" class="like-product"> <i
									class="ion-ios-heart-outline"></i> <span class="like-product">Liked</span>
									<span class="output">250</span>
								</a>
								<div class="details">
									<span class="title">STYLE FASHION</span> <span class="info">NEW
										BAG & STYLE FASHION</span>
								</div>
								<span class="btnBefore"></span> <span class="btnAfter"></span> <a
									class="main-portfolio-link" href="single-project.html"></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-12 mix web">
						<div class="img home-portfolio-image">
							<img src="img/home-portfolio/img_2.jpg" alt="Portfolio Item">
							<div class="overlay-thumb">
								<a href="javascript:void(0)" class="like-product"> <i
									class="ion-ios-heart-outline"></i> <span class="like-product">Liked</span>
									<span class="output">60</span>
								</a>
								<div class="details">
									<span class="title">WATCH-J</span> <span class="info">NEW
										TREND FASHION</span>
								</div>
								<span class="btnBefore"></span> <span class="btnAfter"></span> <a
									class="main-portfolio-link" href="single-project.html"></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-12 mix graphic">
						<div class="img home-portfolio-image">
							<img src="img/home-portfolio/img_3.jpg" alt="Portfolio Item">
							<div class="overlay-thumb">
								<a href="javascript:void(0)" class="like-product"> <i
									class="ion-ios-heart-outline"></i> <span class="like-product">Liked</span>
									<span class="output">1060</span>
								</a>
								<div class="details">
									<span class="title">STYLE FASHION</span> <span class="info">NEW
										BAG & STYLE FASHION</span>
								</div>
								<span class="btnBefore"></span> <span class="btnAfter"></span> <a
									class="main-portfolio-link" href="single-project.html"></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-12 mix branding">
						<div class="img home-portfolio-image">
							<img src="img/home-portfolio/img_4.jpg" alt="Portfolio Item">
							<div class="overlay-thumb">
								<a href="javascript:void(0)" class="like-product"> <i
									class="ion-ios-heart-outline"></i> <span class="like-product">Liked</span>
									<span class="output">900</span>
								</a>
								<div class="details">
									<span class="title">STYLE FASHION</span> <span class="info">NEW
										BAG & STYLE FASHION</span>
								</div>
								<span class="btnBefore"></span> <span class="btnAfter"></span> <a
									class="main-portfolio-link" href="single-project.html"></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-12 mix branding">
						<div class="img home-portfolio-image">
							<img src="img/home-portfolio/img_5.jpg" alt="Portfolio Item">
							<div class="overlay-thumb">
								<a href="javascript:void(0)" class="like-product"> <i
									class="ion-ios-heart-outline"></i> <span class="like-product">Liked</span>
									<span class="output">979</span>
								</a>
								<div class="details">
									<span class="title">STYLE FASHION</span> <span class="info">NEW
										BAG & STYLE FASHION</span>
								</div>
								<span class="btnBefore"></span> <span class="btnAfter"></span> <a
									class="main-portfolio-link" href="single-project.html"></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-12 mix branding">
						<div class="img home-portfolio-image">
							<img src="img/home-portfolio/img_6.jpg" alt="Portfolio Item">
							<div class="overlay-thumb">
								<a href="javascript:void(0)" class="like-product"> <i
									class="ion-ios-heart-outline"></i> <span class="like-product">Liked</span>
									<span class="output">1024</span>
								</a>
								<div class="details">
									<span class="title">STYLE FASHION</span> <span class="info">NEW
										BAG & STYLE FASHION</span>
								</div>
								<span class="btnBefore"></span> <span class="btnAfter"></span> <a
									class="main-portfolio-link" href="single-project.html"></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-12 mix branding">
						<div class="img home-portfolio-image">
							<img src="img/home-portfolio/img_7.jpg" alt="Portfolio Item">
							<div class="overlay-thumb">
								<a href="javascript:void(0)" class="like-product"> <i
									class="ion-ios-heart-outline"></i> <span class="like-product">Liked</span>
									<span class="output">2048</span>
								</a>
								<div class="details">
									<span class="title">STYLE FASHION</span> <span class="info">NEW
										BAG & STYLE FASHION</span>
								</div>
								<span class="btnBefore"></span> <span class="btnAfter"></span> <a
									class="main-portfolio-link" href="single-project.html"></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-12 mix branding">
						<div class="img home-portfolio-image">
							<img src="img/home-portfolio/img_8.jpg" alt="Portfolio Item">
							<div class="overlay-thumb">
								<a href="javascript:void(0)" class="like-product"> <i
									class="ion-ios-heart-outline"></i> <span class="like-product">Liked</span>
									<span class="output">256</span>
								</a>
								<div class="details">
									<span class="title">STYLE FASHION</span> <span class="info">NEW
										BAG & STYLE FASHION</span>
								</div>
								<span class="btnBefore"></span> <span class="btnAfter"></span> <a
									class="main-portfolio-link" href="single-project.html"></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-12 mix branding">
						<div class="img home-portfolio-image">
							<img src="img/home-portfolio/img_9.jpg" alt="Portfolio Item">
							<div class="overlay-thumb">
								<a href="javascript:void(0)" class="like-product"> <i
									class="ion-ios-heart-outline"></i> <span class="like-product">Liked</span>
									<span class="output">256</span>
								</a>
								<div class="details">
									<span class="title">STYLE FASHION</span> <span class="info">NEW
										BAG & STYLE FASHION</span>
								</div>
								<span class="btnBefore"></span> <span class="btnAfter"></span> <a
									class="main-portfolio-link" href="single-project.html"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="load-more">
				<a href="javascript:void(0)" id="load-more"><i
					class="icon-refresh"></i></a>
			</div>
		</div>
	</div>
	<div class="container margin-top">
		<div class="newsletter">
			<div class="col-md-6">
				<div class="row">
					<div class="newsletter-left">
						<div class="newsletter-left-inner">
							<h1>
								STAY INFORMED <br> WITH OUR <b>NEWSLETTER</b>
							</h1>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="row">
					<div class="newsletter-right"
						style="background: url(img/newsletter-bg.jpg)">
						<div class="newsletter-right-inner">
							<form>
								<input type="text" name="newsletter"
									placeholder="ENTER YOUR EMAIL"> <input type="submit"
									value="SUBSCRIBE">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>