
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8" />
<link rel='stylesheet' href='fullcal/lib/cupertino/jquery-ui.min.css' />

<script src="${pageContext.request.contextPath}/assets/js/todo_cal.js"></script>
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
									onclick="location.href='todo/view.do?tseq='+${todo.tseq}"
									value="view"></td>
							</tr>
						</c:forEach>
				</table>
			</div>
		</form>
		<form method="get" action="todo/add.do">
			<table>
				<tr>
					<td style="padding: 2px;"><input
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