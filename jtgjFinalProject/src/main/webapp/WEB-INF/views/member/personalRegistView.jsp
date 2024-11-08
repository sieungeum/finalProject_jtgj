<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>저탄고집 개인회원 가입</title>
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
            background-color: #FFFFFF;
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            padding-left: 40%;
            padding-right: 40%;
        }
        
        .profile-box{
        	border-radius: 100%;
        	overflow: hidden;
        	
        }
        
        .profile-img{
        	width: 100%;
        	height: 300px;
        	cursor: pointer;
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
        <div class="mb-4" style="text-align:center;"><h4 style="display:inline;">저탄고집 개인회원 가입</h4></div>

		<form action="${pageContext.request.contextPath }/personalRegistDo" method="POST">
	       
	        <div class="mb-3">
	            <label for="inputId" class="form-label" style="font-weight:bolder;">아이디</label>
	            <div class="input-group d-flex">
	                <input type="text" class="form-control" id="inputId" placeholder="아이디를 입력하세요" name="userId">
	            </div>
	            
	            <div class="d-flex mt-2">
	            	<label class="me-3" id="label1"></label>
	            </div>  
	        </div>
	
	        <div class="mb-3">
	            <label for="inputPassword" class="form-label" style="font-weight:bolder;">비밀번호</label>
	            <div class="input-group mb-3">
	                <input type="password" class="form-control" id="inputPassword" placeholder="비밀번호를 입력하세요" name="userPw">
	            </div>
	            <label for="checkPassword" class="form-label" style="font-weight:bolder;">비밀번호 확인</label>
	            <div class="input-group">
	                <input type="password" class="form-control" id="checkPassword" placeholder="비밀번호를 입력하세요">
	            </div>
	            
	            <div class="d-flex mt-2">
	            	<label class="me-3" id="label2"></label>
	            </div>  
	        </div>
	        
	        <div class="mb-3">
	            <label for="inputName" class="form-label" style="font-weight:bolder;">닉네임</label>
	            <div class="input-group">
	                <input type="text" class="form-control" id="inputName" placeholder="닉네임을 입력하세요" name="userName">
	            </div>
	            
	            <div class="d-flex mt-2">
	            	<label class="me-3" id="label3"></label>
	            </div>  
	        </div>
	
	        <div class="mb-3">
	            <label for="inputEmail" class="form-label" style="font-weight:bolder;">이메일</label>
	            <div class="input-group mb-2">
	                <input type="email" class="form-control me-2" id="inputEmail" placeholder="이메일을 입력하세요" name="userEmail">
	                <button class="btn btn-warning" type="button" id="emailAuthBtn">인증하기</button>
	            </div>
	            <div class="input-group" style="display:none;" id="auth-box">
	            	<input type="text" class="form-control me-2" id="inputAuthEmail" placeholder="인증번호를 입력하세요">
	            	<div class="me-2"><button class="btn btn-warning h-100" type="button" id="checkAuthEmail">인증확인</button></div>
	            	<button class="btn btn-warning" type="button" id="reCheckAuthEmail">재인증</button>
	            </div>
	        </div>
	        
	        <div class="mb-3">
	            <label for="inputPhone" class="form-label" style="font-weight:bolder;">휴대폰</label>
	            <div class="input-group">
	                <input type="text" class="form-control" id="inputPhone" placeholder="휴대폰 번호를 입력하세요" name="userPhone">
	            </div>
	        </div>
	
	        <div class="mt-5">
	            <button class="btn btn-primary btn-lg w-100" id="signUpBtn" type="submit" disabled>가입하기</button>
	            <p id="signUpWarning" style="font-size:13px;color:red;font-weight:bolder;">아이디, 비밀번호, 이름의 중복여부를 확인해주세요!</p>
	        </div>		
		</form>

    </div>

	<%@ include file="/WEB-INF/inc/footer.jsp" %>
	
	<script type="text/javascript">
		// 이메일 인증
		let v_emailAuthBtn = document.getElementById('emailAuthBtn');
		
		v_emailAuthBtn.addEventListener('click', () => {
			if(confirm('인증번호를 보내시겠습니까?')){
				let email = document.getElementById('inputEmail').value;

  				$.ajax({
					url : '${pageContext.request.contextPath}/ConfirmEmail',
					data : {
						email : email
					},
					type : 'POST',
					dataType : 'json',
					success : function(result){
						if(result == true){
							alert("이메일이 성공적으로 전송됐습니다!");
							
							document.getElementById('auth-box').style.display = "";
							v_emailAuthBtn.disabled = "false";
							
							// 인증번호 확인 함수?
						}
					}
				});  
			}
		});
		
		
		// 이메일 인증번호 확인
		let v_checkAuthEmail = document.getElementById('checkAuthEmail');
		v_checkAuthEmail.addEventListener('click', () => {
			let v_inputAuthEmail = document.getElementById('inputAuthEmail').value;
			
			$.ajax({
				url : '${pageContext.request.contextPath}/ReConfirmEmail',
				data : {
					number : v_inputAuthEmail
				},
				type : 'POST',
				dataType : 'json',
				success : function(result){
					if(result == true){
						alert('인증번호가 일치합니다!');
					} else{
						alert('인증번호가 틀립니다!');
					}
				}
			});
		});
		
	
		
		$(document).ready(function() {
			let idOn = false; // 아이디 중복 체크 여부
			let pwOn = false; // 비밀번호 일치 여부
			let nameOn = false; // 닉네임 중복 체크 여부
			let v_signUpBtn = $('#signUpBtn'); // 가입하기 버튼
			let v_warning = $('#signUpWarning'); // 가입안내문구
			
			// 아이디 중복 체크 함수
			function checkIdDuplicate() {
				let id = $('#inputId').val();
				
				if(id == "" || id.length == 0){
					$("#label1").css('color', "red").css('font-size', '13px').text('공백은 ID로 사용할 수 없습니다.');
					idOn = false;
					return false;
				}
				
				// ajax 전송
				$.ajax({
					url : '${pageContext.request.contextPath}/ConfirmId',
					data : {
						id: id
					},
					type : 'POST',
					dataType : 'json',
					success : function(result) {
						if(result == true){
							idOn = true;
							$("#label1").css("color", "green").css("font-size", "13px").text("사용 가능한 ID 입니다.");
						} else{
							idOn = false;
							$("#label1").css("color", "red").css("font-size", "13px").text("사용 불가능한 ID 입니다.");
							$("#inputId").val('');
						}
						toggleSignUpButton(); // 가입 버튼 활성화 상태 갱신
					}
				});
			}
			
			// 닉네임 중복 체크 함수
			function checkNameDuplicate(){
				let name = $("#inputName").val();
				
				if(name == "" || name.length == 0){
					$("#label3").css('color', 'red').css('font-size', '13px').text('공백은 닉네임으로 사용할 수 없습니다.');
					nameOn = false;
					return false;
				}
				
				$.ajax({
					url : '${pageContext.request.contextPath}/ConfirmName',
					data : {
						name : name
					},
					type : "POST",
					dataType : 'json',
					success : function(result){
						if(result == true){
							nameOn = true;
							$("#label3").css('color', 'green').css('font-size', '13px').text('사용 가능한 닉네임입니다!');
						} else {
							nameOn = false;
							$('#label3').css('color', 'red').css('font-size', '13px').text('사용 불가능한 닉네임입니다!');
							$('#inputName').val("");
						}
						toggleSignUpButton();
					}
				});
			}
			
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
				toggleSignUpButton(); // 가입 버튼 활성화 갱신 상태
			}
			
			// 가입 버튼 활성화 상태 관리 함수
			function toggleSignUpButton() {
				if(idOn && pwOn && nameOn){
					v_signUpBtn.prop('disabled', false);
					v_warning[0]['attributes']['style']['value'] = "font-size:13px;color:red;font-weight:bolder;display:none;"
				} else {
					v_signUpBtn.prop('disabled', true);
					v_warning[0]['attributes']['style']['value'] = "font-size:13px;color:red;font-weight:bolder;display:'';"
				}
			}
			
			// 이벤트 리스너 설정
			$('#inputId').on("focusout", checkIdDuplicate); // 아이디 focusout 이벤트
			$('#inputName').on("focusout", checkNameDuplicate); // 닉네임 focusout 이벤트
			$('#inputPassword, #checkPassword').on("input", checkPasswordMatch); // 비밀번호 focusout 이벤트
			
			// 초기 버튼 상태 설정
			toggleSignUpButton();
		});
		
	</script>
</body>

</html>