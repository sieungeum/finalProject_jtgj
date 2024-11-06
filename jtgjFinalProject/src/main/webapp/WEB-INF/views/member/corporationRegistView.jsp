<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>저탄고집 기업회원 가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <style>
        *{
            margin: 0;
            padding: 0;
        }

        div{

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

        .container{
            width: 20%;
            margin-top: 2%;
            background-color: #FFFFFF;
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            padding: 0;
        }



    </style>
</head>

<body>
    
    <div class="container">
        <div class="mb-4" style="text-align:center;"><h4>저탄고집 기업회원 가입</h4></div>

        <div class="mb-3">
            <label for="inputBusinessNum" class="form-label" style="font-weight:bolder;">사업자등록번호</label>
            <div class="input-group d-flex">
                <input type="text" class="form-control" id="inputBusinessNum" placeholder="등록번호를 입력하세요">
            </div>
        </div>

        <div class="mb-3">
            <div class="input-group">
                <label for="inputFile" class="form-label" style="font-weight:bolder;">기업 인증</label>
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
            <label for="inputIndustry" class="form-label" style="font-weight:bolder;">업종</label>
            <div class="input-group">
                <input type="text" class="form-control" id="inputIndustry" placeholder="업종선택">
                <button class="btn btn-primary ms-2">선택</button>
            </div>
        </div>

        <div class="mb-3">
            <label for="inputDate" class="form-label" style="font-weight:bolder;">개업일</label>
            <div class="input-group">
                <input type="date" class="form-control" id="inputDate">
            </div>
        </div>

        <div class="mb-3">
            <label for="inputDate" class="form-label" style="font-weight:bolder;">기업구분</label>
            <br>

            <div class="d-flex">
                <input type="radio" class="btn-check" name="options" id="option1" autocomplete="off">
                <label style="color:white;" class="btn btn-info me-2" for="option1">일반</label>
                
                <input type="radio" class="btn-check" name="options" id="option2" autocomplete="off">
                <label style="color:white;" class="btn btn-info me-2" for="option2">헤드헌터</label>
                
                <input type="radio" class="btn-check" name="options" id="option4" autocomplete="off">
                <label style="color:white;" class="btn btn-info" for="option4">파견/도급/채용대행</label>
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
            <button class="btn btn-primary w-100">가입하기</button>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>

            

    </script>
</body>

</html>