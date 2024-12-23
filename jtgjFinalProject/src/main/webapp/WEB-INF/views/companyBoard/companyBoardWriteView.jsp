<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="ko">

<head>
	<meta charset="utf-8">
	<title>OAK - HTML Theme</title>
	<meta name="description" content="">
	<meta name="msapplication-tap-highlight" content="yes" />
	<meta name="viewport"
		content="width=device-width, user-scalable=no, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0" />
	
	<%@ include file="/WEB-INF/inc/header.jsp" %>
	
	<script src="${pageContext.request.contextPath}/nse/js/HuskyEZCreator.js" type="text/javascript"></script>
	
	<style type="text/css">
		
		.dFjcB{
			display: flex;
			justify-content: space-between;
		}
		
		.profileImgBox{
			height: 120px;
			width: 120px;
			border-radius: 60px;
			overflow: hidden;
		}
		
		.profileImg{
			width: auto;
			height: 150px;
		}
		
		.marB{
			margin-bottom: 40px; 
		}
		
		.dF{
		 	display: flex;
		}
		
		.marR{
			margin-right: 30px;
		}
		
		.dFDjcA{
			display: flex;
			flex-direction: column;
			justify-content: space-around;
		}
		
		.dFjcC{
			display: flex;
			justify-content: center;
			height: 35px;
			align-items: center;
		}
		
		.marR15{
			margin-right: 15px;
		}
		
		.companyDetailCard{
			width: 30%;
			min-height: 300px;
			border-radius:20px;
			border: 2px solid black; 
			display: flex;
			flex-direction: column;
			
		}
		
		.width100{
			width: 100%;
		}
		
		.marB20{
			margin-bottom: 20px;
		}
		
		.proInput{
			width: 65%;
			min-height: 470px;
		}
		
		.proText{
			min-height: 430px;
		}
		
		.DetailCardBox{
			margin-top: 15px;
			margin-left: 20px;
			margin-right: 20px;
			margin-bottom: 10px;
			display: flex;
			flex-direction: column;
			justify-content:space-between;
			align-items: flex-start;
			height: 50px;
		}
		
		.NextDetailCardBox{
			margin-left: 20px;
			margin-right: 20px;
			margin-bottom: 10px;
			display: flex;
			flex-direction: column;
			justify-content:space-between;
			align-items: flex-start;
			height: 50px;
		}
		
		.lastDetailCardBox{
			margin-left: 20px;
			margin-right: 20px;
			margin-bottom: 20px;
			display: flex;
			flex-direction: column;
			justify-content:space-between;
			align-items: flex-start;
			min-height: 50px;
		}
		
		.dFjcE{
			display: flex;
			justify-content: flex-end;
		}
		
		.imgboxD{
			display: flex;
			flex-direction: column;
			
		}
		
		.boer {
			font-weight: 700;
		}
		
		.marTop{
			margin-top: 25px;
		}
		
		.marL25 {
			margin-left: 25px;
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
	
	<section class="page-section" id="contact">
		<form id="companyBoardWriteForm" action="${pageContext.request.contextPath }/companyBoardWriteDo" method="POST" enctype="multipart/form-data">
	    	<div class="container">
			    <!-- 이미지 업로드 -->
			    <div class="form-group imgboxD">
			        <label for="cpBoardReperImgFile">대표 이미지 업로드</label>
			        <!-- 숨긴 파일 입력 -->
			        <input type="file" name="cpBoardReperImgFile" id="cpBoardReperImgFile" 
			               class="form-control-file" style="display: none;"  accept="image/*" onchange="previewImage(event)" />
			        <!-- 클릭 가능한 이미지 -->
			        <img id="preview" src="img/blog-header.jpg" alt="대표 이미지 미리보기" 
			             style="max-width: 300px; max-height: 300px; margin-top: 10px; cursor: pointer;" 
			             onclick="document.getElementById('cpBoardReperImgFile').click();" />
			    </div>
			</div>
    
			<div class="container margin-top">
			    <div class="single-blog-wrapper">
		            <div class="row">
		                <div class="dFjcB marB">
		                    <div class="dF">
		                        <!-- 프로필 이미지 표시 -->
		                        <c:if test="${sessionScope.login.userProfImg == 'N' }">
		                        	<div class="profileImgBox">
										<img src="img/default_img.png" class="profileImg" style="max-width: 300px; max-height: 300px; margin-top: 10px;">
		                        	</div>
								</c:if>
								<c:if test="${sessionScope.login.userProfImg != 'N' }">
									<div class="profileImgBox">
										<img src="<c:url value="/displayProfImg?atchtype=prof_img&imgName=${sessionScope.login.userProfImg }"/>" class="profileImg" style="max-width: 300px; max-height: 300px; margin-top: 10px;">
									</div>
								</c:if>
		                        <div class="dFDjcA marL25">
		                            <!-- 기업명 -->
		                            <p class="boer">${user.userName}</p>
		                            <!-- 소개글 입력 -->
		                            <input type="text" name="cpBoardIntro" placeholder="간단한 소개">
		                        </div>
		                    </div>
		                    <%--
		                    <div class="dFjcC">
		                        <button type="button" class="btn btn-success marR15">팔로우하기</button>
		                        <button type="button" class="btn btn-primary">공유하기</button>
		                    </div>
		                     --%>
		                </div>
		            </div>
		            <div class="blog-post">
		                <div class="dFjcB">
		
		                    <!-- 프로필 부분 -->
		                    <div class="proInput">
		                        <label class="marB20" for="inputTitle">프로필</label>
		                        <!-- 기업 소개글 입력 -->
		                        <textarea class="from-control proText" name="cpBoardContent" rows="6" placeholder="기업의 소개를 해주세요."></textarea>
		                    </div>
		
		                    <!-- 여기가 카드부분 -->
		                    <div class="companyDetailCard">
		                        <!-- 대표 정보 -->
		                        <div class="DetailCardBox">
		                            <label>대표</label>
		                            <h6>${company != null ? company.cpCeoName : ''}</h6>
		                        </div>
		                        <hr class="width100">
		
		                        <!-- 경력 정보 -->
		                        <div class="NextDetailCardBox">
		                            <label>경력</label>
		                            <h6>${company != null ? company.cpOpenDate : ''}</h6>
		                        </div>
		                        <hr class="width100">
		
		                        <!-- 업무 영역 정보 -->
		                        <div class="NextDetailCardBox">
		                            <label>업무영역</label>
		                            <input class="form-control" type="text" name="cpBoardArea" placeholder="업무 영역을 입력하세요." />
		                        </div>
		                        <hr class="width100">
		
		                        <!-- 연락처 정보 -->
		                        <div class="NextDetailCardBox">
		                            <label>연락처</label>
		                            <h6>${user != null ? user.userPhone : ''}</h6>
		                        </div>
		                        <hr class="width100">
		
		                        <!-- 이메일 정보 -->
		                        <div class="NextDetailCardBox">
		                            <label>이메일</label>
		                            <h6>${user != null ? user.userEmail : ''}</h6>
		                        </div>
		                        <hr class="width100">
		
		                        <!-- 주소 정보 -->
		                        <div class="lastDetailCardBox">
		                            <label>주소</label>
		                            <h6>${company != null ? company.cpAddress : ''}</h6>
		                        </div>
		                    </div>
		                </div>
		            </div>
			        
			        <div class="youtubeRink">
			        	<label> 유튜브 </label>
			        	<input type="text" id="youtubeLinkInput" name="cpBoardYoutubeLink" class="form-control" placeholder="유튜브 링크를 입력하세요" />
			        </div>
			        
			        <div class="dFjcE marTop">
				        <button class="btn btn-success" type="submit">홍보 등록</button>
			        </div>
			        
			    </div>
			</div>
		</form>
	</section>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp" %>
	
	<script type="text/javascript">
		function previewImage(event) {
	        const reader = new FileReader();
	        reader.onload = function () {
	            document.getElementById('preview').src = reader.result;
	        };
	        if (event.target.files && event.target.files[0]) {
	            reader.readAsDataURL(event.target.files[0]);
	        } else {
	            document.getElementById('preview').src = 'img/blog-header.jpg';
	        }
	    }
	</script>
	
	<script>
	    // 유튜브 링크 검증 함수
	    function validateYouTubeLink(link) {
	        const regex = /(?:https?:\/\/)?(?:www\.)?youtube\.com\/watch\?v=([a-zA-Z0-9_-]+)|(?:https?:\/\/)?(?:www\.)?youtu\.be\/([a-zA-Z0-9_-]+)/;
	        const match = link.match(regex);
	        return match ? match[1] || match[2] : null; // 동영상 ID 반환
	    }
	
	    // 폼 제출 이벤트 핸들러
	    document.getElementById('companyBoardWriteForm').addEventListener('submit', function(event) {
	        // 이미지 필드 검증
	        const imageField = document.getElementById('cpBoardReperImgFile');
	        if (!imageField.files || imageField.files.length === 0) {
	            alert('대표 이미지를 첨부 해주십시오.');
	            event.preventDefault(); // 폼 제출 중단
	            return;
	        }
	
	        // 유튜브 링크 검증
	        const inputField = document.getElementById('youtubeLinkInput');
	        const youtubeLink = inputField.value.trim(); // 유튜브 링크 입력값 가져오기
	
	        if (youtubeLink) {
	            const videoId = validateYouTubeLink(youtubeLink); // 유튜브 링크 유효성 검사
	            if (!videoId) {
	                alert('알맞지 않은 유튜브 링크입니다.');
	                event.preventDefault(); // 폼 제출 중단
	                return;
	            }
	
	            // iframe 형식으로 변환
	            const iframeCode = `<iframe width="560" height="315" src="https://www.youtube.com/embed/${videoId}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>`;
	
	            // 히든 필드로 변환된 iframe 코드를 전송
	            const iframeField = document.createElement('input');
	            iframeField.type = 'hidden';
	            iframeField.name = 'cpBoardYoutubeIframe';
	            iframeField.value = iframeCode;
	            this.appendChild(iframeField);
	        }
	
	        // 유튜브 링크가 비어 있는 경우에도 폼 제출 허용
	    });
	</script>
	
</body>
</html>