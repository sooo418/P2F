<%@page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE HTML>
<html>
<head>
<title>글 등록</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />

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
	function boardCreate() {
		f.action = "${pageContext.request.contextPath}/board/add.do";
		f.method = "post";
		f.submit();
	}

	function boardList() {
		f.action = "../index.do";
		f.submit();
	}
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
			<h2>Elements</h2>

			<section>
				<h4>Form</h4>
				<form method="post" action="" name="f" enctype="multipart/form-data">
					<div class="row gtr-uniform gtr-50">

						<div class="col-12">
							<select name="open" id="demo-category">
								<option value="">- 공개여부 -</option>
								<option value="All">All</option>
								<option value="friends">friends</option>
								<option value="None">None</option>
							</select>
						</div>

						<div class="col-12">
							<textarea name="bcontent" id="demo-message"
								placeholder="Enter your message" rows="6">${board.bcontent}
								
							</textarea>
						</div>



						<div class="col-6 col-12-xsmall">
							<input type="file" name="uploadFile" id="demo-name" value=""
								placeholder="이미지를 등록하세요" />
						</div>

						<div class="col-6 col-12-xsmall">
							<input type="hidden" name="id" id="demo-email" value="${board.id}"
								placeholder="ID입력" />
						</div>



						<div class="col-6 col-12-xsmall">
							<div id="map" style="width: 500px; height: 350px;"></div>
							<p>
								<em>지도를 클릭해 위치를 정해주세요!</em>
							</p>
						</div>

						<input type="hidden" name="latitude" id="lat" value="${board.latitude}"> <input
							type="hidden" name="longitude" id="lng" value="${board.longitude}">



						<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								center : new daum.maps.LatLng(
										37.501307708733954, 127.03963012088586), // 지도의 중심좌표
								level : 3
							// 지도의 확대 레벨
							};

							var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

							// 지도를 클릭한 위치에 표출할 마커입니다
							var marker = new daum.maps.Marker({
								// 지도 중심좌표에 마커를 생성합니다 
								position : map.getCenter()
							});
							// 지도에 마커를 표시합니다
							marker.setMap(map);

							// 지도에 클릭 이벤트를 등록합니다
							// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
							daum.maps.event.addListener(map, 'click', function(
									mouseEvent) {

								// 클릭한 위도, 경도 정보를 가져옵니다 
								var latlng = mouseEvent.latLng;

								// 마커 위치를 클릭한 위치로 옮깁니다
								marker.setPosition(latlng);

								var latitude = latlng.getLat();
								var longitude = latlng.getLng();
								document.f.latitude.value = latitude;
								document.f.longitude.value = longitude;

							});
						</script>




						<div class="col-12">
							<ul class="actions">
								<li><input type="button" value="글 등록"
									onClick="boardCreate()" class="primary"></li>
								<li><input type="button" value="홈으로" onClick="boardList()"
									class="primary"></li>
								<li><input type="reset" value="Reset" /></li>
							</ul>
						</div>
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
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.poptrox.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script
		src='${pageContext.request.contextPath}/fullcal/lib/moment.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/fullcal/lib/jquery.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/fullcal/fullcalendar.min.js'></script>
	<script src='${pageContext.request.contextPath}/fullcal/lang-all.js'></script>

</body>
</html>