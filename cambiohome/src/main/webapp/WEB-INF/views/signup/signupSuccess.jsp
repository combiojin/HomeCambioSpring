<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../head.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<!-- menu -->
	<%@include file="../menu.jsp"%>
	<div style="margin: 100px;">
		<a><img
			src="${path}/resources/image/logo_black.png"
			style="height: 50px; margin-bottom: 10px;" /></a> <br> 
		<h3>안녕하세요, ${param.member_id} 님</h3>
		<br>
		<p>환영합니다!</p>
		<br>
		<p>회원가입이 정상적으로 이루어 졌습니다.</p>
		<br>
		<p>로그인 하시면 홈페이지 내의 모든 서비스를 이용하실 수 있습니다.</p>
		<br> <a href="${path}/member/login.do">로그인 페이지로 이동하기</a>
	</div>
</body>
</html>