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
	        <div class="mb-4" style="text-align:center;"><h4>저탄고집 기업회원 가입</h4></div>
	
	        <div class="mb-3">
	            <div class="input-group">
	                <label for="inputFile" class="form-label" style="font-weight:bolder;">기업 인증(사업자등록증명원을 첨부해주세요!)</label>
	                <div class="input-group">
	                    <input type="file" class="form-control" id="inputFile" aria-describedby="inputGroupFileAddon04">
	                </div>
	                <div class="form-check">
	                    <input class="form-check-input" type="checkbox" value="" id="verifyLater">
	                    <label class="form-check-label" for="verifyLater">
	                        다음에 인증할게요!
	                    </label>
	                </div>
	            </div>
	        </div>
	
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
	                <input type="text" class="form-control d-block" id="inputAddress" placeholder="주소찾기">
	            </div>
	            <div class="input-group">
	                <input type="text" class="form-control" id="inputDetailAddress" placeholder="상세주소">
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
	                <input type="text" class="form-control" id="inputLogin" placeholder="아이디를 입력하세요">
	                <button class="btn btn-warning">중복확인</button>
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
	        </div>
	
	        <div class="mb-3">
	            <label for="inputPhone" class="form-label" style="font-weight:bolder;">휴대폰 번호</label>
	            <div class="input-group">
	                <input type="text" class="form-control" id="inputPhone" placeholder="휴대폰 번호를 입력하세요">
	            </div>
	        </div>
	
	        <div class="mb-3">
	            <label for="inputEmail" class="form-label" style="font-weight:bolder;">이메일</label>
	            <div class="input-group">
	                <input type="email" class="form-control" id="inputEmail" placeholder="이메일을 입력하세요">
	            </div>
	        </div>
	
	        <div class="mt-3 mb-5">
	            <button class="btn btn-primary btn-lg w-100">가입하기</button>
	        </div>    	
    	</div>

    </div>

	<%@ include file="/WEB-INF/inc/footer.jsp" %>
</body>

</html>