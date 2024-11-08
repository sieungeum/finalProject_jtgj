<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>저탄고집 로그인</title>
	<%@ include file="/WEB-INF/inc/header.jsp" %>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	
    <style>
        *{
            margin: 0;
            padding: 0;
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
        }

        .custom-container{
            width: 50%;
            height: 50%;
            position: relative;
            top: 3%;
            left: 25%;
            background-color: #FFFFFF;
            border-radius: 10px;
            display: flex;
            padding: 0;
            border: 0.5px solid #CCCCCC; 
        }

        .sign-in-box{
            width: 50%;
            display: flex;
            flex-direction: column;
            justify-content: end;
            position: relative;
        }

        #carouselExampleFade{
        	width: 80%;
        	height: 50%;
        	position: absolute;
			top: 45%;
			left: 50%;
    		transform: translate(-50%, -50%);
        }
        
        .sign-in-btn-box{
            width: 100%;
            margin-bottom: 17%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .login-box{
            width: 50%;
        }

        .logo-box{
            width: 30%;
            height: 20%;
            margin-top: 5%;
            margin-left: 8%;
            cursor: pointer;
        }

        .logo-img{
            width: 100%;
            height: 100%;
        }

        .div-line-box{
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .div-line{
            height: 80%;
            border-right: 0.5px solid gray;
        }

        .login-box{
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-mini-box{
            display: flex;
            flex-direction: column;
            width: 70%;
        }

        .login-div{
            display: flex;
            margin-bottom: 20px;
        }

        .individual-member{
            width: 50%;
            text-align: center;
            font-size: 20px;
            cursor: pointer;
            display: flex;
            flex-direction: column;
        }

        .individual-member:hover{
            color: grey;
            opacity: 80%;
        }

        .corporate-member{
            width: 50%;
            text-align: center;
            font-size: 20px;
            cursor: pointer;
            display: flex;
            flex-direction: column;
        }

        .corporate-member:hover{
            color: grey;
            opacity: 80%;
        }

        .id-box{
            margin-bottom: 20px;
        }

        .pw-box{
            margin-bottom: 15px;
        }

        .check-box{
            display: flex;
            margin-bottom: 20px;
            font-size: 13px;
        }

        #login-btn{
            width: 100%;
            margin-bottom: 20px;
        }

        .find-member{
            display: flex;
            font-size: 10px;
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
    
        <div class="sign-in-box">
        	<!-- 캐러셀 -->
	        <div id="carouselExampleFade" class="carousel slide carousel-fade" >
	            <div class="carousel-inner w-100 h-100">
	                <div class="carousel-item active w-100">
	                    <img src="./img/test/아이젠소스케.png" class="w-100 h-100">
	                </div>
	                <div class="carousel-item w-100 h-100">
	                    <img src="./img/test/아이젠소스케2.png" class="w-100 h-100">
	                </div>
	                <div class="carousel-item w-100 h-100">
	                    <img src="./img/test/아이젠소스케9.jpg" class="w-100 h-100">
	                </div>
	                <div class="carousel-item w-100 h-100">
	                    <img src="./img/test/아이젠소스케3.png" class="w-100 h-100">
	                </div>
	                <div class="carousel-item w-100 h-100">
	                    <img src="./img/test/아이젠소스케4.jpg" class="w-100 h-100">
	                </div>
	                <div class="carousel-item w-100 h-100">
	                    <img src="./img/test/아이젠소스케5.jpg" class="w-100 h-100">
	                </div>
	                <div class="carousel-item w-100 h-100">
	                    <img src="./img/test/아이젠소스케6.jpg" class="w-100 h-100">
	                </div>
	                <div class="carousel-item w-100 h-100">
	                    <img src="./img/test/아이젠소스케7.jpg" class="w-100 h-100">
	                </div>
	                <div class="carousel-item w-100 h-100">
	                    <img src="./img/test/아이젠소스케8.jpg" class="w-100 h-100">
	                </div>
	                <div class="carousel-item w-100 h-100">
	                    <img src="./img/test/아이젠소스케10.jpg" class="w-100 h-100">
	                </div>
	            </div>
	            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
	                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                <span class="visually-hidden">Previous</span>
	            </button>
	            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
	                <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                <span class="visually-hidden">Next</span>
	            </button>
	        </div> 
	
			<!-- 회원가입 버튼 -->
	        <div class="sign-in-btn-box">
	        	<a href="${pageContext.request.contextPath }/personalRegistView" class="btn btn-success btn-lg" id="sign-in-btn" style="width:80%;">개인회원가입</a>
	        </div>
        </div>

        <div class="login-box">
            <div class="login-mini-box">
                <div class="login-div">
                    <div class="individual-member">
                        개인회원
                        <hr style="width: 100%; margin:0; height:3px; background-color:#4876EF;">
                    </div>
                    <div class="corporate-member">
                        기업회원
                        <hr style="visibility:hidden; width:100%; margin:0; height:3px; background-color:#4876EF;">
                    </div>
                </div>

				<form action="${pageContext.request.contextPath }/loginDo" method="POST">
			       	<input type="hidden" value="${fromUrl }" name="fromUrl">
					<div class="id-box">
	                    <input class="form-control" type="text" placeholder="아이디" name='userId' value="${cookie.rememberId.value }">
	                </div>
	
	                <div class="pw-box">
	                    <input class="form-control" type="password" placeholder="비밀번호" name="userPw">
	                </div>
	
	                <div class="check-box">
	                    <input class="form-check-input me-1" type="checkbox" id="remember-login" name="rememberId" ${cookie.rememberId.value == null ? "" : "checked" }>
	                    <label class="form-check-label" for="remember-login">
	                        아이디 기억하기
	                    </label>
	                </div>
	
	                <div class="login-btn-box">
	                    <button class="btn btn-primary btn-lg" id="login-btn" type="submit">로그인</button>
	                </div>				
				</form>
                

                <div class="find-member">
                    <div style="margin-right: 10px;"><a style="text-decoration:none;color:black;" href="#">아이디 찾기</a></div>
                    <div style="margin-right: 10px;">|</div>
                    <div><a style="text-decoration:none;color:black;" href="#">비밀번호 찾기</a></div>
                </div>
            </div>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        let individualMember = document.getElementsByClassName('individual-member')[0];
        let corporateMember = document.getElementsByClassName('corporate-member')[0];
        let signInBtn = document.getElementById('sign-in-btn');
        let signInBtnBox = document.getElementsByClassName('sign-in-btn-box')[0];
        let checkBox = document.getElementsByClassName('check-box')[0]; 

        // 개인 멤버 클릭시
        individualMember.addEventListener('click', () => {
            individualMember.children[0]['style']['visibility'] = "visible";
            signInBtnBox.children[0]['attributes'][0]['nodeValue'] = "/finalProject/personalRegistView"
            signInBtn.innerHTML = "개인회원가입";
            checkBox.innerHTML = [
                '<input class="form-check-input me-1" type="checkbox" id="remember-login" name="remeberId" ${cookie.rememberId.value == null ? "" : "checked"}>' +
                '<label class="form-check-label" for="remember-login">' +
                '아이디 기억하기' +
                '</label>'
            ]
            corporateMember.children[0]['style']['visibility'] = "hidden";
        })

        // 기업 멤버 클릭시
        corporateMember.addEventListener('click', () => {
            corporateMember.children[0]['style']['visibility'] = "visible";
            signInBtnBox.children[0]['attributes'][0]['nodeValue'] = "/finalProject/corporationRegistView"
            signInBtn.innerHTML = "기업회원가입";
            checkBox.innerHTML = [
                '<input class="form-check-input me-1" type="checkbox" value="" id="remember-login">' +
                '<label class="form-check-label" for="remember-login">' +
                '아이디 기억하기' +
                '</label>'
            ]
            individualMember.children[0]['style']['visibility'] = "hidden";
        })       
		
    </script>
	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp" %>
</body>

</html>