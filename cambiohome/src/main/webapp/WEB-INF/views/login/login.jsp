<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../head.jsp"%>
<script type="text/javascript">
	function doCancel() {
		location.href = "/org";
	}
</script>
</head>
<body>
	<!-- menu -->
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
				<li class="nav-item"><a class="nav-link"
					href="${path}/member/login.do"><i class="fas fa-user"></i>마이페이지</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${path}/member/login.do"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
			</ul>
		</div>
	</nav>
	<!-- 로그인 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2>회원가입</h2>
				<form action="${path}/member/signupProc.do">
					<div class="form-group">
						<span><i class="fas fa-user"></i></span> <input type="text"
							class="form-control" id="member_id" placeholder="Id"
							name="member_id">
					</div>
					<div class="form-group">
						<span><i class="fas fa-key"></i></span> <input type="password"
							class="form-control" id="member_pw" placeholder="Password"
							name="member_pw">
					</div>
					<button type="submit" class="btn btn-dark">로그인</button>
					<button type="button" class="btn btn-dark" onclick="doCancel();">취소</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>