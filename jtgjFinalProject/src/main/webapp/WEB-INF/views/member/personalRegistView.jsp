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
            user-select:none
        }

        .custom-container{
            width: 20%;
            height: 50%;
            position: relative;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -90%);
            background-color: #FFFFFF;
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            padding: 0;
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
	            <label for="inputLogin" class="form-label" style="font-weight:bolder;">아이디</label>
	            <div class="input-group d-flex">
	                <input type="text" class="form-control" id="inputLogin" placeholder="아이디를 입력하세요" name="userId">
	                <button class="btn btn-warning">중복확인</button>
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
	
	        <div class="mt-3">
	            <button class="btn btn-primary btn-lg w-100" type="submit">가입하기</button>
	        </div>		
		</form>

    </div>

	<%@ include file="/WEB-INF/inc/footer.jsp" %>
</body>

</html>