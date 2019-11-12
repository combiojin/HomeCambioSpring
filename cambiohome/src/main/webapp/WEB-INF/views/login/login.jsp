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
	<%@include file="../menu.jsp" %>
	<!-- 로그인 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2>회원가입</h2>
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
					<c:if test="${msg == false }">	
						<div class="form-group">
							<p class="font-weight-bold" style="text-align: center; color:#f00;">로그인에 실패했습니다. 아이디 또는 비밀번호를 다시 입력해주십시오.</p>
						</div>
					</c:if>		
					<button type="submit" class="btn btn-dark" onclick="doCheck();">로그인</button>
					<button type="button" class="btn btn-dark" onclick="doCancel();">취소</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>