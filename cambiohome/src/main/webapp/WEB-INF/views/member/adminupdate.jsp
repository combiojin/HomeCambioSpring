<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../head.jsp"%>
<script type="text/javascript">
	function doCancel() {
		location.href = "${path}/member/memberlist.do";
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
				<form action="${path}/member/adminupdateProc.do">
					<input type="hidden" name="member_idx"
						value="${memberselect.member_idx}">
					<div class="form-group">
						<i class="fas fa-user">ID</i>
						<div class="col-md-12">
							<input type="text" class="form-control"
								style="width: 70%; display: inline;" id="member_id"
								placeholder="Id" name="member_id" value="${memberselect.member_id}" readonly="readonly">
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
								placeholder="Name" name="member_name" value="${memberselect.member_name}" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<i class="fas fa-venus-mars">GENDER</i><br>
						<div class="col-md-12" style="text-align: center;">
							<div class="btn-group btn-group-toggle"
								style="text-align: center;" data-toggle="buttons">
								<label class="btn btn-secondary active"> <input
									type="radio" name="member_gender" id="member_gender"
									autocomplete="off" value="남자"> MEN
								</label> <label class="btn btn-secondary active"> <input
									type="radio" name="member_gender" id="member_gender"
									autocomplete="off" value="여자"> WOMEN
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<i class="fas fa-birthday-cake">DATE OF BIRTH</i>
						<div class="col-md-12">
							<input type="text" class="form-control" id="member_birth"
								placeholder="ex)19000000" name="member_birth"
								value="${memberselect.member_birth}"  readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<span><i class="fas fa-phone"></i>PHONE NUMBER</span>
						<div class="col-md-12">
							<input type="text" class="form-control" id="member_phone"
								placeholder="Phone number" name="member_phone" value="${memberselect.member_phone}">
						</div>
					</div>
					<div class="form-group">
						<i class="fas fa-envelope">E-MAIL</i>
						<div class="col-md-12">
							<input type="text" class="form-control" id="member_mail"
								placeholder="E-mail" name="member_mail" value="${memberselect.member_mail}">
						</div>
						<i class="fas fa-map-marked-alt">ADDRESS</i>
						<div class="col-md-12">
							<input type="text" class="form-control"
								style="width: 70%; display: inline;" id="member_addressnumber"
								placeholder="우편번호" name="member_addressnumber"
								readonly="readonly" value="${memberselect.member_addressnumber}">
							<button type="button" style="float: right;"
								class="btn btn-dark btn-md" onclick="execPostCode();">우편번호
								찾기</button>
						</div>
						<div class="col-md-12">
							<input type="text" class="form-control" style="margin-top: 10px;"
								id="member_address" placeholder="도로명 주소" name="member_address" value="${memberselect.member_address}"
								readonly="readonly"> <input type="text"
								class="form-control" style="margin-top: 10px;"
								id="member_detailaddress" placeholder="상세 주소" value="${memberselect.member_detailaddress}"
								name="member_detailaddress">
						</div>
					</div>
					<button type="submit" class="btn btn-dark">회원수정</button>
					<button type="button" class="btn btn-dark" onclick="doCancel();">취소</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>