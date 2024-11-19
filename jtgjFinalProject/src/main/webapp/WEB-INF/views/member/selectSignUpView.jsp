<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>저탄고집 회원가입 선택 페이지</title>
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
        
        .select-box{
        	font-size:25px;
        	font-weight:500;
        	padding-top:8%;
        	padding-bottom:8%;
        	cursor:pointer;
        }
        
        .select-box:hover{
        	background-color:#CCCCCC;
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
        <div class="w-100" style="border-bottom:1px solid black; padding-bottom:3%;"><h1>회원가입</h3></div>
        
		<div style="padding-top:3%;padding-bottom:2%;"><h5 style="font-size:13px;font-weight:bolder;">개인회원 혹은 기업회원 중 하나를 선택해주세요.</h5></div>
		
		<div class="w-100 d-flex" style="border:1px solid #CCCCCC">
			<div class="w-50 d-flex justify-content-center align-items-center select-box" id="personalRegist" style="border-right:1px solid #CCCCCC;">
				개인회원
			</div>
			
			<div class="w-50 d-flex justify-content-center align-items-center select-box" id="corporationRegist">
				기업회원
			</div>
		</div>
		
		<div style="display:flex;flex-direction:column;background-color:#EEEEEE;margin-top:3%;padding-top:3%;padding-bottom:3%;padding-left:3%;">
			<div class="d-flex">
				<a class="btn btn-light me-3" href="${pageContext.request.contextPath }/loginView">로그인</a>
				<a class="btn btn-light me-3" href="${pageContext.request.contextPath }/findAccountView">아이디/비밀번호 찾기</a>
				<a class="btn btn-light me-3" href="${pageContext.request.contextPath }/faqView">건의사항</a>
			</div>
				
			<div class="mt-3">
				<p style="color:black;font-size:13px;">위 방법으로 계정을 찾을 수 없다면, 저탄고집 고객센터로 직접 문의 주시기 바랍니다.</p>
			</div>
		</div>
    </div>

	<%@ include file="/WEB-INF/inc/footer.jsp" %>
	
	<script type="text/javascript">
		document.getElementById('personalRegist').addEventListener('click', () => {
			location.href = "${pageContext.request.contextPath}/personalRegistView";
		});
		
		document.getElementById('corporationRegist').addEventListener('click', () => {
			location.href = "${pageContext.request.contextPath}/corporationRegistView";
		});
	</script>
</body>

</html>