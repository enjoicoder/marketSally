$("#modifyBtn").click(function() {
	$("#menuForm")
		.attr("action",
			"/noticeUpdate.do").attr("method","get");
	$("#menuForm").submit();
});

$("#removeBtn").click(function() {
	
	if (confirm("게시글을 삭제 하시겠습니까?")) {
		$("#menuForm")
			.attr("action",
				"/${pageContext.request.contextPath}/noticeDelete.do?mem_id="+noticeVo.getMem_id()+"&notice_id="+noticeVo.getNotice_id());
		$("#menuForm").submit();
	}
});
$("#replyBtn").click(function() {
	$("#menuForm").attr("action","");
	$("#menuForm").submit();
});
$("#listBtn").click(function() {
	$("#menuForm")
		.attr("action",
			"");
	$("#menuForm").submit();
});