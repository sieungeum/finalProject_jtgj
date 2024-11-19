<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>저탄고집 기업회원 아이디 찾기 페이지</title>
    <%@ include file="/WEB-INF/inc/header.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        a {
		 	text-decoration-line: none;
		}    
    
        html,
        body {
            background-color: #FFFFFF;
            -webkit-user-select:none;
            -moz-user-select:none;
            -ms-user-select:none;
            user-select:none
        }

        .custom-container{
            width: 100%;
            height: 50%;
            background-color: #FFFFFF;
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            padding-left: 30%;
            padding-right: 30%;
            margin-top: 2%;
        }
        
        .find-id-btn{
        	cursor:pointer;
        }

		.find-id-btn:hover{
			background-color:grey;
			color:white;
		}
	
		#emailSpinner{
			position: absolute;
			top: 37%;
			right: 4%;
			display: none;
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
    
    <div class="custom-container">
        <div class="w-100" style="padding-bottom:3%;"><h1>기업회원 아이디 찾기</h3></div>
        
        <!-- 이메일 인증 on -->
		<div style="border:1px solid black;padding-top:10%;padding-bottom:5%;padding-left:8%;padding-right:8%;margin-bottom:5%;position:relative;">
		  	<div class="spinner-border text-primary" role="status" id="emailSpinner">
				<span class="visually-hidden">Loading...</span>
			</div>
		
			<div class="mb-3"><h5 style="font-size:13px;font-weight:bolder;">이메일 인증으로 회원정보에 등록된 아이디를 찾을 수 있습니다.</h5></div>
			
			<div class="w-100" style="display:flex;flex-direction:column;">
				<div class="d-flex w-100">
					<div style="width:10%;display:flex;justify-content:center;align-items:center;">
						<p style="color:#747474;text-align:center;">이메일</p>
					</div>
			        <div class="input-group mb-2" style="padding-left:4.5%;">
			                <input type="email" class="form-control me-2" id="inputEmail" placeholder="이메일을 입력하세요" name="userEmail">
			                <button class="btn btn-warning" type="button" id="emailAuthBtn">인증하기</button>		                
			        </div>				     
				</div>
			</div>
			
			<div class="w-100" style="display:flex;flex-direction:column;margin-top:2%;">
				<div class="d-flex w-100">
					<div style="width:10%;display:flex;justify-content:center;align-items:center;">
						<p style="color:#747474;">인증번호</p>
					</div>
			        <div class="input-group mb-2" style="width:80%;padding-left:3.6%;">
			                <input type="text" class="form-control me-2" id="inputAuthNumber">
			        </div>
				</div>
			</div>
			
			<div style="display:flex;justify-content:center;align-items:center;margin-top:2%;margin-bottom:2%;">
				<button class="btn btn-primary btn-lg" style="width:20%;" type="button" id="checkIdAuthBtn">인증확인</button>
			</div>
		</div>        
 

		
		<div style="display:flex;flex-direction:column;background-color:#EEEEEE;padding-top:3%;padding-bottom:3%;padding-left:3%;">
			<div class="d-flex">
				<a class="btn btn-light me-3" href="${pageContext.request.contextPath }/loginView">로그인</a>
				<a class="btn btn-light me-3" href="${pageContext.request.contextPath }/findCorporationPwView">기업회원 비밀번호 찾기</a>
				<a class="btn btn-light me-3" href="${pageContext.request.contextPath }/findAccountView">회원가입</a>
				<a class="btn btn-light me-3" href="${pageContext.request.contextPath }/faqView">건의사항</a>
			</div>
				
			<div class="mt-3">
				<p style="color:black;font-size:13px;">위 방법으로 계정을 찾을 수 없다면, 저탄고집 고객센터로 직접 문의 주시기 바랍니다.</p>
			</div>
		</div>
    </div>

	<%@ include file="/WEB-INF/inc/footer.jsp" %>
	
	<script type="text/javascript">
	
		// 기업 인증
		$(document).ready(function() {
			let v_emailAuthBtn = document.getElementById('emailAuthBtn');
			let v_checkIdAuthBtn = document.getElementById('checkIdAuthBtn');
			let v_userAccount = "C";
			
		    v_emailAuthBtn.addEventListener("click", () => {

		        let v_email = document.getElementById('inputEmail').value;
		    	
				if(v_email == "" || v_email.length == 0){
					alert('이메일을 입력해주세요!');
					
					return;
				}		        
		        
		        if (confirm('입력하신 이메일로 인증번호를 전송하시겠습니까?')) {
		            console.log(v_email);

		            $("#emailSpinner").css("display", "block");
		            
		            $.ajax({
		                url: '${pageContext.request.contextPath}/findAccountConfirmEmail',
		                data: { 
		                	email: v_email 
		                	, account: v_userAccount
		                },
		                type: 'POST',
		                dataType: 'json',
		                success: function(result) {
		                    console.log(result);
		                    if (result.success) {
		                        alert('인증번호가 전송되었습니다. 이메일을 확인하세요.');
		                        $("#emailSpinner").css("display", "none");
		                    } else {
		                    	$("#emailSpinner").css("display", "none");
		                    	
		                        if(confirm(result.warning + " 회원가입 페이지로 넘어가시겠습니까?")){
		                        	location.href = "${pageContext.request.contextPath}/personalRegistView";
		                        }
		                    }
		                },
		                error: function(xhr, status, error) {
		                    console.error("AJAX 에러 발생:", error);
		                    alert('인증 요청 중 오류가 발생했습니다.');
		                }
		            });
		        }
		    });
		    
		    // 분실 아이디 메일 보내는 함수
		    function sendLostId(id, email){
		    	console.log('아이디 메일로 보내기');
		    	$("#emailSpinner").css("display", "block");
		    	
		    	$.ajax({
		    	    url: '${pageContext.request.contextPath}/sendLostId',
		    	    data: {
		    	        id: id,
		    	        email: email
		    	    },
		    	    type: "POST",
		    	    success: function() {
		    	        console.log('성공적인 전송');
		    	        $("#emailSpinner").css("display", "none");
		    	        alert('성공적으로 아이디가 전송됐습니다! 메일을 확인해주세요!');
		    	        location.href = "${pageContext.request.contextPath}/loginView";
		    	    },
		    	    error: function(xhr, status, error) {
		    	        console.error("AJAX 에러 발생:", error);
		    	        alert('인증 요청 중 오류가 발생했습니다.');
		    	    }
		    	});
		    }
		    
		    
		    v_checkIdAuthBtn.addEventListener('click', () => {
		    	let v_inputAuthNumber = document.getElementById('inputAuthNumber').value;
		        let v_email = document.getElementById('inputEmail').value;
		        
				if(v_email == "" || v_email.length == 0){
					alert('이메일을 입력해주세요!');
					
					return;
				}
		    	
	            $.ajax({
	                url: '${pageContext.request.contextPath}/findIdDo',
	                data: { 
	                	authNumber: v_inputAuthNumber, 	
						email: v_email                				
	                },
	                type: 'POST',
	                dataType: 'json',
	                success: function(result) {
	                    console.log(result);
	                    if (result.success) {
	                        alert('인증됐습니다! 아이디를 메일로 보내겠습니다..');
	                        $('#checkIdAuthBtn').prop('disabled', true);
	                        
	                        // 메일 보내는 함수 작성
	                        sendLostId(result.userId, v_email);
	                    } else {
	                        alert(result.warning);
	                    }
	                },
	                error: function(xhr, status, error) {
	                    console.error("AJAX 에러 발생:", error);
	                    alert('인증 요청 중 오류가 발생했습니다.');
	                }
	            });
		    });
		    
		});
		
	
	</script>
</body>

</html>