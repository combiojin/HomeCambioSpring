<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
	charset="UTF-8">
<title>Home</title>
<%@include file="head.jsp"%>
<style type="text/css">
/* <!--Demo styles --> */
html, body {
	position: relative;
	height: 100%;
}

body {
	background: #eee;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #000;
	margin: 0;
	padding: 0;
}
</style>
</head>
<body>
	<!-- menu -->
	<%@include file="menu.jsp"%>
	<!-- 배경이미지 슬라이드 -->
	<!-- Swiper -->
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img src="${path}/resources/image/hom1.jpg">
			</div>
			<div class="swiper-slide">
				<img src="${path}/resources/image/hom2.jpg">
			</div>
			<div class="swiper-slide">
				<img src="${path}/resources/image/hom3.jpg">
			</div>
			<div class="swiper-slide">
				<img src="${path}/resources/image/hom4.jpg">
			</div>
			<div class="swiper-slide">
				<img src="${path}/resources/image/hom5.jpg">
			</div>
			<div class="swiper-slide">
				<img src="${path}/resources/image/hom6.jpg">
			</div>
			<div class="swiper-slide">
				<img src="${path}/resources/image/hom7.jpg">
			</div>
		</div>
		<!-- Add Scrollbar -->
		<div class="swiper-scrollbar"></div>
	</div>

	<script type="text/javascript">
		var swiper = new Swiper('.swiper-container', {
			scrollbar : {
				el : '.swiper-scrollbar',
				hide : true,
			},
			autoplay : {
				delay : 5000,
			},
		});
	</script>
	<!-- 추후 넣어야 할 것! -->

	<!-- 뭘 넣어야 할까? -->
	<footer class="col-md-12" style="text-align: center;">
		<div class="col-md-12">
			<a><img src="${path}/resources/image/logo_black.png"
				style="height: 50px; margin-bottom: 10px;" /></a>
		</div>
		<div class="col-md-12">Copyrightⓒ 2019 By cambiojin. All right
			reserved.</div>
	</footer>
</body>
</html>