//댓글 등록 시 validation check
function replyCheck() {
	if($("[name='rContent']").val().length == 0) {
		alert("내용을 입력하세요.");
		return false;
	}
	return true;
}

// 팝업창 열기
function open_win(url, name) {
	window.open(url, name, "width=500, height=230");
}


// 비밀번호 입력 check
function replyPassCheck() {
	if($("[name='pass']").val().length == 0) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	return true;
}