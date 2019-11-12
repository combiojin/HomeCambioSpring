<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<%@include file="head.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	$('.bxslider').bxSlider({
		  auto: true,
		  stopAutoOnClick: true,
		  pager: true,
		  slideWidth: 1100,
		  mode:'horizontal',
		  speed:3000,
		  slideMargin:0,
 	});
});

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
				<li class="nav-item"><a class="nav-link" href="${path}/member/member_list.do">MemberList</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="${path}/board/index.do">Board</a></li>
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
				<li class="nav-item"><a class="nav-link" href="${path}/member/signup.do"><i class="fas fa-user-plus"></i>회원가입</a></li>
				<li class="nav-item"><a class="nav-link" href="${path}/member/login.do"><i class="far fa-user"></i>로그인</a></li>
			</ul>
		</div>
	</nav>
	<!-- 배경이미지 슬라이드 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="bxslider">
					<div><img src="${path}/resources/image/city1.jpg"></div>
					<div><img src="${path}/resources/image/city2.jpg"></div>
					<div><img src="${path}/resources/image/city3.jpg"></div>
					<div><img src="${path}/resources/image/city4.jpg"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- 추후 넣어야 할 것! -->
	<!-- 뭘 넣어야 할까? -->
</body>
</html>