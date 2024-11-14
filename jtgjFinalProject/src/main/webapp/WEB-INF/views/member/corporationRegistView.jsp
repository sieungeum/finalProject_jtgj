<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>저탄고집 기업회원 가입</title>
    <%@ include file="/WEB-INF/inc/header.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <style>
        *{
            margin: 0;
            padding: 0;
        }
        
        a {
		 	text-decoration-line: none;
		}        

        html,
        body {
            width: 100%;
            height: 100%;
            background-color: #FFFFFF;
            -webkit-user-select:none;
            -moz-user-select:none;
            -ms-user-select:none;
            user-select:none;
            margin: auto;
        }

        .custom-container{
        	width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .container-box{
        	width: 30%;
        	display: flex;
        	flex-direction: column;
        }
        
        #loadingBtn{
        	display: none;
        }
        
        #moreInfoBox{
        	display: none;
        }

		#emailSpinner{
			display: none;
			position: absolute;
			top: 50%;
			right: -5%;
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
    	<div class="container-box">
	        <div class="mb-4" style="text-align:center;">
	        	<h4>저탄고집 기업회원 가입</h4>
	        </div>
	
			<div class="mb-3">
	            <div class="input-group">
	                <label for="inputFile" class="form-label" style="font-weight:bolder;">기업 인증(사업자등록증명원을 첨부해주세요!)</label>
	                <div class="input-group">
	                    <input type="file" class="form-control me-3" id="inputFile" aria-describedby="inputGroupFileAddon04">
	                	<button class="btn btn-primary" id="submitFile" onclick="sendFileToOCR()")>사업자 등록인증</button>
						<button class="btn btn-primary" type="button" id="loadingBtn" disabled>
							<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
							Loading...
						</button>
	                </div>
	            </div>
	        </div>
	        
			<div id="moreInfoBox">
		        <div class="mb-3">
		            <label for="inputCorName" class="form-label" style="font-weight:bolder;">기업명</label>
		            <div class="input-group">
		                <input type="text" class="form-control" id="inputCorName" placeholder="기업명 입력(사업자등록증명원 기업명)">
		            </div>
		        </div>
		
		        <div class="mb-3">
		            <label for="inputCEO" class="form-label" style="font-weight:bolder;">대표자</label>
		            <div class="input-group">
		                <input type="text" class="form-control" id="inputCEO" placeholder="예시) 이재완 외 1명 (사업자등록증명원 대표자명)">
		            </div>
		        </div>
		
		        <div class="mb-3">
		            <label for="inputAddress" class="form-label" style="font-weight:bolder;">회사 주소</label>
		            <div class="input-group mb-1">
		            	<input type="text" class="form-control d-block" id="inputAddress" placeholder="클릭하시면 주소검색 창이 뜹니다." onclick="DaumPostCode()">
		            </div>
		            <div class="input-group" id="addressBox">
		            	<input type="text" class="form-control d-block me-2" style="width:18%;" id="zipCode" placeholder="우편번호" disabled>
		                <input type="text" class="form-control me-2" style="width:48%;" id="detailAddress" placeholder="상세주소">
		                <input type="text" class="form-control" style="width:30%;" id="extraAddress" placeholder="참고항목" disabled>
		            </div>
		        </div>
		
		        <div class="mb-3">
		            <label for="inputDate" class="form-label" style="font-weight:bolder;">개업일</label>
		            <div class="input-group">
		                <input type="date" class="form-control" id="inputDate">
		            </div>
		        </div>
		
		        <div class="mb-3">
		            <label for="inputLogin" class="form-label" style="font-weight:bolder;">아이디</label>
		            <div class="input-group d-flex">
		                <input type="text" class="form-control" id="inputId" placeholder="아이디를 입력하세요">
		            </div>
		            
		            <div class="d-flex mt-2">
		            	<label class="me-3" id="label1"></label>
		            </div>  		            
		        </div>
		
		        <div class="mb-3">
		            <label for="inputPassword" class="form-label" style="font-weight:bolder;">비밀번호</label>
		            <div class="input-group mb-3">
		                <input type="password" class="form-control" id="inputPassword" placeholder="비밀번호를 입력하세요">
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
		            <label for="inputPhone" class="form-label" style="font-weight:bolder;">휴대폰 번호</label>
		            <div class="input-group">
		                <input type="text" class="form-control" id="inputPhone" placeholder="휴대폰 번호를 입력하세요">
		            </div>
		        </div>
		
		        <div class="mb-3" style="position:relative;">
		            <label for="inputEmail" class="form-label" style="font-weight:bolder;">이메일</label>
		            <div class="input-group mb-2">
		                <input type="email" class="form-control me-2" id="inputEmail" placeholder="이메일을 입력하세요">
		                <button class="btn btn-warning" type="button" id="emailAuthBtn">인증하기</button>		 
		            </div>
	    	        <div class="spinner-border text-primary" role="status" id="emailSpinner">
						<span class="visually-hidden">Loading...</span>
					</div>	
		            <div class="input-group" id="auth-box" style="display:none;">
		            	<input type="text" class="form-control me-2" id="inputAuthEmail" placeholder="인증번호를 입력하세요">
		            	<div class="me-2"><button class="btn btn-warning h-100" type="button" id="checkAuthEmail">인증확인</button></div>
		            	<button class="btn btn-warning" type="button" id="reCheckAuthEmail">재인증</button>
		            </div>						            
		        </div>
		
		        <div class="mt-3 mb-5">
		            <button class="btn btn-primary btn-lg w-100" type="button" id="signUpBtn">가입하기</button>
		        </div>  		
			</div>	        
    	</div>

    </div>

	<%@ include file="/WEB-INF/inc/footer.jsp" %>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		let v_userName;
		let v_cpCeoName;
		let v_cpAddress;
		let v_cpOpenDate;
		let v_userId;
		let v_userPw;
		let v_userPhone;
		let v_userEmail;
		let v_cpRegiNum;
	
		function verifyBusinessNumber(regiNum){
			console.log(regiNum);
			
			let serviceKey = "YH1GhOHgfwGDXSpI%2B8hDxHrXKh%2FmrAVYzXRuJu4UJDEaSOJIhNQyBP%2Bg8ELz%2FSsKDJwXAMBLrRnS7mBvbXtHbw%3D%3D";
			let url = "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=" + serviceKey;
		
			console.log(url);
			
			// POST 요청에 포함할 데이터
			let requestData = {
				b_no: [regiNum]
			};
			
			console.log(requestData);
			
			$.ajax({
				url: url,
				type: "POST",
				data: JSON.stringify(requestData),
				dataType: "JSON",
				contentType: 'application/json',
				accept: "application/json",
				success: function(result){
					console.log("통신완료");
					console.log(result);
					if(result){
						$("#submitFile").css("display", "block").prop('disabled', true);
						$("#loadingBtn").css("display", "none");
						$("#moreInfoBox").css("display", "block");
						$("#inputFile").prop('disabled', true);
						alert('사업자 등록이 확인됐습니다!');
					}
				},
				error: function(result){
					console.log(result.responseText);
					
					$("#submitFile").css("display", "block");
					$("#loadingBtn").css("display", "none");
					
					alert("등록된 사업자가 아닙니다!");
				}
			});
		}
	
		function sendFileToOCR(){
			if(confirm("해당 파일로 제출하시겠습니까??")){
				$("#submitFile").css("display", "none");
				$("#loadingBtn").css("display", "block");
				
				let v_inputFile = document.getElementById('inputFile');
				let v_file = v_inputFile.files[0];
				
				if(!v_file){
					alert('파일을 첨부해주세요!');
					
					$("#submitFile").css("display", "block");
					$("#loadingBtn").css("display", "none");
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
						let regiNum = data.business_registration_number.replace(/-/g, '');
						v_cpRegiFile = 
						v_cpRegiNum = regiNum;
						verifyBusinessNumber(regiNum);
					} else{
						$("#submitFile").css("display", "block");
						$("#loadingBtn").css("display", "none");
						
						alert("사업자등록번호를 찾을 수 없습니다.");
					}
				})
				.catch(error => {
					console.error("Error", error);
					alert('올바른 형식의 파일이 아닙니다. 다른 파일을 업로드해주십시오.');
					location.reload();
				});
			}
		}
		
		let corNameOn = false;
		let ceoOn = false;
		let addressOn = false;
		let dateOn = false;
		let idOn = false;
		let pwOn = false;
		let emailOn = false;
		
		// 기업명
		function checkCorName(){
			v_userName = $('#inputCorName').val();
			
			if(v_userName){
				corNameOn = true;
				toggleSignUpButton();
			}else{
				corNameOn = false;
				toggleSignUpButton();
			}
		}
		
		// 대표자명
		function checkCeoName(){
			v_cpCeoName = $('#inputCEO').val();
			
			if(v_cpCeoName){
				ceoOn = true;
				toggleSignUpButton();
			}else{
				ceoOn = false;
				toggleSignUpButton();
			}
		}
		
		// 회사주소 입력 함수
		function DaumPostCode(){
			new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('zipCode').value = data.zonecode;
	                
	                if(data.userSelectedType === 'R'){
	                	document.getElementById("inputAddress").value = roadAddr;
	                } else{
	                	document.getElementById("inputAddress").value = data.jibunAddress;
	                }

	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                    document.getElementById("extraAddress").value = extraRoadAddr;
	                } else {
	                    document.getElementById("extraAddress").value = '';
	                }
	            }
	        }).open();
		}
		
		// 회사주소
		function checkAddress(){
			let v_address = $("#inputAddress").val();
			let v_detailAddress = $("#detailAddress").val();
			let v_zipCode = $("#zipCode").val();
			let v_extraAddress = $("#extraAddress").val();
			
			v_cpAddress = v_zipCode + "/" + v_address + "/" + v_detailAddress + "/" + v_extraAddress;
			
			if(v_address && v_detailAddress && v_zipCode){
				addressOn = true;
				toggleSignUpButton();
			}else{
				addressOn = false;
				toggleSignUpButton();
			}
			console.log(addressOn);
		}
		
		// 개업일
		function checkDate(){
			v_cpOpenDate = $('#inputDate').val();
			
			if(v_cpOpenDate){
				dateOn = true;
				toggleSignUpButton();
			} else{
				dateOn = false;
				toggleSignUpButton();
			}
		}
		
		// 아이디(중복확인)
		function checkIdDuplicate(){
			let id = $("#inputId").val();
			
			if(id == "" || id.length == 0){
				$("#label1").css('color', "red").css('font-size', '13px').text('공백은 ID로 사용할 수 없습니다.');
				idOn = false;
				toggleSignUpButton(); 
				return;
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
						v_userId = id;
					} else{
						idOn = false;
						$("#label1").css("color", "red").css("font-size", "13px").text("사용 불가능한 ID 입니다.");
						$("#inputId").val('');
					}
					toggleSignUpButton(); // 가입 버튼 활성화 상태 갱신
				}
			});
		}
		
		// 비밀번호(일치, 불일치)
		function checkPasswordMatch() {
			let pw = $('#inputPassword').val();
			let rePw = $('#checkPassword').val();
			
			if(pw && rePw){
				if(pw === rePw){
					pwOn = true;
					$('#label2').text('비밀번호가 일치합니다.').css("color", "green").css("font-size", "13px");
					v_userPw = pw;
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
		
		// 이메일 인증 함수
		function sendEmailAuth() {
			let email = document.getElementById('inputEmail').value;
			
			if(confirm('인증번호를 보내시겠습니까?')){
				$('#emailSpinner').css('display', 'block');
				
				$.ajax({
					url: '${pageContext.request.contextPath}/ConfirmEmail',
					data: {email: email},
					type: "POST",
					dataType: 'json',
					success: function(result){
						if(result === true) {
							$('#emailSpinner').css('display', 'none');
							alert("인증번호가 성공적으로 전송됐습니다!");
							document.getElementById('auth-box').style.display = "";
							$('#checkAuthEmail').prop('disabled', false);
							$('#emailAuthBtn').prop('disabled', true);
						} else{
							$('#emailSpinner').css('display', 'none');
							document.getElementById('inputEmail').innerHMTL = "";
							alert("이미 가입된 이메일입니다.");
							
							if(confirm("로그인 페이지로 이동하시겠습니까?")){
								location.href = "${pageContext.request.contextPath}/loginView";
							} 
						}
					}
				});
			}
		}
		
		// 인증번호 확인 함수
		function checkEmailAuth() {
			let v_inputAuthEmail = document.getElementById('inputAuthEmail').value;
			let email = document.getElementById('inputEmail').value;
			
			if(v_inputAuthEmail == "" || v_inputAuthEmail.length == 0){
				alert("인증번호를 입력해주세요!");
				return;
			}
			
			$.ajax({
				url: '${pageContext.request.contextPath}/ReConfirmEmail',
				data: {
					number: v_inputAuthEmail,
					email: email
				},
				type: 'POST',
				dataType: 'json',
				success: function(result){
					if(result === true){
						alert('인증번호가 일치합니다!');
						emailOn = true;
						
						let v_authBox = document.getElementById('auth-box');
						let v_emailAuthBtn = document.getElementById('emailAuthBtn');
						v_authBox.innerHTML = "<p style='color:green; font-size:13px;'>이메일 인증이 완료됐습니다!</p>";
						v_emailAuthBtn.disabled = "true";
						
						v_userEmail = email;
						
						toggleSignUpButton(); // 가입 버튼 상태 업데이트
					} else {
						alert('인증번호가 틀립니다! 다시 입력해주세요!');
					}
				}
			});
		}
		
		// 재인증 함수
		function reSendEmailAuth(){
			if(confirm('다시 인증번호를 보내시겠습니까?')){
				$('#emailSpinner').css('display', 'block').css("top", '67%');
				let email = document.getElementById('inputEmail').value;
				
				$.ajax({
					url: '${pageContext.request.contextPath}/ConfirmEmail',
					data: { email: email },
					type: 'POST',
					dataType: 'json',
					success: function(result) {
						if (result === true) {
							$('#emailSpinner').css('display', 'none');
							alert("인증번호가 성공적으로 재전송됐습니다!");
							document.getElementById('auth-box').style.display = "";
							// 인증번호 확인 함수 호출 가능하도록 활성화
							$('#checkAuthEmail').prop('disabled', false);
						}
					}
				});			
			}
		}
		
		// 가입 버튼 활성화 상태 관리 함수
		function toggleSignUpButton(){
			if(corNameOn && ceoOn && addressOn && dateOn && idOn && pwOn && emailOn){
				$("#signUpBtn").prop('disabled', false);
			} else {
				$("#signUpBtn").prop('disabled', true);
			}
		}
		
		$("#inputCorName").on("focusout", checkCorName); // 기업명 focusout 이벤트
		$("#inputCEO").on("focusout", checkCeoName); // 대표자명 focusout 이벤트
		$("#inputDate").on("change", checkDate); // 개업일 focusout 이벤트
		$('#inputId').on("focusout", checkIdDuplicate); // 아이디 focusout 이벤트
		$('#inputPassword, #checkPassword').on("input", checkPasswordMatch); // 비밀번호 focusout 이벤트
		$('#emailAuthBtn').on("click", sendEmailAuth); // 이메일 인증 버튼 클릭 시
		$('#checkAuthEmail').on("click", checkEmailAuth); // 인증번호 확인 버튼 클릭 시
		$('#reCheckAuthEmail').on('click', reSendEmailAuth); // 인증번호 재전송 버튼 클릭 시
		$('#detailAddress, #inputAddress').on("focusout", checkAddress); // 회사주소 focusout 이벤트
		
		toggleSignUpButton();
		
		document.getElementById('signUpBtn').addEventListener("click", () => {
			if(confirm("위의 정보로 가입하시겠습니까?")){
				v_userPhone = document.getElementById('inputPhone').value;
				
				let requestData = {
					    userName: v_userName,
					    cpCeoName: v_cpCeoName,
					    cpAddress: v_cpAddress,
					    cpOpenDate: v_cpOpenDate,
					    userId: v_userId,
					    userPw: v_userPw,
					    userPhone: v_userPhone,
					    userEmail: v_userEmail,
					    cpRegiNum: v_cpRegiNum
					};

				console.log(requestData);
				
 				$.ajax({
					type: 'POST',
					url: "${pageContext.request.contextPath}/corporationRegistDo",
					data: JSON.stringify(requestData),
					contentType: "application/json",
					success: function(result){
						if(result === true){
							alert('회원가입이 성공적으로 이루어졌습니다!');
							location.href = "${pageContext.request.contextPath}/loginView";
						} else{
							alert('회원가입에 실패했습니다. 고객센터에 문의해주세요.');
						}
					},
					error: function(error){
						console.error("Error occured:", error);
					}
				}); 
			}
		});

	</script>
</body>

</html>