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
		<div class="container">
		    <div class="header-page ef-parallax-bg" style="background-image:url(img/portfolio-header.jpg)">
		        <div class="col-md-6 col-md-offset-6">
		            <div class="row">
		                <div class="inner-content">
		                    <div class="header-content">
		                        <h1>Portfolio</h1>
		                        <hr>
		                        <p>Everything created in simple way</p>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		
		<div class="container margin-top">
        <div class="portfolio-wrapper">
            <button class="nav">
                <span class="icon-container">
            <span class="line line01"></span>
                <span class="line line02"></span>
                <span class="line line03"></span>
                <span class="line line04"></span>
                </span>
            </button>
            <div class="works-filter">
                <a href="javascript:void(0)" class="filter active" data-filter="mix">All</a>
                <a href="javascript:void(0)" class="filter" data-filter="branding">Branding</a>
                <a href="javascript:void(0)" class="filter" data-filter="web">Web Design</a>
                <a href="javascript:void(0)" class="filter" data-filter="graphic">Graphic Design</a>
            </div>
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
                    <div class="col-md-4 col-sm-4 col-xs-12 mix branding">
                        <div class="img home-portfolio-image">
                            <img src="img/home-portfolio/img_7.jpg" alt="Portfolio Item">
                            <div class="overlay-thumb">
                                <a href="javascript:void(0)" class="like-product">
                                    <i class="ion-ios-heart-outline"></i>
                                    <span class="like-product">Liked</span>
                                    <span class="output">2048</span>
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
                            <img src="img/home-portfolio/img_8.jpg" alt="Portfolio Item">
                            <div class="overlay-thumb">
                                <a href="javascript:void(0)" class="like-product">
                                    <i class="ion-ios-heart-outline"></i>
                                    <span class="like-product">Liked</span>
                                    <span class="output">256</span>
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
                            <img src="img/home-portfolio/img_9.jpg" alt="Portfolio Item">
                            <div class="overlay-thumb">
                                <a href="javascript:void(0)" class="like-product">
                                    <i class="ion-ios-heart-outline"></i>
                                    <span class="like-product">Liked</span>
                                    <span class="output">256</span>
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
            <div class="load-more">
                <a href="javascript:void(0)" id="load-more"><i class="icon-refresh"></i></a>
            </div>
        </div>
    </div>
		
		<!-- Paging Bar -->
		<div class="d-flex justify-content-center">
			<nav aria-label="Page navigation example">
				<ul class="pagination">

					<!-- 이전 페이지 -->
					
					<li class="page-item ${pageSearch.firstPage == 1 ? 'disabled no-pointer' : '' }" >
						<c:if test="${searchWord == null }">
							<a class="page-link"
								href="${pageContext.request.contextPath }/faqView?pageNo=1&rowSizePerPage=${pageSearch.rowSizePerPage}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a>
						</c:if> <c:if test="${searchWord != null }">
							<a class="page-link"
								href="${pageContext.request.contextPath }/faqView?pageNo=1&rowSizePerPage=${pageSearch.rowSizePerPage}&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a>
						</c:if>
					</li>
					
					<li class="page-item ${pageSearch.firstPage == 1 ? 'disabled no-pointer' : '' }" >
						<c:if test="${searchWord == null }">
							<a class="page-link"
								href="${pageContext.request.contextPath }/faqView?pageNo=${pageSearch.firstPage - 1 }&rowSizePerPage=${pageSearch.rowSizePerPage}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a>
						</c:if> <c:if test="${searchWord != null }">
							<a class="page-link"
								href="${pageContext.request.contextPath }/faqView?pageNo=${pageSearch.firstPage - 1 }&rowSizePerPage=${pageSearch.rowSizePerPage}&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a>
						</c:if>
					</li>

					<!-- 중간 페이지 번호 부분 -->
					<!-- model에 keySearch 이름으로 searchVO를 담음 -->
					<!-- searchVO 내 pageNo, firstPage, lastPage 채워져있음 -->
					<c:forEach begin="${pageSearch.firstPage }"
						end="${pageSearch.lastPage }" var="num">
						<li class="page-item ${pageSearch.pageNo == num ? 'active' : ''}">
							<c:if test="${pageSearch.searchWord == null }">
								<a class="page-link" href="${pageContext.request.contextPath }/faqView?pageNo=${num }&rowSizePerPage=${pageSearch.rowSizePerPage}">${num }</a>
							</c:if> <c:if test="${pageSearch.searchWord != null }">
								<a class="page-link" href="${pageContext.request.contextPath }/faqView?pageNo=${num }&rowSizePerPage=${pageSearch.rowSizePerPage}&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord}">${num }</a>
							</c:if>
						</li>
					</c:forEach>

					<!-- 다음 페이지 -->
					<!-- 마지막 페이지 도달 시 disabled 추가 -->
					<li class="page-item ${pageSearch.lastPage == pageSearch.totalPageCount ? 'disabled no-pointer' : '' }">
						<c:if test="${pageSearch.searchWord == null }">
							<a class="page-link"
								href="${pageContext.request.contextPath }/faqView?pageNo=${pageSearch.lastPage + 1 }&rowSizePerPage=${pageSearch.rowSizePerPage}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a>
						</c:if> 
						<c:if test="${pageSearch.searchWord != null }">
							<a class="page-link"
								href="${pageContext.request.contextPath }/faqView?pageNo=${pageSearch.lastPage + 1 }&rowSizePerPage=${pageSearch.rowSizePerPage}&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a>
						</c:if>
					</li>
					
					<li class="page-item ${pageSearch.lastPage == pageSearch.totalPageCount ? 'disabled no-pointer' : '' }">
						<c:if test="${pageSearch.searchWord == null }">
							<a class="page-link"
								href="${pageContext.request.contextPath }/faqView?pageNo=${pageSearch.totalPageCount }&rowSizePerPage=${pageSearch.rowSizePerPage}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a>
						</c:if> 
						<c:if test="${pageSearch.searchWord != null }">
							<a class="page-link"
								href="${pageContext.request.contextPath }/faqView?pageNo=${pageSearch.totalPageCount }&rowSizePerPage=${pageSearch.rowSizePerPage}&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a>
						</c:if>
					</li>
					
				</ul>
			</nav>
		</div>
		
		<div class="d-flex justify-content-center">
			<form class="d-flex" action="<c:url value="/faqView"/>" method="GET">
				<select class="form-select me-1" name="searchOption">
					<option value="title" selected>제목</option>
					<option value="content">내용</option>
					<option value="name">작성자</option>
				</select>
				<input class="form-control me-1" type="text" name="searchWord">
				<button class="btn btn-primary" type="submit">
					<i class="fa-solid fa-magnifying-glass fa-2xl" style="color: #63E6BE;"></i>
				</button>
			</form>
		</div>
		
	</section>
	
	
	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>