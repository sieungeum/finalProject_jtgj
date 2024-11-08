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
            <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">글 상세보기</h2>
            <!-- Icon Divider-->
            <div class="divider-custom">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                <div class="divider-custom-line"></div>
            </div>
            <!-- Contact Section Form-->
            
            <section class="page-section">
	            <div class="container pt-5">	
	            	<div class="row justify-content-center">
	            		<div class="col-lg-8 col-xl-7">
			         		<div class="mb-3">
			                	<h6>${faq.faqTitle }</h6>
			                </div>
			                
			                <div class="mb-3 d-flex justify-content-end">
			                     <h6>${faq.userName }</h6>
			                     <h6>${faq.faqDate }</h6>
			                </div>
			                
			                <div class="mb-3">
			                	<pre>${faq.faqContent }</pre>
			                </div>               
			                
			                <div class ="d-flex justify-content-end">
			                	<a class="btn btn-secondary me-2" href ="${pageContext.request.contextPath}/faqView">돌아가기</a>
			                </div>
			                <c:if test="${faq.userId == sessionScope.login.userId }">  
			                	<div class="col-lg-8 col-xl-7">
					                <div class ="d-flex justify-content-end">
					                	<form action="<c:url value="/faqEditView" />" method="POST">
					                		<input type="hidden" value="${faq.faqNo }" name="faqNo">
					                		<button class="btn btn-secondary me-2" type="submit">수정</button>
					                	</form>
					                	<form action="<c:url value="/faqDeleteDo" />" method="POST" id="deleteForm">
					                		<input type="hidden" value="${faq.faqNo }" name="faqNo">
					                		<button class="btn btn-secondary me-2" type="button" id="deleteBtn">삭제</button>
					                	</form>
					                	
					                </div>
			                	</div>
			                </c:if>
	            		</div>
	            	</div>
	            </div>
            </section>
            
        </div>
    </section>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp" %>
	
	<script type="text/javascript">
		const v_btn = document.getElementById("deleteBtn");
		const v_form = document.getElementById("deleteForm");
		
		v_btn.addEventListener("click", ()=>{
			if(confirm('정말로 삭제하시겠습니까?')){
				v_form.submit();
			}
		});
		
	</script>
	
</body>
</html>