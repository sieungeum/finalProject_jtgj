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
	
		.dFjcE{
			display: flex;
			justify-content: end;
		}
		
		.dFjcC{
			display: flex;
			justify-content: center;
		}
		
		.marR{
			margin-right: 1%;
		}
		
		.marTB{
			margin-top: 15px;
			margin-bottom: 15px;
		}
		
		.marT{
			margin-top: 15px;
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
    	<!-- 부트스트랩으로 padding-top 을 좀 주고자 한다. -->
        <div class="container pt-5">
            <!-- Contact Section Heading-->
            <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">공지사항 작성</h2>
            <!-- Icon Divider-->
            <div class="divider-custom">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                <div class="divider-custom-line"></div>
            </div>
            <!-- Contact Section Form-->
            <div class="dFjcC">
                <div class="col-lg-8 col-xl-7">
                	
                	<input type="file" id="inputImg" accept="image/*" style="display: none;" onchange="f_sendImg()">
                	
                	<form id="noticeWriteForm" action="${pageContext.request.contextPath }/noticeWriteDo" method="POST" enctype="multipart/form-data">
	             		<div class="mb-5">
	             			<label for="inputTitle">제목</label>
	                    	<input class="form-control" type="text" name="noticeTitle" placeholder="제목을 입력해주세요" />
	                    </div>
	                    
	                    <div class="mb-5">
	                         <textarea id="smartEditor" class="form-control" rows="10" name="noticeContent"></textarea>
	                    </div>
	                    
	                    <!-- file input -->
	                    <div class="mb-5 marT">
	                    	<label for="formFileMultiple" class="form-label">파일첨부</label>
	                    	<input class="form-control" name="boFile" type="file" id="formFileMultiple" multiple>
	                    </div>               
	                    
	                    <div class ="dFjcE marTB">
	                    	<!-- form 태그의 submit 역할을 함 -> type=submit 넣어주기 -->
	                    	<button id="writeBtn" class="btn btn-success marR" type="button">등록</button>
	                    	<a class="btn btn-danger me-2" href ="${pageContext.request.contextPath}/faqView">취소</a>
	                    	
	                    </div>
	     
                	</form>
         
                </div>
            </div>
        </div>
    </section>
    
	
	<script type="text/javascript">
		var oEditors = [];
		
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "smartEditor",
			sSkinURI : "${pageContext.request.contextPath}/nse/SmartEditor2Skin.html"
			
		});
		
		// 글 등록 버튼 클릭
		document.getElementById('writeBtn').addEventListener('click', ()=>{
			// 에디터에 작성된 내용(html 태그 형태 )을 숨겨진textarea에 반영
			oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
			
			// form 태그의 submit 실행
			document.getElementById('noticeWriteForm').submit();
		});
		
		// 이미지 첨부 받을 input 태그 객체 불러오기
		const v_inputImg = document.getElementById('inputImg');
		
		// 스마트에디터가 로드된 후 이미지 첨부 버튼에 클릭 이벤트 추가
		window.onload = function(){
			// 스마트에디터가 그려진 iframe 가져오기
			const v_iframe = document.querySelector('#noticeWriteForm > div:nth-child(2) > iframe');
			console.log(v_iframe)
			// iframe 내 document에 접근
			const v_iframeDocument = v_iframe.contentWindow.document;
			console.log(v_iframeDocument)
			// iframe의 document 안에 있는 이미지 첨부 버튼 (id가 photoUploadBtn)에
			// 클릭 이벤트 부여
			v_iframeDocument.querySelector('#photoUploadBtn').addEventListener('click', () => {
				// 에디터 내 이미지 첨부 버튼 클릭시 inputImg 클릭
				v_inputImg.click();
			});
		}
		
		function f_sendImg(){
			let v_formData = new FormData();
			v_formData.append('file', event.target.files[0]);
			
			let v_url = '${pageContext.request.contextPath}/uploadImg';
			
			$.ajax({
				type: 'POST',
				url: v_url,
				contentType: false,
				processData:false,
				enctype: 'multipart/form-data',
				data: v_formData,
				success: function(resp){
					console.log(resp);
					let imgTag = '<img style="witdh: 400px" src="';
						imgTag += '${pageContext.request.contextPath}/displayImage?imgName=' + resp.fileName;
						imgTag += '"/>';
						
					oEditors.getById['smartEditor'].exec("PASTE_HTML", [imgTag]);
				}
			});
			
		}
		
	</script>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>