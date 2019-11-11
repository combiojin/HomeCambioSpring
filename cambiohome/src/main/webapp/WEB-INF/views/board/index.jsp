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
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<div
			class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="${path}">Home</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${path}/member/index.do">MemberList</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${path}/board/index.do">Board</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Gallery</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
			</ul>
		</div>
		<div class="mx-auto order-0">
			<a class="navbar-brand mx-auto" href="${path}"><img
				src="${path}/resources/image/logo_white.png" width="100" height="30"
				class="d-inline-block align-top" alt=""></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target=".dual-collapse2">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
		<div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link"
					href="${path}/member/signup.do"><i class="fas fa-user-plus"></i>회원가입</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${path}/member/login.do"><i class="far fa-user"></i>로그인</a></li>
			</ul>
		</div>
	</nav>
	<!-- body -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form id="delefrm" action="${path}/member/delete.do">
					<h2>회원목록</h2>
					<table class="table table-dark table-bordered">
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