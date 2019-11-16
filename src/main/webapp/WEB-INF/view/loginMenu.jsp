<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<script>
		/* function checklogin() {
			var id = $("#id").val();
			var pw = $("#pw").val();

			$.ajax({
				url : "checklogin.do",
				type : 'POST',
				dataType : 'json',
				data : {
					"id" : id,
					"pw" : pw
				},
				success : function(data) {
					if (data > 0)
						return true;
					else {
						alert("ID와 PW를 확인하세요.")
						return false;
					}
				},
				error : function(error, status) {
					alert("ajax 통신 ERROR");
					return false;
				}
			});
		} */
		function showfindPw() {
			f.action = "findpw.do"
			f.method = "get";
			f.submit();
		}
		function showAddUser() {
			f.action = "add.do"
			f.method = "get";
			f.submit();
		}
		function lg() {
			theForm = document.f;

			if (theForm.id.value == "" || theForm.pw.value == "") {
				alert("필수 입력란이 비었습니다. 확인해 주세요.");
			} else {
				theForm.action = "login.do";
				theForm.method = "post";
				theForm.submit();
			}
		}
	</script>
	<div class="row">
		<a href="/ooo"
			style="text-decoration: none; font-size: 100px; padding-left: 0px; margin-left: 55px">P2F</a>
		<form name="f" id="f" action="" method="post" onsubmit="checklogin()"
			style="margin-top: 50%; padding-left: 0px">
			<div id="loginWindow" class="col-8 col-12-small">
				<div id="loginid" class="col-6 col-12-xsmall">
					<input type="text" id="id" name="id" placeholder="ID를 입력하세요"
						style="color: gray; margin-bottom: 2em">

				</div>
				<div id="loginpw" class="col-6 col-12-xsmall">
					<input type="password" pw="pw" name="pw" placeholder="PW를 입력하세요"
						style="color: gray; margin-bottom: 2em">

				</div>
				<div style="text-align: center; margin-bottom: 1em">
					<input type="submit" value="로그인" class="button small"
						onclick="lg()"> <input type="button" value="비밀번호 찾기"
						class="button small" onclick="showfindPw()">
				</div>
				<input type="button" value="회원가입" class="button primary small fit"
					onClick="showAddUser()">
			</div>
		</form>
	</div>
</body>
</html>