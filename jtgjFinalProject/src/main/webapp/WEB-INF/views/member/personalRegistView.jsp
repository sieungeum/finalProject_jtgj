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
	        </div>
	
	        <div class="mb-3">
	            <label for="inputEmail" class="form-label" style="font-weight:bolder;">이메일</label>
	            <div class="input-group">
	                <input type="email" class="form-control" id="inputEmail" placeholder="이메일을 입력하세요" name="userEmail">
	            </div>
	        </div>
	        
	        <div class="mb-3">
	            <label for="inputPhone" class="form-label" style="font-weight:bolder;">휴대폰</label>
	            <div class="input-group">
	                <input type="text" class="form-control" id="inputPhone" placeholder="휴대폰 번호를 입력하세요" name="userPhone">
	            </div>
	        </div>
	        
<!--  	        <div class="mb-3 mt-3">
 	        	<label for="inputImage" class="form-label" style="font-weight:bolder;">프로필 이미지</label>
	        	<div class="profile-box d-flex justify-content-center align-itmes-center">
	        		<img src="./img/test/아이젠소스케7.jpg" class="profile-img">
	        	</div>
	        	<input class="d-none" id="inputImage" type="file" accept="image/*" onchange="readImage(this);">
	        </div>  -->
	
	        <div class="mt-5">
	            <button class="btn btn-primary btn-lg w-100" id="signUpBtn" type="submit" disabled>가입하기</button>
	            <p id="signUpWarning" style="font-size:13px;color:red;font-weight:bolder;">아이디와 비밀번호를 입력해주세요!</p>
	        </div>		
		</form>

    </div>

	<%@ include file="/WEB-INF/inc/footer.jsp" %>
	
	<script type="text/javascript">
		
		$(document).ready(function() {
			let idOn = false; // 아이디 중복 체크 여부
			let pwOn = false; // 비밀번호 일치 여부
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
				if(idOn && pwOn){
					v_signUpBtn.prop('disabled', false);
					v_warning[0]['attributes']['style']['value'] = "font-size:13px;color:red;font-weight:bolder;display:none;"
				} else {
					v_signUpBtn.prop('disabled', true);
					v_warning[0]['attributes']['style']['value'] = "font-size:13px;color:red;font-weight:bolder;display:'';"
				}
			}
			
			// 이벤트 리스너 설정
			$('#inputId').on("focusout", checkIdDuplicate); // 아이디 focusout 이벤트
			$('#inputPassword, #checkPassword').on("input", checkPasswordMatch); // 비밀번호 focusout 이벤트
			
			// 초기 버튼 상태 설정
			toggleSignUpButton();
		});
	

		
	
/* 		// 프로필 이미지 클릭
		document.getElementsByClassName('profile-img')[0].addEventListener("click", () => {
			$('#inputImage').click();
		})
		
		// 프로필 이미지 파일 서버에 전달
		function readImage(p_this0){
			// input file 태그에 담긴 파일을 가져옴
			let v_file = p_this.files[0];
			
			// ajax 통신으로 보낼 데이터 형태 만들기
			let v_formData = new FormData();
			v_formdata.append('file', v_file);
			
			// formData에 추가된 파일 정보 확인하기
			console.log(v_formData); // 그냥 콘솔 출력시 확인 X
			for(let [key, value] of v_formData.entries()){
				console.log(key, ": ", value);
			}
			
			let v_url = '${pageContext.request.contextPath}/uploadProfile';
			
			$.ajax({
				type: 'POST',
				url: v_url,
				contentType: false,
				processData: false,
				enctype: 'multipart/form-data',
				data: v_formData,
				success: function(data){
					console.log(data);
					console.log(data.result);
					
					let v_filePath = data.result;
					let v_imgReqUrl = '${pageContext.request.contextPath}/displayImage';
					
					// 서버 PC 로컬에 저장된 이미지를 가져올 수 있도록 img 태그 src에 요청
					$(".profile-img").attr('src'. v_imgReqUrl + "?imgName=" + v_filePath);
				},
				error: function(req, st, err){
					console.log('request: ', req);
					console.log('status: ', st);
					console.log('error: ', err);
				}
			});
		} */
	</script>
</body>

</html>