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
	<%@include file="../menu.jsp"%>
	<!-- 로그인 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div
					style="background-color: black; width: 100%; height: 50px; text-align: center; color: white;">
					<h3>Cambio Login Success</h3>
				</div>
				<br>
				
					
			</div>
			<div class="col-md-12">
				<div style="text-align: center;">
					<button type="button" class="btn btn-dark" onclick="doCancel();">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>