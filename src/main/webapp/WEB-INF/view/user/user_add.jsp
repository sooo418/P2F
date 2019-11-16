<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<head>
<title>Strata by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<script>
	function addUser() {
		a.action = "add.do"
		a.submit();
	}

	function selectImg() {
		a.action = "report.do"
		a.submit();
	}
	function checkIdFirst() {
		var passRule = /^[A-Za-z0-9]{6,12}$/;
		if (!passRule.test($("input[id='uid']").val()
				|| $("#uid").val().length < 6)) {
			$("#uid").css("border-color", "RED");
			$("#uid").attr("placeholder", "영어와 숫자를 조합한 6~12글자를 입력하세요.");

		} else {
			$("#uid").css("border-color", "#49bf9d");
		}

	}
	function checkId() {
		var id = $("#uid").val();

		var idck = 0;
		$.ajax({
			url : "idcheck.do",
			type : 'POST',
			dataType : 'json',
			data : {
				"id" : id
			},
			success : function(data) {
				if (data > 0) {
					$("#uid").css("border-color", "RED");
					$("#uid").val("");
					$("#uid").attr("placeholder", "이미 사용 중인 ID 입니다.");
				} else {
					$("#uid").css("border-color", "#49bf9d");
				}
			},
			error : function(error, status) {
				alert("ajax 통신 ERROR");
			}
		});

	}

	function checkPw() {
		if ($("#pw").val() != $("#pw2").val() || $("#pw").val().length < 6) {
			if ($("#pw").val().length < 6)
				$("#pw2").attr("placeholder", "비밀번호를 6자리 이상 입력하세요.");
			else
				$("#pw2").attr("placeholder", "비밀번호가 일치하지 않습니다.");
			$("#pw").css("border-color", "RED");
			$("#pw2").css("border-color", "RED");

		} else {
			$("#pw").css("border-color", "#49bf9d");
			$("#pw2").css("border-color", "#49bf9d");
		}
	}

	function check() {
		var name = $('#name').val();
		var nickname = $('#nickname').val();
		var phone = $('#phone').val();
		var hint = $('#hint').val();

		if (name.length >= 2)
			$('#name').css("border-color", "#49bf9d");
		else {
			$('#name').css("border-color", "RED");
			$("#name").val("");
			$("#name").attr("placeholder", "이름을 2글자 이상 입력하세요.");
			return false;
		}
		if (nickname.length >= 3)
			$('#nickname').css("border-color", "#49bf9d");
		else {
			$('#nickname').css("border-color", "RED");
			$("#nickname").val("");
			$("#nickname").attr("placeholder", "별명을 3글자 이상 입력하세요.");
			return false;
		}
		if (phone.length == 13)
			$('#phone').css("border-color", "#49bf9d");
		else {
			$('#phone').css("border-color", "RED");
			$("#phone").val("");
			$("#phone").attr("placeholder", "휴대 전화 번호를 확인하세요.");
			return false;
		}
		if (hint.length != 0)
			$('#hint').css("border-color", "#49bf9d");
		else {
			$('#hint').css("border-color", "RED");
			$("#hint").val("");
			$("#hint").attr("placeholder", "비밀번호 찾기 질문에 대한 답을 입력하세요.");
			return false;
		}
	}
</script>
</head>
<body class="is-preload">
	<c:if test="${empty login}">
		<!-- Header -->
		<header id="header" style="padding: 96px 48px 48px 48px;">
			<jsp:include page="../loginMenu.jsp" />
		</header>
	</c:if>
	<c:if test="${!empty login }">
		<header id="header">
			<jsp:include page="../infoMenu.jsp" />
		</header>
	</c:if>

	<!-- Main -->
	<div id="main">


		<section>
			<h2 align="center">회 원 가 입</h2>
			<hr>
			<form method="post" name="a" id="a" action="add.do"
				onsubmit="check()" enctype="multipart/form-data">
				<div class="row gtr-uniform gtr-50">
					<div class="col-6 col-12-xsmall">
						ID<input type="text" name="id" id="uid" value="${user.id}"
							placeholder="ID를 입력하세요" required="required"
							onkeyup="checkIdFirst()" />
						<form:errors path="user.id" />
					</div>
					<div class="col-6 col-12-xsmall">
						<BR /> <input style="color: silver;" type="button" value="중복체크"
							class="button small" onclick="checkId()">
					</div>

					<div class="col-6 col-12-xsmall">
						PASSWORD<input type="password" name="pw" id="pw"
							value="${user.pw}" onkeyup="checkPw()" placeholder="비밀번호를 입력하세요"
							required="required" />
						<form:errors path="user.pw" />
					</div>

					<div class="col-6 col-12-xsmall">
						PASSWORD CHECK<input type="password" name="pw" id="pw2"
							onkeyup="checkPw()" placeholder="비밀번호를 한 번 더 입력하세요"
							required="required" />
					</div>

					<div class="col-6 col-12-xsmall" class="inputs">
						NAME<input type="text" name="name" id="name" value="${user.name}"
							placeholder="이름을 입력하세요" required="required" />
						<form:errors path="user.name" />
					</div>

					<div class="col-6 col-12-xsmall">
						NICKNAME<input type="text" name="nickname" id="nickname"
							value="${user.nickname}" placeholder="별명을 입력하세요"
							required="required" />
						<form:errors path="user.nickname" />
					</div>


					<div class="col-6 col-12-xsmall">
						PHONE<input type="tel" name="phone" value="${user.phone}"
							id="phone" placeholder="010-0000-0000"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required="required" />
						<form:errors path="user.phone" />
					</div>
					<div class="col-4 col-12-small">
						GENDER<BR /> <input type="radio" id="gender1" name="gender"
							checked="checked" value="여자"> <label for="gender1">여자</label>
						<input type="radio" id="gender2" name="gender" value="남자">
						<label for="gender2">남자</label>
					</div>
					<div class="col-12">
						QUESTION<select name="question">
							<option value="">- 비밀번호 찾기 질문을 선택하세요 -</option>
							<option value="1">내 보물 1호는?</option>
							<option value="1">가장 기억에 남는 장소는?</option>
							<option value="1">가장 좋아하는 커피 메뉴는?</option>
						</select>
					</div>

					<div class="col-6 col-12-xsmall" style="width: 100%">
						ANSWER<input type="text" name="hint" value="${user.hint}"
							id="hint" placeholder="비밀번호 찾기 답변을 입력하세요" required="required" />
						<form:errors path="user.hint" />
					</div>

					<div class="col-6 col-12-xsmall">
						PROFILE <br> <input type="file" name="file"
							placeholder="프로필 사진을 등룍하세요"><br>
					</div>


					<div class="col-12">
						<ul class="actions">
							<li><input type="submit" value="회원 가입"></li>
							<li><input type="reset" value="초기화" /></li>
						</ul>
					</div>
				</div>
			</form>
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
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.poptrox.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<!-- 
	<script src="assets/js/user_adduser.js"></script> -->

</body>
</html>