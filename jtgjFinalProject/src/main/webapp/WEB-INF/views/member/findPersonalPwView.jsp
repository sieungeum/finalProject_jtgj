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
        <form action="">
			<div style="border:1px solid black;padding-top:10%;padding-bottom:5%;padding-left:8%;padding-right:8%;margin-bottom:5%;">
				<div class="mb-3"><h5 style="font-size:13px;font-weight:bolder;">이메일 인증으로 회원정보에 등록된 비밀번호를 찾을 수 있습니다.</h5></div>
				
				<div class="w-100" style="display:flex;flex-direction:column;">
					<div class="d-flex w-100 mb-3">
						<div style="width:10%;display:flex;justify-content:center;align-items:center;margin-right:5%;">
							<p style="color:#747474;">아이디</p>
						</div>
				        <div class="input-group mb-2">
				                <input type="text" class="form-control me-2" id="inputId" placeholder="아이디를 입력하세요" name="userId">
				        </div>
					</div>
				
					<div class="d-flex w-100">
						<div style="width:10%;display:flex;justify-content:center;align-items:center;margin-right:5%;">
							<p style="color:#747474;">이메일</p>
						</div>
				        <div class="input-group mb-2">
				                <input type="email" class="form-control me-2" id="inputEmail" placeholder="이메일을 입력하세요" name="userEmail">
				                <button class="btn btn-warning" type="button" id="emailAuthBtn">인증하기</button>
				        </div>
					</div>
					
					<div style="display:flex;justify-content:center;align-items:center;margin-top:5%;">
						<button class="btn btn-primary btn-lg" style="width:20%;" type="submit">인증확인</button>
					</div>
				</div>
			</div>        
        </form>
		
		<div style="display:flex;flex-direction:column;background-color:#EEEEEE;padding-top:3%;padding-bottom:3%;padding-left:3%;">
			<div class="d-flex">
				<a class="btn btn-light me-3" href="${pageContext.request.contextPath }/loginView">로그인</a>
				<a class="btn btn-light me-3" href="${pageContext.request.contextPath }/findPersonalIdView">아이디 찾기</a>
				<a class="btn btn-light me-3" href="${pageContext.request.contextPath }/personalRegistView">개인 회원가입</a>
				<a class="btn btn-light me-3" href="${pageContext.request.contextPath }/corporationRegistView">기업 회원가입</a>
				<a class="btn btn-light me-3" href="${pageContext.request.contextPath }/faqView">건의사항</a>
			</div>
				
			<div class="mt-3">
				<p style="color:black;font-size:13px;">위 방법으로 계정을 찾을 수 없다면, 저탄고집 고객센터로 직접 문의 주시기 바랍니다.</p>
			</div>
		</div>
    </div>

	<%@ include file="/WEB-INF/inc/footer.jsp" %>
	
	<script type="text/javascript">
		
	</script>
</body>

</html>