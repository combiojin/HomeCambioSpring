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
				<div
					style="background-color: black; width: 100%; height: 50px; text-align: center; color: white;">
					<h2 style="text-align: center;">CamBio SignUp</h2>
				</div>
				<form action="${path}/member/signupProc.do">
					<div class="form-group">
						<i class="fas fa-user">ID</i>
						<div class="col-md-12">
							<input type="text" class="form-control"
								style="width: 90%; display: inline;" id="member_id"
								placeholder="Id" name="member_id">
							<button style="float: right;" class="btn btn-dark btn-md">중복확인</button>
						</div>

					</div>
					<div class="form-group">
						<i class="fas fa-key">PASSWORD</i>
						<div class="col-md-12">
							<input type="password" class="form-control" id="member_pw"
								placeholder="Password" name="member_pw">
						</div>
					</div>
					<div class="form-group">
						<i class="fas fa-key">CONFIRM PASSWORD</i>
						<div class="col-md-12">
							<input type="password" class="form-control" id="member_cpw"
								placeholder="Confirm Password" name="member_cpw">
						</div>
					</div>
					<div class="form-group">
						<i class="fas fa-user">NAME</i>
						<div class="col-md-12">
							<input type="text" class="form-control" id="member_name"
								placeholder="Name" name="member_name">
						</div>
					</div>
					<div class="form-group">
						<i class="fas fa-venus-mars">GENDER</i><br>
						<div class="col-md-12" style="text-align: center;">
							<div class="btn-group btn-group-toggle"
								style="text-align: center;" data-toggle="buttons">
								<label class="btn btn-secondary active"> <input
									type="checkbox" name="member_gender" id="member_gender"
									autocomplete="off" checked> MEN
								</label> <label class="btn btn-secondary"> <input
									type="checkbox" name="member_gender" id="member_gender"
									autocomplete="off"> WOMEN
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<i class="fas fa-birthday-cake">DATE OF BIRTH</i>
						<div class="col-md-12">
							<input type="text" class="form-control" id="member_birth"
								placeholder="ex)19000000" name="member_birth">
						</div>
					</div>
					<div class="form-group">
						<span><i class="fas fa-phone"></i>PHONE NUMBER</span>
						<div class="col-md-12">
							<input type="text" class="form-control" id="member_phone"
								placeholder="Phone number" name="member_phone">
						</div>
					</div>
					<div class="form-group">
						<i class="fas fa-envelope">E-MAIL</i>
						<div class="col-md-12">
							<input type="email" class="form-control" id="member_mail"
								placeholder="E-mail" name="member_mail">
						</div>
						<i class="fas fa-map-marked-alt">ADDRESS</i>
						<div class="col-md-12">
							<input type="email" class="form-control"
								style="width: 86%; display: inline;" id="member_addressnumber"
								placeholder="우편번호" name="member_addressnumber">
							<button style="float: right;" class="btn btn-dark btn-md">우편번호
								찾기</button>
						</div>
						<div class="col-md-12">
							<input type="email" class="form-control"
								style="margin-top: 10px;" id="member_address"
								placeholder="도로명 주소" name="member_address"><input
								type="email" class="form-control" style="margin-top: 10px;"
								id="member_detailaddress" placeholder="상세 주소"
								name="member_detailaddress">
						</div>
					</div>
					<div class="col-md-12" style="text-align: center;">
						<button type="submit" class="btn btn-dark">회원가입</button>
						<button type="button" class="btn btn-dark" onclick="doCancel();">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>