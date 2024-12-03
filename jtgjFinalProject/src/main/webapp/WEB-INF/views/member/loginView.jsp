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
            margin:0;
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
            height:40px;
        }

        .find-create-member{
        	width: 100%;
            display: flex;
        }
        
        .owl-wrapper-outer {
	        border-radius: 20px;
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
        
        <div class="sign-in-box" data-wow-duration="0.8s" data-wow-delay="0.3s">
			<div class="row" style="height:100%;display:flex;justify-content:center;align-items:center;margin-left:30px;padding:10px;opacity:90%;">
				<div id="history-images" class="owl-carousel">
					<div>
						<img class="img-responsive center-block" src="img/test/login-test1.jpg" style="width:100%;height:350px;overflow:hidden;">
					</div>
					<div>
						<img class="img-responsive center-block" src="img/test/login-test2.jpg" style="width:100%;height:350px;overflow:hidden;">
					</div>
					<div>
						<img class="img-responsive center-block" src="img/test/login-test3.jpg" style="width:100%;height:350px;overflow:hidden;">
					</div>
					<div>
						<img class="img-responsive center-block" src="img/test/login-test4.jpg" style="width:100%;height:350px;overflow:hidden;">
					</div>
					<div>
						<img class="img-responsive center-block" src="img/test/login-test5.jpg" style="width:100%;height:350px;overflow:hidden;">
					</div>
				</div>
			</div>
		</div>

        <div class="login-box">
            <div class="login-mini-box">
				<form action="${pageContext.request.contextPath }/loginDo" method="POST">
			       	<input type="hidden" value="${fromUrl }" name="fromUrl">
					<div class="id-box">
	                    <input class="form-control" type="text" placeholder="아이디" name='userId' value="${cookie.rememberId.value }" style="height:50px;font-size:13px;">
	                </div>
	
	                <div class="pw-box">
	                    <input class="form-control" type="password" placeholder="비밀번호" name="userPw" style="height:50px;font-size:13px;">
	                </div>
	
	                <div class="check-box">
	                    <input class="form-check-input me-1" type="checkbox" id="remember-login" name="rememberId" ${cookie.rememberId.value == null ? "" : "checked" }>
	                    <label class="form-check-label" for="remember-login">
	                        아이디 기억하기
	                    </label>
	                </div>
	
	                <div class="login-btn-box">
	                    <button class="btn btn-primary btn-lg" id="login-btn" type="submit" style="font-size:13px;">로그인</button>
	                </div>				
				</form>
                

                <div class="find-create-member">
                    <div style="width:100%;display:flex;flex-direction:column;">
                        <a class="btn btn-secondary mb-3" style="text-decoration:none;color:white;height:30px;style="font-size:13px;"" href="${pageContext.request.contextPath }/selectSignUpView">회원가입</a>
                    	<a class="btn btn-secondary" style="text-decoration:none;color:white;height:30px;style="font-size:13px;"" href="${pageContext.request.contextPath }/findAccountView">아이디/비밀번호 찾기</a>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp" %>
</body>

</html>