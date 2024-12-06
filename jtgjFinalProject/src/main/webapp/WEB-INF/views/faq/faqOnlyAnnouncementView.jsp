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
		
		.pagingBar{
			display: flex;
			justify-content: center;
			
		}
		
		.buttonBox{
			display: flex;
			justify-content: end;
		}
		
		.leftM{
			margin-left: 10%;
		}
		
		.W30{
			width: 30%
		}
		
		.searchBox{
			width: 50%;
			height: 40px;
			
			display: flex;
			justify-content: center;
		}
		
		.end{
			height: 40px;
		    margin-bottom: 20px;
		    display: block;
		}
		
		.height100{
			height: 100%;
		}
		
		.height50{
			height: 50px;
		}
		
		.width60{
			width: 25%;
		}
		
		.marginT20{
			margin-top: 10px;
		}
		
		.not-row{
			border-bottom: 2px solid #F5F5F5 !important;
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
		<div class="container" style="margin-top: 25px;">
			<h2 class="page-section-heading text-center text-uppercase text-secondary" style="margin-bottom:70px;font-size:40px;font-weight:600;">공지사항</h2>
			
			<div class="end marginT10">
				<form class="searchBox width60" style="width:100%;display:flex;justify-content:end;" action="<c:url value="/faqOnlyAnnouncementView"/>" method="GET">
					<select class="form-select me-1 height50"  name="searchOption" style="width:7%;;height:100%;margin-right:10px;padding-left:10px;border-radius:5px;">
						<option value="title" selected>제목</option>
						<option value="content">내용</option>
						<option value="name">작성자</option>
					</select>
					<input class="form-control" size=10 type="text" name="searchWord" style="width:30%;height:100%;margin-right:5px;">
					<button class="btn btn-success height50" type="submit" style="height:100%;color:white;border-radius:10px;">
						검색
					</button>
				</form>
			</div>
			
			<table class=" table table-hover">
				<thead  style="background-color:#F5F5F5;border-top:2px solid #5CB85C;">
					<tr>
						<td style="font-weight:bolder;">번호</td>
						<td style="font-weight:bolder;">제목</td>
						<td style="font-weight:bolder;">작성자</td>
						<td style="font-weight:bolder;">날짜</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${noticeList }" var="notice">
						<tr class="not-row">
							<td scope="row">공지사항</td>
							<td><a href="${pageContext.request.contextPath }/noticeDetailView?noticeNo=${notice.noticeNo}">${notice.noticeTitle }</a></td>
							<td>${notice.userName }</td>
							<td>${notice.noticeDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="buttonBox">
				<c:if test="${sessionScope.login.userRank == 'Y' || sessionScope.login.userRank == 'K'}">
					<a href="${pageContext.request.contextPath }/noticeWriteView">
						<button class="leftM button btn btn-primary" style="margin:0;border:0px;font-size:15px;padding:10px;border-radius:10px;">공지사항 쓰기</button>
					</a>
				</c:if>
			</div>
		</div>
		
		
		<!-- Paging Bar -->
		<div class="pagingBar" style="margin-bottom:250px;">
			<ul class="pagination">
				<!-- 이전 페이지 -->
				<li class="page-item ${pageSearch.firstPage == 1 ? 'disabled no-pointer' : '' }" >
					<c:if test="${searchWord == null }">
						<a class="page-link"
							href="${pageContext.request.contextPath }/faqOnlyAnnouncementView?pageNo=1&rowSizePerPage=${pageSearch.rowSizePerPage}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a>
					</c:if> <c:if test="${searchWord != null }">
						<a class="page-link"
							href="${pageContext.request.contextPath }/faqOnlyAnnouncementView?pageNo=1&rowSizePerPage=${pageSearch.rowSizePerPage}&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a>
					</c:if>
				</li>
				
				<li class="page-item ${pageSearch.firstPage == 1 ? 'disabled no-pointer' : '' }" >
					<c:if test="${searchWord == null }">
						<a class="page-link"
							href="${pageContext.request.contextPath }/faqOnlyAnnouncementView?pageNo=${pageSearch.firstPage - 1 }&rowSizePerPage=${pageSearch.rowSizePerPage}"
							aria-label="Previous"> <span aria-hidden="true">&lt;</span>
						</a>
					</c:if> <c:if test="${searchWord != null }">
						<a class="page-link"
							href="${pageContext.request.contextPath }/faqOnlyAnnouncementView?pageNo=${pageSearch.firstPage - 1 }&rowSizePerPage=${pageSearch.rowSizePerPage}&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord}"
							aria-label="Previous"> <span aria-hidden="true">&lt;</span>
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
							<a class="page-link" href="${pageContext.request.contextPath }/faqOnlyAnnouncementView?pageNo=${num }&rowSizePerPage=${pageSearch.rowSizePerPage}">${num }</a>
						</c:if> <c:if test="${pageSearch.searchWord != null }">
							<a class="page-link" href="${pageContext.request.contextPath }/faqOnlyAnnouncementView?pageNo=${num }&rowSizePerPage=${pageSearch.rowSizePerPage}&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord}">${num }</a>
						</c:if>
					</li>
				</c:forEach>

				<!-- 다음 페이지 -->
				<!-- 마지막 페이지 도달 시 disabled 추가 -->
				<li class="page-item ${pageSearch.lastPage == pageSearch.totalPageCount ? 'disabled no-pointer' : '' }">
					<c:if test="${pageSearch.searchWord == null }">
						<a class="page-link"
							href="${pageContext.request.contextPath }/faqOnlyAnnouncementView?pageNo=${pageSearch.lastPage + 1 }&rowSizePerPage=${pageSearch.rowSizePerPage}"
							aria-label="Next"> <span aria-hidden="true">&gt;</span>
						</a>
					</c:if> 
					<c:if test="${pageSearch.searchWord != null }">
						<a class="page-link"
							href="${pageContext.request.contextPath }/faqOnlyAnnouncementView?pageNo=${pageSearch.lastPage + 1 }&rowSizePerPage=${pageSearch.rowSizePerPage}&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord}"
							aria-label="Next"> <span aria-hidden="true">&gt;</span>
						</a>
					</c:if>
				</li>
				
				<li class="page-item ${pageSearch.lastPage == pageSearch.totalPageCount ? 'disabled no-pointer' : '' }">
					<c:if test="${pageSearch.searchWord == null }">
						<a class="page-link"
							href="${pageContext.request.contextPath }/faqOnlyAnnouncementView?pageNo=${pageSearch.totalPageCount }&rowSizePerPage=${pageSearch.rowSizePerPage}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a>
					</c:if> 
					<c:if test="${pageSearch.searchWord != null }">
						<a class="page-link"
							href="${pageContext.request.contextPath }/faqOnlyAnnouncementView?pageNo=${pageSearch.totalPageCount }&rowSizePerPage=${pageSearch.rowSizePerPage}&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a>
					</c:if>
				</li>
			</ul>
		</div>

	</section>
	
	
	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>