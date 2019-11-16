/*function Logout() {
	f1.action = "../logout.do"
	f1.submit();
}*/
function boardCreate() {
	f.action = "add.do";
	f.method = "post";
	f.submit();
}

function boardList() {
	f.action = "../index.do"
	f.submit();
}
function boardModify() {
	f.action = "./modify.do";
	f.submit();
}
function boardRemove() {
	if (confirm("정말 삭제하시겠습니까?")) {
		f.action = "./remove.do";
		f.submit();
	}
}

function boardUpdate() {
	f.action = "./update.do";
	f.submit();
}

