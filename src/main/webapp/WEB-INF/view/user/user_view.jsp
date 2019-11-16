<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<head>
<title>사용자 관리</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<script>
	/* function userModify() {
		f.action = "modify.do";
		f.submit();
	} */
</script>
</head>
<body>
	<header id="header">
		<%--<jsp:include page="${pageContext.request.contextPath}/loginMenu.jsp" /> --%>
		<jsp:include page="../todoMenu.jsp" />
	</header>


	<div id="main">
		<section>
			<h2 align="center">회원정보</h2>
			<hr>
			<!-- view Form  -->
			<form name="f" method="post" action="modify.do">
				<input type="hidden" name="id" value="${user.id}">
				<div class="row gtr-uniform gtr-50">

					<div class="col-6 col-12-xsmall">
						ID<input type="text" value="${user.id}" readonly="readonly">
					</div>
					<div class="col-6 col-12-xsmall">
						<input type="hidden" value="${user.id}" readonly="readonly">
					</div>
					<div class="col-6 col-12-xsmall">
						PASSWORD<input type="text" value="${user.pw}" readonly="readonly">
					</div>
					<div class="col-6 col-12-xsmall">
						<input type="hidden" value="${user.pw}">
					</div>
					<div class="col-6 col-12-xsmall">
						NAME<input type="text" value="${user.name}" readonly="readonly">
					</div>
					<div class="col-6 col-12-xsmall">
						NICKNAME<input type="text" value="${user.nickname}"
							readonly="readonly">
					</div>
					<div class="col-6 col-12-xsmall">
						PHONE<input type="text" value="${user.phone}" readonly="readonly">
					</div>
					<div class="col-4 col-12-small">
						GENDER<br /> <input type="radio" name="gender" id="radio1"
							value="여자"
							<c:if test="${ user.gender eq '여자'}">checked="checked"</c:if> disabled="disabled" />
						<label for="radio1">여자</label> <input type="radio" name="gender"
							id="radio2" value="남자"
							<c:if test="${ user.gender eq '남자'}">checked="checked"</c:if>
							disabled="disabled" /> <label for="radio2">남자</label>

					</div>
					<div class="col-6 col-12-xsmall">
						HINT<input type="text" value="${user.hint}" readonly="readonly">
					</div>
					<div class="col-6 col-12-xsmall">
						PROFILE<input type="text" value="${user.profile}"
							readonly="readonly">
					</div>
				</div>
				<input type="submit" value="수정" style="margin-top: 1em">
			</form>
		</section>
	</div>

</body>
</html>