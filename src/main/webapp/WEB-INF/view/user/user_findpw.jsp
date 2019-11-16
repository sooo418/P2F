<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	function showfindPw() {
		f.action = "findpw.do"
		f.method = "get";
		f.submit();
	}

	function checkId() {
		var id = $("#uid").val();
		$.ajax({
			url : "idcheck.do",
			type : 'POST',
			dataType : 'json',
			data : {
				"id" : id
			},
			success : function(data) {
				if (data == 0) {
					$("#uid").css("border-color", "RED");
					$("#uid").val("");
					$("#uid").attr("placeholder", "등록되지 않은 ID입니다.");
					$("#reset").hide();
				} else {
					$("#uid").css("border-color", "#49bf9d");
					$("#uid").attr("readonly", true);
					$("#reset").show();
					$("#hintdiv").show();
					$("#ok").val("확인");
					$("#ok").click(checkHint);
				}
			},
			error : function(error, status) {
				alert("ajax 통신 ERROR");
			}
		});
	}

	function checkHint() {
		var id = $("#uid").val();
		var hint = $("#hint").val();
		$.ajax({
			url : "hintcheck.do",
			type : 'POST',
			dataType : 'json',
			data : {
				"id" : id,
				"hint" : hint
			},
			success : function(data) {
				if (data == 0) {
					$("#hint").val("");
					$("#hint").css("border-color", "RED");
					$("#hint").attr("placeholder", "설정하신 답변과 일치하지 않습니다");
				} else {
					$("#ques").css("border-color", "#49bf9d");
					$("#hint").css("border-color", "#49bf9d");
					$("#hint").attr("readonly", true);
					$("#reset").hide();
					$("#ok").val("비밀번호 재설정");
					$("#ok").click(showPwdiv);
				}
			},
			error : function(error, status) {
				alert("ajax 통신 ERROR");
			}
		});
	}

	function showPwdiv() {
		var id = $("#uid").val();
		$("#hintdiv").hide();
		$("#reset").hide();
		$("#pwdiv").show();
		$("#ok").click(changePw, $("#ok").hide());
		$("#change").show();
	}

	function changePw() {
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

			$("#change").click(function() {
				return confirm("비밀번호를 변경하시겠습니까?");
			});
		}
	}
</script>
</head>
<body class="is-preload">
	<header id="header" style="padding: 96px 48px 48px 48px;">
		<jsp:include page="../loginMenu.jsp" />
	</header>
	<!-- Main -->
	<div id="main">
		<section>
			<h2 align="center">비밀번호 찾기</h2>
			<hr class="col-12">
			<form method="post" action="changepw.do" onsubmit="return changePw()">
				<div id="pwform" style="margin: 100px 200px 0 200px">
					<div class="col-6 col-12-xsmall">
						ID<input type="text" name="id" id="uid" value="${user.id}"
							autocomplete="off" placeholder="ID를 입력하세요" required="required"
							style="margin-bottom: 1em" />
					</div>
					<div id="hintdiv" style="display: none">
						<div class="col-6 col-12-xsmall" style="margin-bottom: 1em">
							<select name="ques">
								<option value="">- 비밀번호 찾기 질문을 선택하세요 -</option>
								<option value="1">내 보물 1호는?</option>
								<option value="1">가장 기억에 남는 장소는?</option>
								<option value="1">제일 좋아하는 커피 메뉴는?</option>
							</select>
						</div>

						<div class="col-6 col-12-xsmall" style="margin-bottom: 1em">
							<input type="text" name="hint" id="hint" autocomplete="off"
								placeholder="비밀번호 찾기 답변을 입력하세요" required="required" />
						</div>
					</div>
					<div id="pwdiv" style="display: none">
						<div class="col-6 col-12-xsmall" style="margin-bottom: 1em">
							<input type="password" name="pw" id="pw" onkeyup="changePw()"
								placeholder="비밀번호를 입력하세요" required="required" />

						</div>

						<div class="col-6 col-12-xsmall" style="margin-bottom: 1em">
							<input type="password" name="pw" id="pw2" onkeyup="changePw()"
								placeholder="비밀번호를 한 번 더 입력하세요" required="required" />
						</div>

					</div>
					<div class="col-12" style="text-align: center">
						<input type="button" id="ok" value="ID 확인" onClick="checkId()">
						<input type="submit" id="change" value="비밀번호 재설정"
							style="display: none"> <input type="button" id="reset"
							value="뒤로가기" onClick="showfindPw()" style="display: none">

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
</body>
</html>