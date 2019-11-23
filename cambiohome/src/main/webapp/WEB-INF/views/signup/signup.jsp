<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
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
	<!-- 회원가입 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2>회원가입</h2>
				<form action="${path}/member/signupProc.do">
					<div class="form-group">
						<i class="fas fa-user">ID</i>
						<div class="col-md-8">
							<input type="text" class="form-control" id="member_id"
								placeholder="Id" name="member_id"> <span
								class="input-group-btn">
								<button class="btn btn-dark btn-md">중복확인</button>
							</span>
						</div>
					</div>
					<div class="form-group">
						<span><i class="fas fa-key">PASSWORD</i></span> <input
							type="password" class="form-control" id="member_pw"
							placeholder="Password" name="member_pw">
					</div>
					<div class="form-group">
						<span><i class="fas fa-key">CONFIRM PASSWORD</i></span> <input
							type="password" class="form-control" id="member_cpw"
							placeholder="Confirm Password" name="member_cpw">
					</div>
					<div class="form-group">
						<span><i class="fas fa-user">NAME</i></span> <input type="text"
							class="form-control" id="member_name" placeholder="Name"
							name="member_name">
					</div>
					<div class="form-group">
						<i class="fas fa-venus-mars">GENDER</i><br>
						<div class="btn-group btn-group-toggle"
							style="text-align: center;" data-toggle="buttons">
							<label class="btn btn-secondary active"> <input
								type="radio" name="options" id="option1" autocomplete="off"
								checked> MEN
							</label> <label class="btn btn-secondary"> <input type="radio"
								name="options" id="option2" autocomplete="off"> WOMEN
							</label>
						</div>
					</div>
					<div class="form-group">
						<span><i class="fas fa-birthday-cake">DATE OF BIRTH</i></span> <input
							type="text" class="form-control" id="member_birth"
							placeholder="ex)19000000" name="member_birth">
					</div>
					<div class="form-group">
						<span><i class="fas fa-phone"></i>PHONE NUMBER</span> <input
							type="text" class="form-control" id="member_birth"
							placeholder="Phone number" name="member_birth">
					</div>
					<div class="form-group">
						<span><i class="fas fa-envelope">E-MAIL</i></span> <input
							type="email" class="form-control" id="member_mail"
							placeholder="E-mail" name="member_mail">
					</div>
					<button type="submit" class="btn btn-dark">회원가입</button>
					<button type="button" class="btn btn-dark" onclick="doCancel();">취소</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>