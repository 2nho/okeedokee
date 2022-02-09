var init_Announcement_detail = function () {
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 9 // 지도의 확대 레벨
	    };  
	$("#map_enlargement").on("click", function () {
		$(".enlargement-map").css('display', 'block');
		$(".main-content-map").css('display', 'none');
		$(".Announcement-btn").css('flex-direction', 'row');
		$(".Announcement-btn").css('right', '3%');
		$(".Announcement-btn").css('bottom', '5%');
		$("#map_reduction").css('display', 'block');
		
		var mapContainer = document.getElementById('map2');
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
			// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		var dogId = $(".shelter-detail").attr('id');
		var splitDogId = dogId.split(':');
		
		var shelterId = $(".shelter-name").attr('id');
		var splitshelterId = shelterId.split(':');
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch("'" + splitDogId[1] + "'", function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
				
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + splitshelterId[1] + '</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
	});
	
	$("#map_reduction").on("click", function(){
		$(".enlargement-map").css('display', 'none');
		$(".main-content-map").css('display', 'block');
		$(".Announcement-btn").css('flex-direction', 'column');
		$(".Announcement-btn").css('right', '30%');
		$(".Announcement-btn").css('bottom', '5%');
		$("#map_reduction").css('display', 'none');
		
		var mapContainer = document.getElementById('map');
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
			// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		var dogId = $(".shelter-detail").attr('id');
		var splitDogId = dogId.split(':');
		
		var shelterId = $(".shelter-name").attr('id');
		var splitshelterId = shelterId.split(':');
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch("'" + splitDogId[1] + "'", function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
				
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + splitshelterId[1] + '</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});
	});
	
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	var dogId = $(".shelter-detail").attr('id');
	var splitDogId = dogId.split(':');
	
	var shelterId = $(".shelter-name").attr('id');
	var splitshelterId = shelterId.split(':');
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch("'" + splitDogId[1] + "'", function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			console.log(splitshelterId[1]);
			console.log(result[0].y);
			console.log(result[0].x);
			$("#road_search").on("click", function(){
				location.href = "https://map.kakao.com/link/to/" + splitshelterId[1] + "," + result[0].y + "," + result[0].x;
			}); 
			
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords

			
	        });
			
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + splitshelterId[1] + '</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);

			console.log(result);
	    } 
	}); 
		
		
	   
}

// 상담예약 페이지 이동
$("#reservation_button").click(function() {
	$("#reservationSubmit").submit();
});

//Render
$(document).ready(function() {
    //초기 init render
    init_Announcement_detail();
});