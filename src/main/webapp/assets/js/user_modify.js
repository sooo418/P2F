function selectImg() {
	a.action = "report.do"
	a.submit();
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
}
/* 	function check() {
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
}
if (nickname.length >= 3)
$('#nickname').css("border-color", "#49bf9d");
else {
$('#nickname').css("border-color", "RED");
$("#nickname").val("");
$("#nickname").attr("placeholder", "별명을 3글자 이상 입력하세요.");
}
if (phone.length == 13)
$('#phone').css("border-color", "#49bf9d");
else {
$('#phone').css("border-color", "RED");
$("#phone").val("");
$("#phone").attr("placeholder", "휴대 전화 번호를 확인하세요.");
}
if (hint.length != 0)
$('#hint').css("border-color", "#49bf9d");
else {
$('#hint').css("border-color", "RED");
$("#hint").val("");
$("#hint").attr("placeholder", "비밀번호 찾기 질문에 대한 답을 입력하세요.");
}
} */