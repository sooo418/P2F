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

</head>
<body>
	<header id="header" style="padding: 32px 8px 16px 8px;">
		<jsp:include page="../todoMenu.jsp" />
	</header>

	<div id="main">

		<section>
			<h2 align="center">회원정보 수정</h2>
			<hr>
			<!-- view Form  -->
			<form name="f" method="post" action="update.do"
				enctype="multipart/form-data">
				<input type="hidden" name="id" value="${user.id}">
				<div class="row gtr-uniform gtr-50">

					<div class="col-6 col-12-xsmall">
						ID <input type="text" value="${user.id}" readonly="readonly">
					</div>
					<div class="col-6 col-12-xsmall">
						<input type="hidden" value="${user.id}">
					</div>
					<div class="col-6 col-12-xsmall">
						PASSWORD<input type="text" name="pw" value="${user.pw}"
							onkeyup="checkPw()">
					</div>
					<div class="col-6 col-12-xsmall">
						PASSWORD CHECK <input type="text" name="pw2" value="${user.pw}"
							onkeyup="checkPw()">
					</div>
					<div class="col-6 col-12-xsmall">
						NAME <input type="text" name="name" value="${user.name}">
					</div>
					<div class="col-6 col-12-xsmall">
						NICKNAME <input type="text" name="nickname"
							value="${user.nickname}">
					</div>
					<div class="col-6 col-12-xsmall">
						PHONE<input type="text" name="phone" value="${user.phone}">
					</div>
					<div class="col-4 col-12-small">
						GENDER<br /> <input type="radio" name="gender" id="radio1"
							value="여자"
							<c:if test="${ user.gender eq '여자'}">checked="checked"</c:if> />
						<label for="radio1">여자</label> <input type="radio" name="gender"
							id="radio2" value="남자"
							<c:if test="${ user.gender eq '남자'}">checked="checked"</c:if> />
						<label for="radio2">남자</label>

					</div>
					<div class="col-12">
						QUESTION <select name="question">
							<option value="">- 비밀번호 찾기 질문을 선택하세요 -</option>
							<option value="1">내 보물 1호는?</option>
							<option value="1">가장 기억에 남는 장소는?</option>
							<option value="1">가장 좋아하는 커피 메뉴는?</option>
						</select>
					</div>

					<div class="col-6 col-12-xsmall" style="width: 100%">
						ANSWER<input type="text" name="hint" value="${user.hint}"
							id="hint" />
					</div>

					<div class="col-6 col-12-xsmall">
						PROFILE <br> <input type="file" name="file" value=""><br>
					</div>
					<input type="hidden" name="profile" id="profile"
						value="${user.profile}" placeholder="이미지를 등록하세요" />
				</div>
				<input type="submit" value="저장" style="margin-top: 1em">
			</form>
		</section>
	</div>
	<script
		src="${pageContext.request.contextPath}/assets/js/user_modify.js"></script>
</body>
</html>