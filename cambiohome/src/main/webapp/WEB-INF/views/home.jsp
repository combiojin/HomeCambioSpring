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
	<%@include file="menu.jsp" %>
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