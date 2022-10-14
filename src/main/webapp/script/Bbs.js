//게시글 등록 시 validation check
function bbsCheck() {
	if($("[name='bbsTitle']").val().length == 0) {
		alert("제목을 입력하세요.");
		return false;
	}
	if($("[name='bbsContent']").val().length == 0) {
		alert("내용을 입력하세요.");
		return false;
	}
	return true;
}

function button_event(bbsID){
	if (confirm("정말 삭제하시겠습니까??")){    //확인
		location.href='BoardServlet?command=bbs_delete&bbsID=' + bbsID;
	}else{   //취소
		return false;
	}

}