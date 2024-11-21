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
		    <div class="header-page ef-parallax-bg" style="background-image:url(img/blog-header.jpg)">
		        <div class="col-md-6 col-md-offset-6">
		            <div class="row">
		                <div class="inner-content">
		                    <div class="header-content">
		                        <input>
		                        <hr>
		                        <p>Everything created in simple way</p>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>    
		
		<div class="container margin-top">
		    <div class="single-blog-wrapper">
		        <div class="row">
		            <div class="col-md-9">
		                <h1>이곳은 기업 아이콘을 넣는 곳</h1>
		                <button type="button" class="btn btn-success">팔로우하기</button>
		                <button type="button" class="btn btn-primary">공유하기</button>
		            </div>
		        </div>
		        <div class="blog-post">
		            <div class="blog-front-image">
		                <div class="row">
		                    <div class="col-md-6 wow animated fadeInUp" data-wow-delay="0.10s">
		                        <img src="img/blog/img_1.jpg" alt="Blog Image">
		                    </div>
		                    <div class="col-md-5 col-md-offset-1">
		                        <div class="blog-front-content wow animated fadeInUp" data-wow-delay="0.20s">
		                            <div class="blog-front-content-inner">
		                               <span class="post-single-date">14 Jun - 2015</span>
		                               <div class="share-buttons">
		                                   <span class="info-title">Share:</span>   
		                                   <ul>
		                                       <li><a href="#"><i class="iconmoon-facebook"></i></a></li>
		                                       <li><a href="#"><i class="iconmoon-twitter"></i></a></li>
		                                       <li><a href="#"><i class="iconmoon-google-plus"></i></a></li>
		                                       <li><a href="#"><i class="iconmoon-pinterest"></i></a></li>
		                                   </ul>
		                               </div>                               
		                               <div class="blog-tags">
		                                   <span class="info-title">Tags:</span>   
		                                   <ul>
		                                       <li><a href="#">clean</a></li>
		                                       <li><a href="#">modern</a></li>
		                                       <li><a href="#">beauty</a></li>
		                                       <li><a href="#">fashion</a></li>
		                                   </ul>
		                               </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		
		                <div class="full-blog-content">
		                  <p>Desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it.who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain advantage.
		                    The master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there.</p>
		                    
		                    <blockquote>Mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Expound the actual teachings of the great explorer of the truth, account of the system the master-builder of human happiness.</blockquote>
		
		                  <p><b>Avoids pleasure itself, because it is pleasure,</b> but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some.
		                     Totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia undertakes laborious physical exercise, except 
		                     Totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia.  great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that extremely.</p>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
    </section>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>