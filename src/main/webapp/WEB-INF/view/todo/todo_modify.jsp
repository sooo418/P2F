<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML>
<!--
	Strata by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
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
	$(document).ready(function() {
		var td = $('.todopriority');
		var tc = $('.todopri');
		var tcon = $('.todocon');
		td.each(function(index) {
			var todocontent = tcon.eq(index).text();
			if (todocontent.length >= 9) {
				tcon.eq(index).text(todocontent.substr(0, 6) + '..');
			}
			var todopriority = td.eq(index).html();
			if (todopriority == 1) {
				tc.eq(index).text("◆◆◆");
				tc.eq(index).css("color", "#ff0000");
			}
			if (todopriority == 2) {
				tc.eq(index).text("◆◆");
				tc.eq(index).css("color", "#ff1a75");
			}
			if (todopriority == 3) {
				tc.eq(index).css("color", "#ff9966");
			}
		})
	})
</script>
</head>
<body class="is-preload">
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


		<!-- Three -->
		<section id="three">
			<h2 style="text-align: center;">Update Schedule</h2>

			<div class="col-8 col-12-small">
				<form name="tform" method="post" action="update.do">
					<input type="hidden" name="tseq" id="tseq" value="${todo.tseq}">
					<input type="hidden" name="id" id="id" value="${user.id}">
					<div class="col-12">
						<select style="border: solid 2px #18e78f;" class="todoselect"
							name="year" id="year">
							<option value="">- 년도 -</option>
							<option value="2019">2019</option>
							<option value="2020">2020</option>
							<option value="2021">2021</option>
							<option value="2022">2022</option>
							<option value="2023">2023</option>
							<option value="2024">2024</option>
							<option value="2025">2025</option>
							<option value="2026">2026</option>
							<option value="2027">2027</option>
							<option value="2028">2028</option>
							<option value="2029">2029</option>
							<option value="2030">2030</option>
						</select> <select style="border: solid 2px #18e78f;" class="todoselect"
							name="month" id="month">
							<option value="">- 월 -</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select> <select style="border: solid 2px #18e78f;" class="todoselect"
							name="day" id="day">
							<option value="">- 일 -</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
						</select> <select style="border: solid 2px #18e78f;" class="todoselect"
							name="hour" id="hour">
							<option value="">- 시 -</option>
							<option value="00">00</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
						</select> <select style="border: solid 2px #18e78f;" class="todoselect"
							name="min" id="min">
							<option value="">- 분 -</option>
							<option value="00">00</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
							<option value="32">32</option>
							<option value="33">33</option>
							<option value="34">34</option>
							<option value="35">35</option>
							<option value="36">36</option>
							<option value="37">37</option>
							<option value="38">38</option>
							<option value="39">39</option>
							<option value="40">40</option>
							<option value="41">41</option>
							<option value="42">42</option>
							<option value="43">43</option>
							<option value="44">44</option>
							<option value="45">45</option>
							<option value="46">46</option>
							<option value="47">47</option>
							<option value="48">48</option>
							<option value="49">49</option>
							<option value="50">50</option>
							<option value="51">51</option>
							<option value="52">52</option>
							<option value="53">53</option>
							<option value="54">54</option>
							<option value="55">55</option>
							<option value="56">56</option>
							<option value="57">57</option>
							<option value="58">58</option>
							<option value="59">59</option>
						</select>
					</div>
					<script type="text/javascript">
						$("#year")
								.change(
										function() {
											var tododate = $(
													"#year option:checked")
													.text()
													+ '.';
											tododate += $(
													"#month option:checked")
													.text()
													+ '.';
											tododate += $("#day option:checked")
													.text()
													+ "\u00A0";
											tododate += $(
													"#hour option:checked")
													.text()
													+ ':';
											tododate += $("#min option:checked")
													.text();
											document.tform.tododate.value = tododate;

										})
						$("#month")
								.change(
										function() {
											var tododate = $(
													"#year option:checked")
													.text()
													+ '.';
											tododate += $(
													"#month option:checked")
													.text()
													+ '.';
											tododate += $("#day option:checked")
													.text()
													+ "\u00A0";
											tododate += $(
													"#hour option:checked")
													.text()
													+ ':';
											tododate += $("#min option:checked")
													.text();
											document.tform.tododate.value = tododate;

										})
						$("#day")
								.change(
										function() {
											var tododate = $(
													"#year option:checked")
													.text()
													+ '.';
											tododate += $(
													"#month option:checked")
													.text()
													+ '.';
											tododate += $("#day option:checked")
													.text()
													+ "\u00A0";
											tododate += $(
													"#hour option:checked")
													.text()
													+ ':';
											tododate += $("#min option:checked")
													.text();
											document.tform.tododate.value = tododate;

										})
						$("#hour")
								.change(
										function() {
											var tododate = $(
													"#year option:checked")
													.text()
													+ '.';
											tododate += $(
													"#month option:checked")
													.text()
													+ '.';
											tododate += $("#day option:checked")
													.text()
													+ "\u00A0";
											tododate += $(
													"#hour option:checked")
													.text()
													+ ':';
											tododate += $("#min option:checked")
													.text();
											document.tform.tododate.value = tododate;

										})
						$("#min")
								.change(
										function() {
											var tododate = $(
													"#year option:checked")
													.text()
													+ '.';
											tododate += $(
													"#month option:checked")
													.text()
													+ '.';
											tododate += $("#day option:checked")
													.text()
													+ "\u00A0";
											tododate += $(
													"#hour option:checked")
													.text()
													+ ':';
											tododate += $("#min option:checked")
													.text();
											document.tform.tododate.value = tododate;

										})
					</script>
					<input style="border: solid 2px #18e78f; margin: 0.5em 0 0.5em 0;"
						type="text" readonly="readonly" name="tododate" id="tododate"
						value="${todo.tododate}"> <font color="red"><form:errors
							path="todo.tododate" /></font>
					<div class="row gtr-uniform gtr-50">
						<div class="col-12">
							<textarea style="border: solid 2px #18e78f;" name="tcontent"
								id="tcontent" placeholder="내용" rows="4"></textarea>
							<font color="red"><form:errors path="todo.tcontent" /></font>
						</div>
						<div class="col-6 col-12-xsmall">
							<input style="border: solid 2px #18e78f; margin: 0 0 1em 0;"
								type="text" name="sharing" id="sharing" placeholder="함깨 할 친구 ID" />
						</div>
					</div>
					<div class="col-4 col-12-small">
						<input type="radio" id="demo-priority-low" name="priority" value=3
							checked> <label for="demo-priority-low">Low
							Priority</label>
					</div>
					<div class="col-4 col-12-small">
						<input type="radio" id="demo-priority-normal" name="priority"
							value=2> <label for="demo-priority-normal">Normal
							Priority</label>
					</div>
					<div class="col-4 col-12-small">
						<input type="radio" id="demo-priority-high" name="priority"
							value=1> <label for="demo-priority-high">High
							Priority</label>
					</div>
					<div id="map" style="width: 700px; height: 350px;"></div>
					<p>
						<em>지도를 클릭해 예정 일의 위치를 정해주세요!</em>
					</p>

					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a4ff6fe196bdd8b758105466f4bfae97"></script>
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new daum.maps.LatLng(37.501307708733954,
									127.03963012088586), // 지도의 중심좌표
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
							document.tform.latitude.value = latitude;
							document.tform.longitude.value = longitude;

						});
					</script>
					<input type="hidden" name="latitude" id="latitude" value="">
					<input type="hidden" name="longitude" id="longitude" value="">
					<div>
						<input
							style="border: solid 3px #18e78f; float: right; margin: 0 2em 2em 0;"
							class="ub" type="submit" value="Update Schedule" />
					</div>
				</form>
			</div>

		</section>
	</div>


	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.poptrox.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script
		src='${pageContext.request.contextPath}/fullcal/lib/moment.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/fullcal/lib/jquery.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/fullcal/fullcalendar.min.js'></script>
	<script src='${pageContext.request.contextPath}/fullcal/lang-all.js'></script>
</body>
</html>