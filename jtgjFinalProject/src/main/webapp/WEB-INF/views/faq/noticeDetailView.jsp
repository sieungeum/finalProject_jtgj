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
	
	<style type="text/css">
	
		.dFjcE{
			display: flex;
			justify-content: end;
		}
		
		.dFjcC{
			display: flex;
			justify-content: center;
		}
		
		.dFjcB{
			display: flex;
			justify-content: space-between;
		}
		
		.marR{
			margin-right: 10px;
		}
		
		.marTB{
			margin-top: 15px;
			margin-bottom: 15px;
		}
		
		.marT{
			margin-top: 15px;
		}
		
		.marT30{
			margin_top: 100px;
		}
		
		.jE{
			justify-content: end;
		}
		
		.df{
			display: flex;
		}
		
		.minH{
			min-height: 200px;
		}
		
		.height50{
			height: 50px;
		}
		
		.maxW{
			max-width: 300px;
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
	
	<section class="page-section" id="contact">
    	<!-- 부트스트랩으로 padding-top 을 좀 주고자 한다. -->
        <div class="container pt-5">
            <!-- Contact Section Heading-->
            <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">공지사항 상세</h2>
            <!-- Icon Divider-->
            <div class="divider-custom">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                <div class="divider-custom-line"></div>
            </div>
            <!-- Contact Section Form-->
            
            <section class="page-section">
	            <div class="container pt-5">	
	            	<div class="dFjcC">
	            		<div class="col-lg-8 col-xl-7">
	            			<div class="dFjcB">
				         		<div class="mb-3">
				                	<h2>${notice.noticeTitle }</h2>
				                </div>
				                <div class="jE maxW ">
				                     <h6 class="dFjcE">작성자 :  ${notice.userName }</h6>
				                     <h6 class="dFjcE">${notice.noticeDate }</h6>
				                </div>
	            			</div>
			                
			                
			                
			                <div class="faq-body minH">
			                	<!-- <pre>${notice.noticeContent }</pre> -->
			                	${notice.noticeContent} 
			                </div>               
			                
			                <div class="dFjcE">
			                	<!-- 첨부파일 목록 -->
				                <div class="mb-3">
				                	<c:forEach items="${attachList }" var="attach">
				                		<div class="dFjcE">
				                			<!-- 파일 이름 클릭시 다운로드 -->
				                			<a href="${pageContext.request.contextPath}/filedownload?fileName=${attach.atchFileName}&fileOriName=${attach.atchOriginalName}&atchType=${attach.atchType}">
											    첨부파일 ${attach.atchOriginalName} (${attach.atchFancySize})
											</a>
				                		</div>
				                	</c:forEach>
				                </div>
			                </div>
			                
			                <div class ="dFjcE  marTB">
			                	<a class="me-2" href ="${pageContext.request.contextPath}/faqView">
			                		<button class="btn btn-secondary">돌아가기</button> 
			                	</a>
			                </div>
			                
			                <c:if test="${notice.userId == sessionScope.login.userId }">  
				                <div class ="dFjcE marTB">
				                	<form action="<c:url value="/noticeEditView" />" method="POST">
				                		<input type="hidden" value="${notice.noticeNo }" name="noticeNo">
				                		<button class="btn btn-warning me-2 marR" type="submit">수정</button>
				                	</form>
				                	<form action="<c:url value="/noticeDeleteDo" />" method="POST" id="deleteForm">
				                		<input type="hidden" value="${notice.noticeNo }" name="noticeNo">
				                		<button class="btn btn-danger me-2" type="button" id="deleteBtn">삭제</button>
				                	</form>
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
		
		if(v_btn && v_form) {
			v_btn.addEventListener("click", ()=>{
				if(confirm('정말로 삭제하시겠습니까?')){
					v_form.submit();
				}
			});
		}
		
	</script>
		
	
</body>
</html>