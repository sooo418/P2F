<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
	<div>
		<a href="/ooo" class="image avatar"
			style="float: left; position: relative; left: 40px"><img
			src="${pageContext.request.contextPath}/images/${user.profile}"
			style="width: 150px; height: 120px; display: inline; text-align: left" /></a>
		<br> <br> <br>
		<h1 style="display: inline; font-size: 30px">${user.id}님&nbsp;&nbsp;&nbsp;&nbsp;</h1>

		<form id="f1" method="get" style="clear: both"
			action="${pageContext.request.contextPath}/user/view.do?id=${user.id}">
			<div style="text-align: center; margin-bottom: 1em">
				<input type="button" value="logout" class="button small"
					onclick="Logout()"> <a
					href="${pageContext.request.contextPath}/user/view.do?id=${user.id}"
					class="button small"> 프로필 수정</a>
			</div>
		</form>
	</div>
</body>
</html>