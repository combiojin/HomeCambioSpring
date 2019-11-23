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
				<h2>LOGIN</h2>
				<form action="${path}/member/loginProc.do">
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
					<div class="form-group">
						<div id="naver_id_login" style="text-align: center">
							<a href="${url}"> <img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
						</div>
					</div>
<!-- 					<div class="form-group"> -->
<%-- 						<div id="google_id_login" style="text-align:center"><a href="${google_url}"><img width="230" src="${pageContext.request.contextPath}/resources/img/btn_google_signin_dark_normal_web@2x.png"/></a></div> --%>
<!-- 					</div> -->
					<button type="submit" class="btn btn-dark" onclick="doCheck();">로그인</button>
					<button type="button" class="btn btn-dark" onclick="doCancel();">취소</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>