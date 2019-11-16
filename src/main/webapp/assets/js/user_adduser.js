/*function addUser() {
	a.action = "add.do"
	a.submit();
}

function selectImg() {
	a.action = "report.do"
	a.submit();
}
function checkIdFirst() {
	var passRule = /^[A-Za-z0-9]{6,12}$/;
	if (!passRule.test($("input[id='id']").val() || $("#id").val().length < 6)) {
		$("#id").css("border-color", "RED");
		$("#id").attr("placeholder", "영어와 숫자를 조합한 6~12글자를 입력하세요.");

	} else {
		$("#id").css("border-color", "#49bf9d");
	}

}
function checkId() {
	var id = $("#id").val();

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
				$("#id").css("border-color", "RED");
				$("#id").val("");
				$("#id").attr("placeholder", "이미 사용 중인 ID 입니다.");
			} else {
				$("#id").css("border-color", "#49bf9d");
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
}*/

