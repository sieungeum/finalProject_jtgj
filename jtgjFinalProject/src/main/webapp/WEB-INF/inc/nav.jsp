<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!-- Menu Hamburger (Default) -->
<button class="main-menu-indicator" id="open-button">
	<span class="line"></span>
</button>

<div class="menu-wrap" style="background-image: url(img/nav_bg.jpg)">
	<div class="menu-content">
		<div class="navigation">
			<span class="pe-7s-close close-menu" id="close-button"></span>
			<div class="search-wrap js-ui-search">
				<input class="js-ui-text" type="text" placeholder="Search Here...">
				<span class="eks js-ui-close"></span>
			</div>
		</div>
		<nav class="menu">
			<div class="menu-list">
				<ul>
					<li class="menu-item-has-children"><a href="${pageContext.request.contextPath }/myPage">MyPage</a></li>
					<li><a href="about.html">About</a></li>
					<li class="menu-item-has-children"><a href="#">Portfolio</a>
						<ul class="sub-menu">
							<li><a href="portfolio-2column.html">-Portfolio 2 Column</a></li>
							<li><a href="portfolio-3column.html">-Portfolio 3 Column</a></li>
							<li><a href="portfolio-masonry.html">-Portfolio Masonry</a></li>
							<li><a href="portfolio-dribbble.html">-Portfolio
									Dribbble</a></li>
						</ul></li>
					<li class="menu-item-has-children"><a href="#">Blog</a>
						<ul class="sub-menu">
							<li><a href="blog.html">Blog Default</a></li>
							<li><a href="blog-timeline.html">Blog Timeline</a></li>
							<li><a href="single-blog.html">Blog Single</a></li>
						</ul></li>
					
					<c:if test="${sessionScope.login == null }">
						<li><a href="${pageContext.request.contextPath }/loginView">로그인</a></li>
					</c:if>
					<c:if test="${sessionScope.login != null }">
					<li class="menu-item-has-children"><a href="#">${sessionScope.login.userName }님</a>
						<ul class="sub-menu">
							<li><a href="${pageContext.request.contextPath }/myPage">마이페이지</a></li>
							<li><a href="${pageContext.request.contextPath }/logoutDo">로그아웃</a></li>
						</ul>
					</li>
					</c:if>
					
				</ul>
			</div>
		</nav>

		<div class="hidden-xs">
			<div class="menu-social-media">
				<ul>
					<li><a href="#"><i class="iconmoon-facebook"></i></a></li>
					<li><a href="#"><i class="iconmoon-twitter"></i></a></li>
					<li><a href="#"><i class="iconmoon-dribbble3"></i></a></li>
					<li><a href="#"><i class="iconmoon-pinterest"></i></a></li>
					<li><a href="#"><i class="iconmoon-linkedin2"></i></a></li>
				</ul>
			</div>

			<div class="menu-information">
				<ul>
					<li><span>T:</span> 003 124 115</li>
					<li><span>E:</span> info@mail.com</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- End of Menu Hamburger (Default) -->