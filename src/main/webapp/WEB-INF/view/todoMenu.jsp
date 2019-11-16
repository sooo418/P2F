<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
	
</script>
<script>
	//날짜교체 - 클릭시 해당 메소드 호출
	function onchangeDay(yyyy, mm, dd, ss) {
		$("#nows").html(yyyy + mm + dd);
		var cal = $('#nows').text();
		var index = location.href.indexOf("ooo") + 3;
		var href = location.href.substr(index);
		var url = "${pageContext.request.contextPath}/todo/cal.do?tododate="
				+ cal + "&href=" + href;
		window.location.href = url;
	}
</script>

<script>
	$(document).ready(
			function() {
				var currentLangCode = 'ko';

				// build the language selector's options
				$.each($.fullCalendar.langs, function(langCode) {
					$('#lang-selector').append(
							$('<option/>').attr('value', langCode).prop(
									'selected', langCode == currentLangCode)
									.text(langCode));
				});

				// rerender the calendar when the selected option changes
				$('#lang-selector').on('change', function() {
					if (this.value) {
						currentLangCode = this.value;
						$('#calendar').fullCalendar('destroy');
						renderCalendar();
					}
				});

				function renderCalendar() {
					$('#calendar').fullCalendar({
						header : {
							left : 'prev,next today',
							center : 'title',
							right : ''
						},
						defaultDate : new Date,
						lang : currentLangCode,
						buttonIcons : false, // show the prev/next text
						editable : true,
						dayClick : function(date, allDay, jsEvent, view) {
							var yy = date.format("YYYY");
							var mm = date.format("MM");
							var dd = date.format("DD");
							var ss = date.format("dd");
							onchangeDay(yy, mm, dd, ss);
						},
						eventClick : function(calEvent, jsEvent, view) {
							return false;
						},
						eventLimit : true, // allow "more" link when too many events
					});
				}

				renderCalendar();
			});
</script>
<script>
	function Logout() {
		f1.action = "${pageContext.request.contextPath}/logout.do"
		f1.submit();
	}
	$(document)
			.ready(function() {
				var td = $('.todopriority');
				var tc = $('.todopri');
				var tcon = $('.todocon');
				td.each(function(index) {
					var todocontent = tcon.eq(index).text();
					if (todocontent.length >= 7) {
						tcon.eq(index).text(todocontent.substr(0, 4) + '..');
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
<body>
	<div class="inner">
		<jsp:include page="infoMenu.jsp"></jsp:include>

		<form id="tf" method="get">
			<div style="width: 100%; height: 180px; overflow: auto;">
				<table id="todolist" style="width: 362px;">
					<tr style="height: 25px;">
						<th>priority</th>
						<th>Schedule</th>
						<th>Date</th>
						<th>Friends</th>
						<th>view</th>
						<c:forEach var="todo" items="${todos}">
							<tr>
								<td style="display: none;" class="todopriority">${todo.priority}</td>
								<td class="todopri">◆</td>
								<td class="todocon">${todo.tcontent}</td>
								<td>${todo.tododate}</td>
								<td>${todo.sharing}</td>
								<td><input id="tview" type="button"
									onclick="location.href='${pageContext.request.contextPath}/todo/view.do?tseq='+${todo.tseq}"
									value="view"></td>
							</tr>
						</c:forEach>
				</table>
			</div>
		</form>
		<form method="get"
			action="${pageContext.request.contextPath}/todo/add.do">
			<table>
				<tr>
					<td style="padding: 2px;"><input id="writetodo"
						style="min-width: 120px; padding: 0; height: 40px; line-height: 0px; float: right;"
						type="submit" value="Write Schedule"></td>
				</tr>
			</table>
		</form>
	</div>
	<div style="float: center; width: 100%;" id="calendar">
		<p style="display: none" class="date" id="nows"></p>
	</div>

</body>
</html>