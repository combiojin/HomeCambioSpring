<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../head.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		var name = ${result}.response.name;
		var email = ${result}.response.email;
		$("#name").html("환영합니다. "+name+"님");
		$("#email").html(email);
	});
	
	function doCancel() {
		location.href = "/org";
	}
</script>
</head>
<body>
	<!-- menu -->
	<%@include file="../menu.jsp"%>
	<!-- 로그인 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div
					style="background-color:black; width: 100%; height: 50px; text-align: center; color: white;">
					<h3>SIST Naver_Login Success</h3>
				</div>
				<br>
				<h2 style="text-align: center" id="name"></h2>
				<h4 style="text-align: center" id="email"></h4>
				<button type="button" class="btn btn-dark"
					style="text-align: center;" onclick="doCancel();">확인</button>
			</div>
		</div>
	</div>
</body>
</html>