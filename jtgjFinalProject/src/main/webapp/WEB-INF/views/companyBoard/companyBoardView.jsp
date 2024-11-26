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
	        
				<c:forEach items="${companyBoardList }" var="companyBoard">
		            <div class="blog-post">
		                <div class="blog-front-image">
		                    <div class="row">
		                        <div class="col-md-6 wow animated fadeInUp" data-wow-delay="0.10s">
		                            <!-- 대표 이미지 -->
		                            <p>${companyBoard}</p>
                    				<img src="${pageContext.request.contextPath}/displayImage?imgName=${companyBoard.cpBoardReperImg}" 
     									alt="Blog Image" style="width: 100%; height: auto;">
		                        </div>
		                        <div class="col-md-5 col-md-offset-1">
		                            <div class="blog-front-content wow animated fadeInUp" data-wow-delay="0.20s">
		                                <div class="blog-front-content-inner">
				                            <!-- 작성자 이름 -->
				                            <span class="post-date">${companyBoard.userName}</span> <!-- userName이 출력됨 -->
				                            <!-- 소개글 -->
				                            <h1>${companyBoard.cpBoardIntro}</h1>
				                            <!-- 업무 영역 -->
				                            <p>${companyBoard.cpBoardArea}</p>
				                            <!-- 게시글 상세보기 링크 (추후 수정 가능) -->
				                            <a href="single-blog.html"><i class="read-more-blog-icon pe-7s-angle-right-circle"></i></a>
				                        </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
				</c:forEach>
	            
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