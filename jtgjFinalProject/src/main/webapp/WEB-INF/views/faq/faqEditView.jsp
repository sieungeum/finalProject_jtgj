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
</head>
<body>

	<!-- Preloader -->
	<div class="cover"></div>

	<div class="header">
		<div class="container">
			<div class="logo">
				<a href="index.html"> <img src="img/logo.png" alt="Logo">
				</a>
			</div>

			<!-- nav -->
			<%@ include file="/WEB-INF/inc/nav.jsp" %>
		</div>
	</div>
	
	<section class="page-section" id="contact">
    	<!-- 부트스트랩으로 padding-top 을 좀 주고자 한다. -->
        <div class="container pt-5">
            <!-- Contact Section Heading-->
            <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">글쓰기</h2>
            <!-- Icon Divider-->
            <div class="divider-custom">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                <div class="divider-custom-line"></div>
            </div>
            <!-- Contact Section Form-->
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xl-7">
                	<form action="${pageContext.request.contextPath }/faqEditDo" method="POST">
                		<!-- 사용자에게는 보이지 않고 submit 시 전송됨 -->
                		<input type="hidden" name="faqNo" value="${faq.faqNo }">
                		
	             		<div class="mb-3">
	             			<label for="inputTitle">제목</label>
	                    	<input class="form-control" type="text" name="faqTitle" value="${faq.faqTitle }" />
	                    </div>
	                    
	                    <div class="mb-3">
	                         <textarea class="form-control" rows="10" name="faqContent" >${faq.faqContent }</textarea>
	                    </div>               
	                    
	                    <div class ="d-flex justify-content-end">
	                    	<a class="btn btn-secondary me-2" href ="${pageContext.request.contextPath}/faqView">취소</a>
	                    	<!-- form 태그의 submit 역할을 함 -> type=submit 넣어주기 -->
	                    	<button class="btn btn-primary" type="submit">등록</button>
	                    </div>
                	</form>
         
                </div>
            </div>
        </div>
    </section>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>