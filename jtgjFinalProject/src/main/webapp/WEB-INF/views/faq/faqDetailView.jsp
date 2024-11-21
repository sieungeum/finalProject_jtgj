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
            <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">건의사항 상세</h2>
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
				                	<h2> ${faq.faqTitle }</h2>
				                </div>
				                <div class="jE maxW ">
				                    <h6 class="dFjcE">작성자 :  ${faq.userName }</h6>
				                    <h6 class="dFjcE">${faq.faqDate }</h6>
				                </div>
	            			</div>
			                
			                <div class="faq-body minH">
			                	<!-- <pre>${faq.faqContent }</pre> -->
			                	${faq.faqContent} 
			                </div>
			                
			                <div class="dFjcE">
			                	<div class="mb-3">
					                	<c:forEach items="${attachList }" var="attach">
					                		<div class="dFjcE">
					                			<!-- 파일 이름 클릭시 다운로드 -->
								                <!-- 첨부파일 목록 -->
					                			<a href="${pageContext.request.contextPath}/filedownload?fileName=${attach.atchFileName}&fileOriName=${attach.atchOriginalName}&atchType=${attach.atchType}">
												    첨부파일 ${attach.atchOriginalName} (${attach.atchFancySize})
												</a>
					                		</div>
					                	</c:forEach>
					                </div>
			                </div>               
			                
			                <div class ="dFjcE marTB">
			                	<a class="me-2" href ="${pageContext.request.contextPath}/faqView">
			                		<button class="btn btn-secondary">돌아가기</button> 
			                	</a>
			                </div>
			                <c:if test="${faq.userId == sessionScope.login.userId }">  
				                <div class ="dFjcE marTB">
				                	<form action="<c:url value="/faqEditView" />" method="POST">
				                		<input type="hidden" value="${faq.faqNo }" name="faqNo">
				                		<button class="btn btn-warning me-2 marR" type="submit">수정</button>
				                	</form>
				                	<form action="<c:url value="/faqDeleteDo" />" method="POST" id="deleteForm">
				                		<input type="hidden" value="${faq.faqNo }" name="faqNo">
				                		<button class="btn btn-danger me-2" type="button" id="deleteBtn">삭제</button>
				                	</form>
				                	
				                </div>
			                </c:if>
	            		</div>
	            	</div>
	            	
	            	<!-- 댓글 목록 -->
	            	<div class="dFjcC">
	            		<div class="col-lg-8 col-xl-7">
	            			<table class="table">
	            				<tbody id="comBody">
	            					<c:forEach items="${comList }" var="com">
	            						<tr id="${com.comNo }">
	            							<td>
	            								<c:choose>
					                                <%-- 비밀 댓글 ('S') 처리 --%>
					                                <c:when test="${com.comSicYn == 'S'}">
					                                    <c:choose>
					                                        <%-- 작성자 본인 또는 관리자('Y', 'K')만 볼 수 있음 --%>
					                                        <c:when test="${com.userId == sessionScope.login.userId || sessionScope.login.userRank == 'Y' || sessionScope.login.userRank == 'K' || faq.userId == sessionScope.login.userId}">
					                                            ${com.comContent} <span class="text-muted">(비밀 댓글입니다.)</span>
					                                        </c:when>
					                                        <%-- 그 외의 사용자에게는 비밀 댓글 메시지만 표시 --%>
					                                        <c:otherwise>
					                                            비밀 댓글입니다.
					                                        </c:otherwise>
					                                    </c:choose>
					                                </c:when>
					                                <%-- 공개 댓글 ('Y') --%>
					                                <c:otherwise>
					                                    ${com.comContent}
					                                </c:otherwise>
					                            </c:choose>
	            							</td>
	            							<td>${com.userName }</td>
	            							<td>${com.comDate }</td>
	            							<c:if test="${com.userId == sessionScope.login.userId }">
	            								<td><a onclick="f_del(this)">X</a></td>
	            							</c:if>
	            						</tr>
	            					</c:forEach>
	            				</tbody>
	            			</table>
	            		</div>
	            	</div>
	            	
	            	<!-- 댓글 작성 영역 -->
	            	<c:if test="${faq.userId == sessionScope.login.userId || sessionScope.login.userRank == 'Y' || sessionScope.login.userRank == 'K' }">
		            	<div class="dFjcC">
		            		<div class="col-lg-9 ">
		            			<form class="row" id="comForm" action="<c:url value="/writeComDo" />" method="POST">
		            				<div class="col-lg-9">
			            				<input class="form-control" type="text" id="comInput" name="comContent">
			            				<input type="hidden" name="userId" value="${sessionScope.login.userId }">
			            				<input type="hidden" name="faqNo" value="${faq.faqNo }">
			            				<div class="form-check">
								            <input class="form-check-input" type="checkbox" id="comSicYn" name="comSicYn" value="S">
								            <label class="form-check-label" for="comSicYn">비밀 댓글</label>
								        </div>
								        <input type="hidden" id="isUserLoggedIn" value="${sessionScope.login != null ? 'true' : 'false'}">
		            				</div>
		            				<div class="col-lg-1">
		            					<button class="btn btn-primary me-2 height50" type="button" id="comBtn">등록</button>
		            				</div>
		            			</form>
		            		</div>
		            	</div>
	            	</c:if>
	            	
	            </div>
            </section>
            
        </div>
    </section>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp" %>
	
	<script type="text/javascript">
		const v_btn = document.getElementById("deleteBtn");
		const v_form = document.getElementById("deleteForm");
		
		const v_comBtn = document.getElementById("comBtn");
		const v_comForm = document.getElementById("comForm");
		
		if(v_btn && v_form) {
			v_btn.addEventListener("click", ()=>{
				if(confirm('정말로 삭제하시겠습니까?')){
					v_form.submit();
				}
			});
		}
		
		if (v_comBtn && v_comForm){
			
			v_comBtn.addEventListener("click", ()=>{
				
				// 로그인 여부 확인
			    const isUserLoggedIn = document.getElementById("isUserLoggedIn").value;
			    if (isUserLoggedIn === 'false') {
			        alert("댓글을 등록하려면 로그인이 필요합니다.");
			        return;
			    }
				
				let v_comForm = $('#comForm');
				let v_url = v_comForm.attr('action');
				let v_formData = v_comForm.serialize();
				
				$.ajax({
					type: 'POST',
					url: v_url,
					data: v_formData,
					success: function(data){
						console.log(data);
						
						let v_tr = document.createElement("tr");
						v_tr.id  = data.comNo;
						
						let tdContent = document.createElement("td");
	
			            // 비밀 댓글 여부에 따라 내용 표시
			            if (data.comSicYn == 'S') {
			                tdContent.innerHTML = data.comContent + "(비밀 댓글입니다.)";
			            } else {
			                tdContent.innerHTML = data.comContent;
			            }
			            v_tr.appendChild(tdContent);
						
						let tdUserName = document.createElement("td");
						tdUserName.innerHTML = data.userName;
						v_tr.appendChild(tdUserName);
						
						let tdDate = document.createElement("td");
						tdDate.innerHTML = data.comDate;
						v_tr.appendChild(tdDate);
						
						let tdDel = document.createElement("td");
						tdDel.innerHTML = "<a onclick='f_del(this)'>X</a>";
						v_tr.appendChild(tdDel);
						
						document.getElementById("comBody").append(v_tr);
						document.getElementById("comInput").value = "";
						
					}
				});
			});
		}
		
		function f_del(p_this) {
			if(!confirm("댓글을 삭제하시겠습니까?")){
				return;
			}
			
			let v_td = p_this.parentElement;
			let v_tr = v_td.parentElement;
			let v_comNo = v_tr.id;
			
			const v_ajax = new XMLHttpRequest();
			
			v_ajax.open('POST', '<c:url value="/delComDo" />');
			
			v_ajax.setRequestHeader("Content-Type", "application/json");
			
			const v_data = {
					'comNo' : v_comNo
			};
			
			v_ajax.onload = () => {
				if(v_ajax.status == 200) {
					console.log(v_ajax.response);
					
					if(v_ajax.response == 'success'){
						document.getElementById(v_comNo).remove();
					}
				}
			};
			
			v_ajax.send(JSON.stringify(v_data));
			
		}
		
	</script>
		
	
</body>
</html>