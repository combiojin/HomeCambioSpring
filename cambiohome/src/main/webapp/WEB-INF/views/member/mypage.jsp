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
	function doDrop() {
		if (confirm("탈퇴 하시겠습니까?")) {
			location.href = "${path}/member/delete.do";
		} else {
			alert("탈퇴 취소 되었습니다.");
			location.href = "${path}/member/mypage.do"
		}

	}

	//다음 API
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				$("[name=member_addressnumber]").val(data.zonecode);
				$("[name=member_address]").val(fullRoadAddr);

				/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
			}
		}).open();
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
								style="width: 70%; display: inline;" id="member_id"
								placeholder="Id" name="member_id" value="${mypage.member_id}" readonly="readonly">
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
								placeholder="Name" name="member_name" value="${mypage.member_name}" readonly="readonly">
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
								value="${mypage.member_birth}"  readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<span><i class="fas fa-phone"></i>PHONE NUMBER</span>
						<div class="col-md-12">
							<input type="text" class="form-control" id="member_phone"
								placeholder="Phone number" name="member_phone" value="${mypage.member_phone}">
						</div>
					</div>
					<div class="form-group">
						<i class="fas fa-envelope">E-MAIL</i>
						<div class="col-md-12">
							<input type="text" class="form-control" id="member_mail"
								placeholder="E-mail" name="member_mail" value="${mypage.member_mail}">
						</div>
						<i class="fas fa-map-marked-alt">ADDRESS</i>
						<div class="col-md-12">
							<input type="text" class="form-control"
								style="width: 70%; display: inline;" id="member_addressnumber"
								placeholder="우편번호" name="member_addressnumber"
								readonly="readonly" value="${mypage.member_addressnumber}">
							<button type="button" style="float: right;"
								class="btn btn-dark btn-md" onclick="execPostCode();">우편번호
								찾기</button>
						</div>
						<div class="col-md-12">
							<input type="text" class="form-control" style="margin-top: 10px;"
								id="member_address" placeholder="도로명 주소" name="member_address" value="${mypage.member_address}"
								readonly="readonly"> <input type="text"
								class="form-control" style="margin-top: 10px;"
								id="member_detailaddress" placeholder="상세 주소" value="${mypage.member_detailaddress}"
								name="member_detailaddress">
						</div>
					</div>
					<div class="col-md-12" style="text-align: center;">
					<button type="submit" class="btn btn-dark">수정</button>
					<button type="button" class="btn btn-dark" onclick="doDrop();">탈퇴</button>
					<button type="button" class="btn btn-dark" onclick="doCancel();">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>