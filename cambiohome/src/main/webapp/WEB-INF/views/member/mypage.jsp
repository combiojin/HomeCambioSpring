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
		location.href="/org";
	}
	function doDrop() {
		if (confirm("탈퇴 하시겠습니까?")){ 
			location.href="${path}/member/delete.do";
		}else{ 
			alert("탈퇴 취소 되었습니다."); 
			location.href="${path}/member/mypage.do"
		} 
		
	}
</script>
</head>
<body>
	<!-- menu -->
	<%@include file="../menu.jsp" %>
	<!-- 회원가입 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2>회원가입</h2>
				<form action="${path}/member/mypageProc.do">
					<div class="form-group">
						<span><i class="fas fa-user"></i></span> <input type="text"
							class="form-control" id="member_id" placeholder="Id" name="member_id" value="${member.member_id}" readonly="readonly">
					</div>
					<div class="form-group">
						<span><i class="fas fa-key"></i></span> <input type="password"
							class="form-control" id="member_pw" placeholder="Password" name="member_pw" >
					</div>
					<div class="form-group">
						<span><i class="fas fa-key"></i></span> <input type="password"
							class="form-control" id="member_cpw" placeholder="Confirm Password"
							name="member_cpw" >
					</div>
					<div class="form-group">
						<span><i class="fas fa-envelope"></i></span> <input type="email"
							class="form-control" id="member_mail" placeholder="E-mail"
							name="member_mail" >
					</div>
					<button type="submit" class="btn btn-dark">수정</button>
					<button type="button" class="btn btn-dark" onclick="doDrop();">탈퇴</button>
					<button type="button" class="btn btn-dark" onclick="doCancel();">취소</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>