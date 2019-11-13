<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<%@include file="../menu.jsp"%>
	<!-- body -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form id="delefrm" action="${path}/member/delete.do">
					<h2>회원목록</h2>
					<table class="table table-dark table-bordered"
						style="text-align: center;">
						<tr>
							<c:if test="${member.member_id eq 'admin' }">
								<th></th>
							</c:if>
							<th>순번</th>
							<th>이름</th>
							<th>메일</th>
							<c:if test="${member.member_id eq 'admin' }">
								<th></th>
							</c:if>
						</tr>
						<c:forEach items="${list}" var="md">
							<tr>
								<c:if test="${member.member_id eq 'admin' }">
									<td><input type="checkbox" name="member_idx"
										value="${md.member_idx}"></td>
								</c:if>
								<td>${md.member_idx}</td>
								<td>${md.member_id}</td>
								<td>${md.member_mail}</td>
								<c:if test="${member.member_id eq 'admin' }">
									<td><a class="btn btn-primary"
										href="${path}/member/adminupdate.do?member_idx=${md.member_idx}">수정</a></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
					<c:if test="${member.member_id eq 'admin' }">
						<div class="col-sm-1" style="float: right; margin: 10px;">
							<button class="btn btn-dark" onclick="dodelete();">회원삭제</button>
						</div>
						<div class="col-sm-1" style="float: right; margin: 10px;">
							<a class="btn btn-dark" href="${path}/member/admininsert.do">회원등록</a>
						</div>
					</c:if>
				</form>
			</div>
		</div>
		<div class="row"></div>
	</div>
</body>
</html>