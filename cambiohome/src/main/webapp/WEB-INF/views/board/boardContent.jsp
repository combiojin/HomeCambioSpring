<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../head.jsp"%>
<script>
	//목록이동 이벤트
	$(document).on('click','#btnList',function() {
		location.href = "${path}/board/board_list.do";

	});
	//수정 버튼 클릭이벤트
	$(document).on('click','#btnUpdate',function() {
		var url = "${path}/board/boardUpdate.do";
		url = url + "?bid="+${boardContent.bid};
		url = url + "&mode=update";
		location.href = url;
	});
	//삭제 버튼 클릭이벤트
	$(document).on('click','#btnDelete',function() {
		var url = "${path}/board/boardDelete.do";
		url = url + "?bid="+${boardContent.bid};
		location.href = url;
	});
	
</script>
</head>
<body>
	<!-- menu -->
	<%@include file="../menu.jsp"%>
	<!-- body -->
	<article>
		<div class="container" role="main">
			<h2>게시판 내용</h2>
			<div class="bg-white rounded shadow-sm">
				<div class="board_title">
					<c:out value="${boardContent.title}"></c:out>
				</div>
				<div class="board_info_box">
					<span class="board_author"><c:out value="${boardContent.reg_id}"></c:out>,</span>
					<span class="board_date"><c:out value="${boardContent.reg_dt}"></c:out></span>
				</div>
				<div class="board_content">${boardContent.content}</div>
				<div class="board_tag">
					TAG :
					<c:out value="${boardContent.tag}"></c:out>
				</div>
			</div>
			<div style="margin-top: 20px; float: right;">
				<button type="button" class="btn btn-md btn-dark" id="btnUpdate">수정</button>
				<button type="button" class="btn btn-md btn-dark" id="btnDelete">삭제</button>
				<button type="button" class="btn btn-md btn-dark" id="btnList">목록</button>
			</div>
		</div>
	</article>
</body>
</html>
