<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../head.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		var mode = '<c:out value="${mode}"/>';
		if ( mode == 'update'){
		//입력 폼 셋팅
			$("#reg_id").prop('readonly', true);
			$("input:hidden[name='bid']").val('<c:out value="${boardContent.bid}"/>');
			$("input:hidden[name='mode']").val('<c:out value="${mode}"/>');
			$("#reg_id").val('<c:out value="${boardContent.reg_id}"/>');
			$("#title").val('<c:out value="${boardContent.title}"/>');
			$("#content").val('<c:out value="${boardContent.content}"/>');
			$("#tag").val('<c:out value="${boardContent.tag}"/>');
		}
	});
	$(document).on('click', '#btnSave', function(e) {
		e.preventDefault();
		$("#form").submit();
	});
	$(document).on('click', '#btnList', function(e) {
		e.preventDefault();
		location.href = "${path}/board/board_list.do";

	});
</script>
</head>
<body>
	<!-- menu -->
	<%@include file="../menu.jsp"%>
	<!-- body -->
	<article>
		<div class="container" role="main">
			<h2>게시물 작성</h2>
			<form:form name="form" id="form" role="form"
				modelAttribute="dto" method="post" action="${path}/board/boardProc.do">
				<form:hidden path="bid" />
				<input type="hidden" name="mode">
				<div class="mb-3">
					<label for="title">제목</label>
					<form:input path="title" class="form-control" name="title"
						id="title" placeholder="제목을 입력해 주세요" />
				</div>
				<div class="mb-3">
					<label for="reg_id">작성자</label>
					<form:input path="reg_id" class="form-control" name="reg_id"
						id="reg_id" placeholder="이름을 입력해 주세요" />
				</div>
				<div class="mb-3">
					<label for="content">내용</label>
					<form:textarea path="content" rows="5" class="form-control"
						name="content" id="content" placeholder="내용을 입력해 주세요" />
				</div>
				<div class="mb-3">
					<label for="tag">TAG</label>
					<form:input path="tag" type="text" class="form-control" name="tag"
						id="tag" placeholder="태그를 입력해 주세요" />
				</div>
			</form:form>
			<div style="float: right;">
				<button type="button" class="btn btn-md btn-dark" id="btnSave">저장</button>
				<button type="button" class="btn btn-md btn-dark" id="btnList">목록</button>
			</div>
		</div>
	</article>
</body>
</html>