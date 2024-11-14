<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>저탄고집 개인회원 비밀번호 찾기 페이지</title>
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
			top: 32%;
			right: -5%;
			display: none;
		}
	

    </style>
</head>

<body>
	<!-- Preloader -->
	<div class="cover"></div>

    	<div class="header">
		<div class="container">
			<div class="logo">
				<a href="${pageContext.request.contextPath }/"> <img src="img/logo.png" alt="Logo">
				</a>
			</div>

			<!-- nav -->
			<%@ include file="/WEB-INF/inc/nav.jsp" %>

		</div>
	</div>
    
    <div class="custom-container">
        <div class="w-100" style="padding-bottom:3%;"><h1>개인회원 비밀번호 찾기</h3></div>
        
        <!-- 이메일 인증 on -->
		<div style="border:1px solid black;padding-top:10%;padding-bottom:5%;padding-left:8%;padding-right:8%;margin-bottom:5%;">
			<div class="mb-3"><h5 style="font-size:13px;font-weight:bolder;">이메일 인증으로 회원정보에 등록된 비밀번호를 찾을 수 있습니다.</h5></div>
			
			<div class="w-100" style="display:flex;flex-direction:column;position:relative;">
			  	<div class="spinner-border text-primary" role="status" id="emailSpinner">
					<span class="visually-hidden">Loading...</span>
				</div>
			
				<div class="d-flex w-100 mb-3" style="padding-right:10%;padding-left:1.5%;">
					<div style="width:10%;display:flex;justify-content:center;align-items:center;margin-right:5%;">
						<p style="color:#747474;">아이디</p>
					</div>
			        <div class="input-group mb-2">
			                <input type="text" class="form-control me-2" id="inputId" placeholder="아이디를 입력하세요">
			        </div>
				</div>
			
				<div class="d-flex w-100">
					<div style="width:10%;display:flex;justify-content:center;align-items:center;margin-right:5%;">
						<p style="color:#747474;">이메일</p>
					</div>
			        <div class="input-group mb-2">
			                <input type="email" class="form-control me-2" id="inputEmail" placeholder="이메일을 입력하세요">
			                <button class="btn btn-warning" type="button" id="emailAuthBtn">인증하기</button>
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
					<button class="btn btn-primary btn-lg" style="width:20%;" type="button" id="checkPwAuthBtn">인증확인</button>
				</div>
				
				<div class="w-100" id="pwInfoBox" style="font-size:14px;color:black;display:none;">
					<label for="inputPassword" class="form-label" style="font-weight:bolder;">비밀번호</label>
					<div>
						<input type="password" class="form-control mb-3" id="inputPassword">
					</div>
					
					<label for="checkPassword" class="form-label" style="font-weight:bolder;">비밀번호 확인</label>
					<div>
						<input type="password" class="form-control mb-3" id="checkPassword">
					</div>
		            <div class="d-flex mt-2">
		            	<label class="me-3" id="label2"></label>
		            </div>  
					
					<button class="btn btn-primary" type="button" id="changePwBtn" disabled>비밀번호 변경</button>
				</div>				
			</div>
		</div>        
		
		<div style="display:flex;flex-direction:column;background-color:#EEEEEE;padding-top:3%;padding-bottom:3%;padding-left:3%;">
			<div class="d-flex">
				<a class="btn btn-light me-3" href="${pageContext.request.contextPath }/loginView">로그인</a>
				<a class="btn btn-light me-3" href="${pageContext.request.contextPath }/findPersonalIdView">개인회원 아이디 찾기</a>
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
		$(document).ready(function() {
			let v_emailAuthBtn = document.getElementById('emailAuthBtn');
			
			v_emailAuthBtn.addEventListener('click', () => {
				let v_email = document.getElementById('inputEmail').value;

				if(v_email == "" || v_email.length == 0){
					alert('이메일을 입력해주세요!');
					
					return;
				}		  
				
				if(confirm('입력하신 이메일로 인증번호를 전송하시겠습니까?')){
					$("#checkPwAuthBtn").prop('disabled', false);
					$("#emailSpinner").css("display", "block");
					
					$.ajax({
						url: "${pageContext.request.contextPath}/findAccountConfirmEmail",
						data: {email: v_email},
						type: 'POST',
						dataType: 'json',
						success: function(result){
							console.log(result);
							if(result){
								alert('인증번호가 전송됐습니다. 이메일을 확인하세요.');
								$("#emailSpinner").css("display", "none");
							} else{
								$("#emailSpinner").css("display", "none");
								if(confirm('가입되지 않은 이메일입니다. 회원가입 페이지로 넘어가시겠습니까?')){
									location.href = "${pageContext.request.contextPath}/personalRegistView";
								}
							}
						},
						error: function(xhr, status, error){
							console.error('AJAX 에러 발생:', error);
							alert('인증 요청 중 오류가 발생했습니다.');
						}
					});
				}
			});
			
			
			let v_checkPwAuthBtn = document.getElementById('checkPwAuthBtn');
			
			v_checkPwAuthBtn.addEventListener('click', () => {
				let v_inputId = document.getElementById('inputId').value;
				let v_email = document.getElementById('inputEmail').value;
				let v_inputAuthNumber = document.getElementById('inputAuthNumber').value;
				
				if((v_inputId.length == 0 && v_inputId == "") || (v_email.length == 0 && v_email == "") || (v_inputAuthNumber.length == 0 && v_inputAuthNumber == "")){
					alert('빈칸을 채워주세요!');
					return;
				}
				
				$.ajax({
					url: '${pageContext.request.contextPath}/findPersonalPwDo',
					data: {
						id: v_inputId,
						email: v_email,
						authNumber: v_inputAuthNumber
					},
					type: 'POST',
					dataType: 'json',
					success: function(result){
						console.log(result);
						if(result.success){
							alert("인증이 완료됐습니다. 새로운 비밀번호를 입력해주세요!");
							$("#pwInfoBox").css("display", "block");
							$("#checkPwAuthBtn").prop('disabled', true);
							$("#emailAuthBtn").prop("disabled", true);
							$("#inputId").prop("disabled", true);
							$("#inputEmail").prop("disabled", true);
							$("#emailAuthBtn").prop("disabled", true);
							$("#inputAuthNumber").prop("disabled", true);
						} else{
							alert(result.warning);
						}
					},
					error: function(xhr, status, error){
						console.error('AJAX 에러 발생:', error);
						alert('인증 요청 중 오류가 발생했습니다.');
					}
				});
			});
			
			
			let v_changePwBtn = document.getElementById('changePwBtn');
			let pwOn = false;
			
			// 비밀번호 일치 여부 확인 함수
			function checkPasswordMatch() {
				let pw = $('#inputPassword').val();
				let rePw = $('#checkPassword').val();
				
				if(pw && rePw){
					if(pw === rePw){
						pwOn = true;
						$('#label2').text('비밀번호가 일치합니다.').css("color", "green").css("font-size", "13px");
					} else{
						pwOn = false;
						$('#label2').text('비밀번호가 일치하지 않습니다.').css('color', 'red').css("font-size", "13px");
					}
				} else{ // 입력중
					pwOn = false;
					$('#label2').text("");
				}
				toggleSignUpButton();
			}
			
			// 가입 버튼 활성화 상태 관리 함수
			function toggleSignUpButton() {
				if(pwOn){
					$("#changePwBtn").prop('disabled', false);
				} else {
					$("#changePwBtn").prop('disabled', true);
				}
			}
			
			$('#inputPassword, #checkPassword').on("input", checkPasswordMatch); // 비밀번호 focusout 이벤트
			
			
			v_changePwBtn.addEventListener('click', () => {	
				let v_email = document.getElementById('inputEmail').value;
				let v_password = document.getElementById('inputPassword').value;
				
				console.log(v_email);
				console.log(v_password);
				
				$.ajax({
					url: "${pageContext.request.contextPath}/changeUserPw",
					data: {
						email: v_email,
						password: v_password
					},
					type: 'POST',
					dataType: 'json',
					success: function(result){
						console.log(result);
						if(result.success){
							alert("비밀번호가 성공적으로 변경됐습니다!");
							location.href = "${pageContext.request.contextPath}/loginView";
						} else{
							alert(result.warning);
						}
					},
					error: function(xhr, status, error){
						console.error('AJAX 에러 발생:', error);
						alert('인증 요청 중 오류가 발생했습니다.');
					}
				});
			});
		});
	</script>
</body>

</html>