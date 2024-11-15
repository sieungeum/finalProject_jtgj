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
		<div class="container" style="margin-top: 100px;">
			<table class=" table table-hover">
				<thead>
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>날짜</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${faqList }" var="faq">
						<tr>
							<td scope="row">${faq.faqNo }</td>
							<td>
                                <c:choose>
                                    <c:when test="${faq.faqSicYn == 'N'}">
                                        <a href="<c:url value='/faqDetailView?faqNo=${faq.faqNo }'/>">${faq.faqTitle }[${faq.faqCount }]</a>
                                    </c:when>
                                    <c:when test="${faq.faqSicYn == 'S' && (faq.userId == sessionScope.login.userId || sessionScope.login.userRank == 'K' || sessionScope.login.userRank == 'Y')}">
                                        <a href="<c:url value='/faqDetailView?faqNo=${faq.faqNo }'/>">${faq.faqTitle } <span class="text-muted">(비밀글)</span>[${faq.faqCount }]</a>
                                    </c:when>
                                    <c:otherwise>
                                        <span>비밀글 입니다.[${faq.faqCount }]</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
							<td>${faq.userName }</td>
							<td>${faq.faqDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<a href="${pageContext.request.contextPath }/faqWriteView">
				<button class="button">글쓰기</button>
			</a>
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