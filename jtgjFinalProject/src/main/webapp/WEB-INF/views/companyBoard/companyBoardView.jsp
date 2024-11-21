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
		                        <h1> 기업 홍보 게시판 </h1>
		                        <hr>
		                        <p>이곳은 건축 관련 기업들을 살펴보는 곳입니다.</p>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		
		<div class="container margin-top">
        <div class="blog-wrapper">
            <div class="blog-post">
                <div class="blog-front-image">
                    <div class="row">
                        <div class="col-md-6 wow animated fadeInUp" data-wow-delay="0.10s">
                            <img src="img/blog/img_1.jpg" alt="Blog Image">
                        </div>
                        <div class="col-md-5 col-md-offset-1">
                            <div class="blog-front-content wow animated fadeInUp" data-wow-delay="0.20s">
                                <div class="blog-front-content-inner">
                                    <span class="post-date">14 Jun - 2015</span>
                                    <h1>Idea of denouncing pleasure and praising pain was born</h1>
                                    <p>The great explorer of the truth, the master of human happiness rejects, dislike pleasure itself...</p>
                                    <a href="single-blog.html"><i class="read-more-blog-icon pe-7s-angle-right-circle"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="blog-post">
                <div class="blog-front-image">
                    <div class="row">
                        <div class="col-md-6 wow animated fadeInUp" data-wow-delay="0.10s">
                            <img src="img/blog/img_2.jpg" alt="Blog Image">
                        </div>
                        <div class="col-md-5 col-md-offset-1">
                            <div class="blog-front-content wow animated fadeInUp" data-wow-delay="0.20s">
                                <div class="blog-front-content-inner">
                                    <span class="post-date">9 Jun - 2015</span>
                                    <h1>Denouncing pleasure clean and praising pain was born</h1>
                                    <p>The great explorer of the truth, the master of human happiness rejects, dislike pleasure itself...</p>
                                    <a href="single-blog.html"><i class="read-more-blog-icon pe-7s-angle-right-circle"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="blog-post">
                <div class="blog-front-image">
                    <div class="row">
                        <div class="col-md-6 wow animated fadeInUp" data-wow-delay="0.10s">
                            <div class="blog-thumb">
                                <img src="img/blog/img_3.jpg" alt="Blog Image">
                                <div class="icon-video-blog">
                                    <a href="https://www.youtube.com/watch?v=n2vy7qRm5s0" class="popup-video playBut">
                                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="69px" height="69px" viewBox="0 0 213.7 213.7" enable-background="new 0 0 213.7 213.7" xml:space="preserve">
                                            <polygon class="triangle" id="XMLID_18_" fill="none" stroke-width="7" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" points="
                                        73.5,62.5 148.5,105.8 73.5,149.1 " />
                                            <circle class="circle" id="XMLID_17_" fill="none" stroke-width="7" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" cx="106.8" cy="106.8" r="103.3" />
                                        </svg>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 col-md-offset-1">
                            <div class="blog-front-content wow animated fadeInUp" data-wow-delay="0.20s">
                                <div class="blog-front-content-inner">
                                    <span class="post-date">9 Jun - 2015</span>
                                    <h1>Denouncing pleasure clean and praising pain was born</h1>
                                    <p>The great explorer of the truth, the master of human happiness rejects, dislike pleasure itself...</p>
                                    <a href="single-blog.html"><i class="read-more-blog-icon pe-7s-angle-right-circle"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a href="${pageContext.request.contextPath }/companyBoardWriteView">
	    <button type="button" class="btn btn-primary">글쓰기</button>
    </a>
		
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