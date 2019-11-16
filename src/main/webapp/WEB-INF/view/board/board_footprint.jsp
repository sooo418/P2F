<%@page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE HTML>
<html>
<head>
<title>발자취</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/fullcal/lib/cupertino/jquery-ui.min.css' />
<link href='${pageContext.request.contextPath}/fullcal/fullcalendar.css'
	rel='stylesheet' />
<link
	href='${pageContext.request.contextPath}/fullcal/fullcalendar.print.css'
	rel='stylesheet' media='print' />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a4ff6fe196bdd8b758105466f4bfae97"></script>

<script>
   /*    function boardList() {
      f.action = "../index.do"; //발자취 확인 후 메인 화면 복귀.. 
      f.submit();
      } */
      </script>
</head>
<body class="is-preload">

	<!-- Header -->
	<header id="header">
		<jsp:include page="../todoMenu.jsp" />
	</header>

	<!-- Main -->
	<div id="main">

		<!-- Four -->

		<section id="four">
			<h2>나의 발자취</h2>

			<section>


				<form method="post" action="" name="f">
					<div class="row gtr-uniform gtr-50">


						<div class="col-6 col-12-xsmall">
							<div id="map" style="width: 700px; height: 500px;"></div>

						</div>
						<div class="col-6 col-12-xsmall">
							<input type="hidden" name="latitude" id="latitude" value="">
							<input type="hidden" name="longitude" id="longitue" value="">
						</div>

						<div class="col-6 col-12-xsmall">
							<input type="button" value="목록 " onClick="boardList()">
						</div>

						<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  

mapOption = { 
    center: new daum.maps.LatLng(37.501307708733954, 127.03963012088586), // 지도의 중심좌표
    level: 7 // 지도의 확대 레벨
};

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


//지도에 표시된 마커 객체를 가지고 있을 배열입니다
var markers = [];
var linePath2 = [];
//마커 하나를 지도위에 표시합니다 
<c:forEach var="board" items="${boards}">
var imageSrc = "${pageContext.request.contextPath}/images/projectimg/${board.img}";
var imageSize = new daum.maps.Size(50, 50);


addMarker(new daum.maps.LatLng(${board.latitude}, ${board.longitude}), new daum.maps.MarkerImage(imageSrc, imageSize));
linePath2.push(new daum.maps.LatLng(${board.latitude}, ${board.longitude})); 


</c:forEach>
//마커를 생성하고 지도위에 표시하는 함수입니다
function addMarker(position, markerImage) {

// 마커를 생성합니다
var marker = new daum.maps.Marker({
	map:map,
    position: position,
    image : markerImage
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 생성된 마커를 배열에 추가합니다
markers.push(marker);
}

//배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
function setMarkers(map) {
for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
}            
}

var linePath = [
    new daum.maps.LatLng(33.452344169439975, 126.56878163224233),
    new daum.maps.LatLng(33.452739313807456, 126.5709308145358),
    new daum.maps.LatLng(33.45178067090639, 126.5726886938753) 
];//얘는 안씀 ㅋ
 
// 지도에 표시할 선을 생성합니다
var polyline = new daum.maps.Polyline({
    path: linePath2, // 선을 구성하는 좌표배열 입니다
    strokeWeight: 4, // 선의 두께 입니다
    strokeColor: '#D358F7', // 선의 색깔입니다
    strokeOpacity: 0.6, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'solid' // 선의 스타일입니다
});

// 지도에 선을 표시합니다 
polyline.setMap(map);   
 
 



</script>
					</div>
				</form>
			</section>

		</section>

	</div>

	<!-- Footer -->
	<footer id="footer">
		<div class="inner">
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-github"><span
						class="label">Github</span></a></li>
				<li><a href="#" class="icon brands fa-dribbble"><span
						class="label">Dribbble</span></a></li>
				<li><a href="#" class="icon solid fa-envelope"><span
						class="label">Email</span></a></li>
			</ul>
			<ul class="copyright">
				<li>&copy; Untitled</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>
	</footer>

	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.poptrox.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/board.js"></script>
	<script src='${pageContext.request.contextPath}/fullcal/lib/moment.min.js'></script>
	<script src='${pageContext.request.contextPath}/fullcal/lib/jquery.min.js'></script>
	<script src='${pageContext.request.contextPath}/fullcal/fullcalendar.min.js'></script>
	<script src='${pageContext.request.contextPath}/fullcal/lang-all.js'></script>

</body>
</html>