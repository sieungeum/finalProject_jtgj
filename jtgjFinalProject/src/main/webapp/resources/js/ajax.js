"use strict";

jQuery(window).load(function($) {

    var container = jQuery("#work-grid"); // 데이터를 추가할 컨테이너
    const limit = 2; // 한 번에 가져올 데이터 수
    
    jQuery('#load-more-2col').click(function (e) {
        e.preventDefault(); // 기본 동작 방지
		
        var self = jQuery(this);
        self.hide(); // 버튼 숨김
        var loadanim = jQuery('a#load-more-2col i'); // 로딩 애니메이션
        loadanim.addClass('spinef'); // 로딩 효과 추가

    	// AJAX 요청
        jQuery.ajax({
            url: "/finalProject/projectsLoadRandom", 
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                displayedPtNos: window.displayedPtNos || [], // 이미 표시된 pt_no 목록
                limit: limit // 로드할 카드 수
            }),
            success: function (data) {
                if (data.length === 0) {
                    // 추가 데이터가 없을 경우 알림
                    alert("더 이상 불러올 데이터가 없습니다.");
                    self.hide();
                    loadanim.removeClass('spinef'); // 로딩 효과 제거
                    return;
                }

                // 새로운 데이터를 담을 변수
                var newItems = "";

                // 반복문을 통해 카드 생성
                data.forEach(function (project) {
                    newItems += '<div class="col-md-6 col-sm-6 col-xs-12" style="margin-top:20px;">' +
                                    '<div class="img home-portfolio-image" style="width:550px; height:300px;">' +
                                        '<img src="/finalProject/displayProfImg?atchtype=companyProject&imgName=' + project.ptThumbnail + '" alt="Portfolio Item" style="width:100%;height:100%;">' +
                                        '<div class="overlay-thumb">' +
                                            '<div class="details">' +
                                                '<span class="title">' + project.ptTitle + '</span>' +
                                                '<span class="info">' + project.userName + '</span>' +
                                            '</div>' +
                                            '<span class="btnBefore"></span>' +
                                            '<span class="btnAfter"></span>' +
                                            '<a class="main-portfolio-link" href="/finalProject/companyProjectDetailView?ptNo=' + project.ptNo + '&cpBoardNo=' + project.cpBoardNo + '"></a>' +
                                        '</div>' +
                                    '</div>' +
                                '</div>';
                    // displayedPtNos 배열에 추가
                    window.displayedPtNos.push(project.ptNo);
                });
                
                // 동적으로 추가된 요소를 jQuery 객체로 변환
                var $newElems = jQuery(newItems);
                
                // 컨테이너에 새로운 요소 추가 및 Isotope 레이아웃 갱신
                container.append($newElems).isotope('appended', $newElems);

                // 레이아웃 다시 계산
	            container.imagesLoaded(function () {
	                container.isotope('layout');
	            });

                // 로딩 효과 제거 및 버튼 표시
                loadanim.removeClass('spinef');
                self.show();
            },
            error: function () {
                alert("데이터 로드에 실패했습니다.");
                loadanim.removeClass('spinef'); // 로딩 효과 제거
                self.show(); // 버튼 다시 표시
            }
        });
    });
});