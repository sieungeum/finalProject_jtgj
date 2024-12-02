<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>저탄고집 기업회원 비밀번호 찾기 페이지</title>
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
			top: 48%;
			right: -5%;
			display: none;
		}
		
		#regiNumSpinner{
			position: absolute;
			top: 28%;
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
				
   			  	<div class="spinner-border text-primary" role="status" id="regiNumSpinner">
					<span class="visually-hidden">Loading...</span>
				</div>   
			
				<div class="d-flex w-100 mb-3" style="padding-right:10%;padding-left:0.5%;">
					<div style="width:10%;display:flex;justify-content:center;align-items:center;margin-right:6%;">
						<p style="color:#747474;">아이디</p>
					</div>
			        <div class="input-group mb-2">
			                <input type="text" class="form-control me-2" id="inputId" placeholder="아이디를 입력하세요">
			        </div>
				</div>
				
				<div class="d-flex w-100 mb-3">
					<div style="width:10%;display:flex;justify-content:center;align-items:center;margin-right:4%;">
						<p style="color:#747474;font-size:10px;text-align:center;">사업자등록번호</p>
					</div>
			        <div class="input-group mb-2" style="display:flex;align-items:center;width:90%;height:58px;">
			                <div class="h-100 d-flex justify-content-center align-items-center me-2" style="width:87.5%; border:1px solid #DDDDDD;">
			                	<input type="file" class="me-2" id="inputFile" placeholder="사업자등록증명원을 첨부해주세요!">
			                </div>
			                <div class="h-100" style="width:11.5%;">
			                	<button class="btn btn-warning h-100" type="button" id="submitFile" onclick="sendFileToOCR()">인증하기</button>
			                </div>			                     	
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
				        <div class="input-group mb-2" style="width:80%;padding-left:3.7%;">
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
				<a class="btn btn-light me-3" href="${pageContext.request.contextPath }/findCorporationIdView">기업회원 아이디 찾기</a>
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
		let regiNum;	
	
		/* 사업자등록번호 인증 */
		
		// 사업자등록번호 중복체크 함수
		function regiNumDuplicateCheck(regiNum, callback){
			/*
				result가 false면 DB 안에 OCR에서 추출한 등록번호로 가입된 회원이 존재 -> 비밀번호 찾기 가능
				result가 true면 DB 안에 OCR에서 추출한 등록번호로 가입된 회원이 존재하지 않음 -> 비밀번호 찾기 불가	
			*/
			
			console.log(regiNum);
			
			$.ajax({
				url: '${pageContext.request.contextPath}/regiNumDuplicateCheck',
				type: "POST",
				data: {
					regiNum: regiNum
				},
				dataType: 'json',
				accept: "application/json",
				success: function(result){
					console.log(result);
					if(result === true){
						console.log('가입되지 않은 회원');
						alert('해당 사업자등록번호로 가입된 회원 정보가 없습니다!');
						$("#regiNumSpinner").css("display", "none");
						
						callback(true);
					} else{
						callback(false);
					}
				},
				error: function(xhr, status, error){
					console.error('AJAX 에러 발생:', error);
					alert('인증 요청 중 오류가 발생했습니다.');
					callback(false);
				}
			});
		}
		
		// 사업자등록번호 버튼 클릭(가장 처음 실행)
		function sendFileToOCR(){
			if(confirm("해당 파일로 제출하시겠습니까??")){
				
				let v_inputFile = document.getElementById('inputFile');
				let v_file = v_inputFile.files[0];
				$("#regiNumSpinner").css("display", "block");
				
				if(!v_file){
					alert('파일을 첨부해주세요!');
					$("#regiNumSpinner").css("display", "none");
					
					return;
				}
				
				let formData = new FormData();
				formData.append("file", v_file);
				
				// Python 서버로 파일을 전송하는 AJAX 요청
				fetch("http://192.168.0.143:5000/ocr", {
					method: "POST",
					body: formData
				})
				.then(response => response.json())
				.then(data => {
					if(data.business_registration_number){
						regiNum = data.business_registration_number.replace(/-/g, '');	
						console.log(regiNum);
						
						// 사업자 등록번호 중복 체크
						regiNumDuplicateCheck(regiNum, function(isUnique){
							if(isUnique){
								console.log('가입되지 않은 회원');
								$("#regiNumSpinner").css("display", "none");
								
								return;
							}
		
							console.log('가입된 회원');
							$("#regiNumSpinner").css("display", "none");
							alert('사업자등록번호가 확인됐습니다!');
							$("#submitFile").css("display", "block").prop('disabled', true);
							$("#inputFile").prop('disabled', true);
						});

					} else{
						alert("알 수 없는 오류가 발생했습니다. 고객센터에 문의해주세요!");
						$("#regiNumSpinner").css("display", "none");
					}
				})
				.catch(error => {
					console.error("Error", error);
					$("#regiNumSpinner").css("display", "none");
					alert('올바른 형식의 파일이 아닙니다. 다른 파일을 업로드해주십시오.');
				});
			}
		}
		
		
		// 이메일 인증
		let v_emailAuthBtn = document.getElementById('emailAuthBtn');
		let v_userAccount = 'C';
		
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
					data: {
						email: v_email
						, account: v_userAccount
					},
					type: 'POST',
					dataType: 'json',
					success: function(result){
						console.log(result);
						if(result.success == true){
							alert('인증번호가 전송됐습니다. 이메일을 확인하세요.');
							$("#emailSpinner").css("display", "none");
						} else{
							$("#emailSpinner").css("display", "none");
							if(confirm(result.warning + ' 회원가입 페이지로 넘어가시겠습니까?')){
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
		
		// 인증확인 버튼 꾹
		let v_checkPwAuthBtn = document.getElementById('checkPwAuthBtn');
		
		v_checkPwAuthBtn.addEventListener('click', () => {
			let v_inputId = document.getElementById('inputId').value;
			let v_email = document.getElementById('inputEmail').value;
			let v_inputAuthNumber = document.getElementById('inputAuthNumber').value;
			
			if((v_inputId.length == 0 && v_inputId == "") || (v_email.length == 0 && v_email == "") || (v_inputAuthNumber.length == 0 && v_inputAuthNumber == "")){
				alert('빈칸을 채워주세요!');
				return;
			}
			
			if(!regiNum){
				alert('사업자 등록번호를 인증받으세요!');
				return;
			}
			
			$.ajax({
				url: '${pageContext.request.contextPath}/findCompanyPwDo',
				data: {
					id: v_inputId,
					email: v_email,
					authNumber: v_inputAuthNumber,
					regiNum: regiNum
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
		let pwValOn = false; // 비밀번호 유효성 체크
		
		// 비밀번호 유효성 검사
		function checkPasswordValidation(){
			let pw = $('#inputPassword').val();
			
			// 유효성 검사
			// ajax 전송
			$.ajax({
				url : '${pageContext.request.contextPath}/pwValidation',
				type : 'POST',
				contentType: 'application/json',
				data: JSON.stringify({userPw:pw}),
				contentType: 'application/json; charset=UTF-8', 
				dataType: 'json',
				success : function(result) {
					console.log(result);
					
					if(result.success){
						pwValOn = true;
						$("#label2").css("color", "green").css("font-size", "12px").text(result.msg);
					} else{
						pwValOn = false;
						$("#label2").css("color", "red").css("font-size", "12px").text(result.msg);
					}
				},
				error:function(xhr){
					console.log(xhr);
					pwValOn = false;
					alert(xhr);
				},
			});
		}
		
		// 비밀번호 일치 여부 확인 함수
		function checkPasswordMatch() {
			let pw = $('#inputPassword').val();
			let rePw = $('#checkPassword').val();
			
			if(!pwValOn){
				return;
			}
			
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
		
		$("#inputPassword").on('focusout', checkPasswordValidation); // 비밀번호 유효성 검사 focusout
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
		
	</script>
</body>

</html>