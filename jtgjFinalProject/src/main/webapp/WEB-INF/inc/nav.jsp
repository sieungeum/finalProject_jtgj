<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="logo">
	<a href="home.html"> <img src="img/logo-1.png" alt="Logo" style="width:30%;"></a>
</div>

<!-- Menu Hamburger (Default) -->
<button class="main-menu-indicator" id="open-button">
	<span class="line"></span>
</button>

<div class="menu-wrap" style="background-image: url(img/nav_bg.jpg)">
	<div class="menu-content">
		<div class="navigation">
			<span class="pe-7s-close close-menu" id="close-button"></span>
		</div>
		<nav class="menu">
			<div class="menu-list">
				<ul>
					<li style="margin-bottom:15px;" class="menu-item-has-children"><a href="${pageContext.request.contextPath}/estimateHome">견적작성</a>
						
					<li style="margin-bottom:15px;" class="menu-item-has-children"><a href="${pageContext.request.contextPath}/companyBoardView">기업홍보게시판</a>	
						
					<!-- 건의사항 페이지 추가 -->			
					<li style="margin-bottom:15px;" class="menu-item-has-children"><a href="#">FAQ</a>
                        <ul class="sub-menu">
                            <li style="margin-bottom:5px;"><a href="${pageContext.request.contextPath }/faqView">- 건의사항</a></li>
                            <li><a href="${pageContext.request.contextPath }/faqOnlyAnnouncementView">- 공지사항</a></li>
                        </ul>
                    </li>
					
					<c:if test="${sessionScope.login == null }">
						<li><a href="${pageContext.request.contextPath }/loginView">로그인</a></li>
					</c:if>
					<c:if test="${sessionScope.login != null }">
						<li class="menu-item-has-children"><a href="#">${sessionScope.login.userName }님</a>
							<ul class="sub-menu">
							
								<li style="margin-bottom:10px;"><a href="${pageContext.request.contextPath }/myPage">- 마이페이지</a></li>
								
								<c:if test="${sessionScope.login.userRank == 'Y' || sessionScope.login.userRank == 'K' || sessionScope.login.userRank == 'L' }">
									<li style="margin-bottom:10px;"><a href="${pageContext.request.contextPath }/adminPage">- 관리자페이지</a></li>
								</c:if>
								
								<li><a href="${pageContext.request.contextPath }/logoutDo">- 로그아웃</a></li>
							</ul>
						</li>
					</c:if>
					
				</ul>
			</div>
		</nav>

		<div class="hidden-xs">
			<div class="menu-information">
				<ul>
					<li><span>T:</span> 010-4929-1779</li>
					<li><span>E:</span> jjjkuul@naver.com</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- End of Menu Hamburger (Default) -->