<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>MemberList</title>
<meta charset="UTF-8">

<%@include file="../head.jsp"%>
<script type="text/javascript">
	function dodelete() {
		alert("삭제누름")
		$("#delefrm").submit();
	}
</script>
</head>
<body>
	<!-- menu -->
	<%@include file="../menu.jsp" %>
	<!-- body -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form id="delefrm" action="${path}/member/delete.do">
					<h2>회원목록</h2>
					<table class="table table-dark table-bordered"
						style="text-align: center;">
						<tr>
							<th></th>
							<th>순번</th>
							<th>이름</th>
							<th>메일</th>
							<th></th>
						</tr>
						<c:forEach items="${list}" var="md">
							<tr>
								<td><input type="checkbox" name="member_idx"
									value="${md.member_idx}"></td>
								<td>${md.member_idx}</td>
								<td>${md.member_id}</td>
								<td>${md.member_mail}</td>
								<td><a class="btn btn-primary"
									href="${path}/member/update.do?member_idx=${md.member_idx}">수정</a></td>
							</tr>
						</c:forEach>
					</table>
					<div class="col-sm-1" style="float: right; margin: 10px;">
						<button class="btn btn-dark" onclick="dodelete();">회원삭제</button>
					</div>
					<div class="col-sm-1" style="float: right; margin: 10px;">
						<a class="btn btn-dark" href="${path}/member/insert.do">회원등록</a>
					</div>
				</form>
			</div>
		</div>
		<div class="row"></div>
	</div>
</body>
</html>