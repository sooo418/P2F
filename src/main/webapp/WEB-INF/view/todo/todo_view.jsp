<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Strata by HTML5 UP</title>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
		</script>

<script type="text/javascript">
		function todoupdate(){
			f.action = "${pageContext.request.contextPath}/todo/update.do";
			f.method = "get";
			f.submit();		
			}
		
		function todoremove(){
			if ( confirm("정말 삭제하시겠습니까?") ) {
				f.action="${pageContext.request.contextPath}/todo/remove.do";
				f.submit();
			}
		}
		$(document).ready(function(){
			var td = $('.todopriority');
			var tc = $('.todopri');
			var tcon = $('.todocon');
			td.each(function(index){
				var todocontent = tcon.eq(index).text();
				if(todocontent.length>=9){
					tcon.eq(index).text(todocontent.substr(0,6)+'..');
				}
			    var todopriority = td.eq(index).html();
			    if(todopriority==1){
			    	tc.eq(index).text("◆◆◆");
			    	tc.eq(index).css("color", "#ff0000");
			    }
			    if(todopriority==2){
			    	tc.eq(index).text("◆◆");
			    	tc.eq(index).css("color", "#ff1a75");
			    }
			    if(todopriority==3){
			    	tc.eq(index).css("color", "#ff9966");
			    }
			})
		})
		function addBoard(){
         f.action="${pageContext.request.contextPath}/todo/addboard.do";
         f.submit();
      }
		</script>
</head>
<body>
	<c:if test="${!empty login}">
		<!-- Header -->
		<header id="header">
			<div class="inner">
				<jsp:include page="../todoMenu.jsp" />

			</div>
		</header>
	</c:if>
	<c:if test="${empty login}">
		<%
			response.sendRedirect("../index.do");
		%>
	</c:if>

	<!-- Main -->
	<div id="main">

		<div style="height: 25px;"></div>
		<form action="" method="get" name="f">
			<div class="viewdiv"
				style="font-family: 'Font Awesome 5 Free'; text-align: center;">
				<h2 style="text-align: left; font-size: 150%; margin: 1em 1em;">Schedule</h2>
				<h3 style="text-align: right; margin: 0 20px 0 0;">Date:${todo.tododate}</h3>

				<hr style="margin: 1em 0;">
				<p style="text-align: left; margin: 1em 1em; height: 120px;">${todo.tcontent}
					<br> <br>
					<c:if test="${!empty todo.sharing}">
						<h3 style="text-align: left; font-size: 110%; margin: 1em 1em;">Friends:
							${todo.sharing}</h3>
					</c:if>
					<c:if test="${!empty todo.latitude}">
						<h4 style="text-align: left; margin: 2em 0 1em 2em;">Map</h4>
						<div id="map"
							style="width: 700px; height: 300px; margin: 0 0 0 30px;"></div>

						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a4ff6fe196bdd8b758105466f4bfae97"></script>
						<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(${todo.latitude}, ${todo.longitude}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var markerPosition  = new daum.maps.LatLng(${todo.latitude}, ${todo.longitude}); 

var marker = new daum.maps.Marker({
    position: markerPosition
});

marker.setMap(map);

</script>
					</c:if>

					<input type="hidden" name="tseq" value="${todo.tseq}"> <input
						type="hidden" name="id" value="${todo.id}"> <input
						style="border: solid 3px #18e78f; float: left; margin:2em;"
						id="ut" type="button" value="수정하기" onclick="todoupdate()">

					<input
						style="border: solid 3px #18e78f; float: left; margin: 2em;"
						class="rt" type="button" value="삭제하기" onclick="todoremove()">
					<input type="button" value="일기로 등록" onClick="addBoard()"
						class="primary" style="float: left; margin: 2em;">
			</div>
		</form>
		<script
		src='${pageContext.request.contextPath}/fullcal/lib/moment.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/fullcal/lib/jquery.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/fullcal/fullcalendar.min.js'></script>
	<script src='${pageContext.request.contextPath}/fullcal/lang-all.js'></script>
</body>
</html>