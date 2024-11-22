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
		
		.marT30{
			margin_top: 100px;
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
            <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">공지사항 수정</h2>
            <!-- Icon Divider-->
            <div class="divider-custom">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                <div class="divider-custom-line"></div>
            </div>
            <!-- Contact Section Form-->
            <div class="dFjcC marT30">
                <div class="col-lg-8 col-xl-7">
                
                	<input type="file" id="inputImg" accept="image/*" style="display: none;" onchange="f_sendImg()">
                	
                	<form id="noticeWriteForm" action="${pageContext.request.contextPath }/noticeEditDo" method="POST">
                		<!-- 사용자에게는 보이지 않고 submit 시 전송됨 -->
                		<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
                		
	             		<div class="mb-5">
	             			<label for="inputTitle">제목</label>
	                    	<input class="form-control" type="text" name="noticeTitle" value="${notice.noticeTitle }" />
	                    </div>
	                    
	                    <div class="mb-5">
	                         <textarea id="smartEditor" class="form-control"  name="noticeContent" >${notice.noticeContent }</textarea>
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
	
	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp" %>
	
	<script type="text/javascript">
        // 스마트 에디터 초기화
        var oEditors = [];

        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "smartEditor",
            sSkinURI: "${pageContext.request.contextPath}/nse/SmartEditor2Skin.html",
            fOnAppLoad: function() {
                console.log("스마트 에디터가 로드되었습니다.");
                
                // 0.5초 후에 iframe 접근 시도
                setTimeout(() => {
                    const v_iframe = document.querySelector('#noticeWriteForm iframe');
                    if (v_iframe && v_iframe.contentWindow) {
                        const v_iframeDocument = v_iframe.contentWindow.document;
                        console.log("iframe 접근 성공:", v_iframeDocument);

                        const photoUploadBtn = v_iframeDocument.querySelector('#photoUploadBtn');
                        if (photoUploadBtn) {
                            photoUploadBtn.addEventListener('click', function() {
                                document.getElementById('inputImg').click();
                            });
                        } else {
                            console.warn("이미지 업로드 버튼을 찾지 못했습니다.");
                        }
                    }
                }, 500);
            }
        });

        // 글 등록 버튼 클릭 시 스마트 에디터 내용 반영 후 폼 제출
        document.getElementById('writeBtn').addEventListener('click', function() {
            // 에디터 내용 업데이트
            oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
            
            const content = document.getElementById("smartEditor").value;
            console.log("에디터 내용:", content);

            document.getElementById('noticeWriteForm').submit();
        });

        // 이미지 업로드 함수
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
	
</body>
</html>