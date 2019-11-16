/*function showfindPw() {
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

		$("#change").click(function(){
			return confirm("비밀번호를 변경하시겠습니까?");
		});		
	}
}*/