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

	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9]{4,12}$/;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/; 
	// 이름 정규식
	var nameJ = /^[가-힣]{2,6}$/;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

	$(document).ready(function(){
		// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
		$("#member_id").blur(function() {
			
		// id = "member_id" / name = "member_id"
		var member_id = $('#member_id').val();
		$.ajax({
			url : '${path}/member/memberCheck.do?memberId='+ member_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 :p");
						$("#id_check").css("color", "red");
						$("#signup_submit").attr("disabled", true);
					} else {
						
						if(idJ.test(member_id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							$("#signup_submit").attr("disabled", false);
				
						} else if(member_id == ""){
							
							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', 'red');
							$("#signup_submit").attr("disabled", true);				
							
						} else {
							
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
							$('#id_check').css('color', 'red');
							$("#signup_submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
		
		// 이름에 특수문자 들어가지 않도록 설정
		$("#member_name").blur(function() {
			if (nameJ.test($(this).val())) {
					console.log(nameJ.test($(this).val()));
					$("#name_check").text('');
			} else {
				$('#name_check').text('이름을 확인해주세요');
				$('#name_check').css('color', 'red');
			}
		});
		
		
		// 휴대전화
		$('#member_phone').blur(function(){
			if(phoneJ.test($(this).val())){
				console.log(phoneJ.test($(this).val()));
				$("#phone_check").text('');
			} else {
				$('#phone_check').text('휴대폰번호를 확인해주세요 :)');
				$('#phone_check').css('color', 'red');
			}
		});
		// 생일 유효성 검사
		var birthJ = false;
		
		// 생년월일	birthJ 유효성 검사
		$('#member_birth').blur(function(){
			var dateStr = $(this).val();		
		    var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
		    var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
		    var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
		    var today = new Date(); // 날짜 변수 선언
		    var yearNow = today.getFullYear(); // 올해 연도 가져옴
			
		    if (dateStr.length <=8) {
				// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
			    if (1900 > year || year > yearNow){
			    	
			    	$('#birth_check').text('생년월일을 확인해주세요 :)');
					$('#birth_check').css('color', 'red');
			    	
			    }else if (month < 1 || month > 12) {
			    		
			    	$('#birth_check').text('생년월일을 확인해주세요 :)');
					$('#birth_check').css('color', 'red'); 
			    
			    }else if (day < 1 || day > 31) {
			    	
			    	$('#birth_check').text('생년월일을 확인해주세요 :)');
					$('#birth_check').css('color', 'red'); 
			    	
			    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
			    	 
			    	$('#birth_check').text('생년월일을 확인해주세요 :)');
					$('#birth_check').css('color', 'red'); 
			    	 
			    }else if (month == 2) {
			    	 
			       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
			       	
			     	if (day>29 || (day==29 && !isleap)) {
			     		
			     		$('#birth_check').text('생년월일을 확인해주세요 :)');
						$('#birth_check').css('color', 'red'); 
			    	
					}else{
						$('#birth_check').text('');
						birthJ = true;
					}//end of if (day>29 || (day==29 && !isleap))
			     	
			    }else{
			    	
			    	$('#birth_check').text(''); 
					birthJ = true;
				}//end of if
				
				}else{
					//1.입력된 생년월일이 8자 초과할때 :  auth:false
					$('#birth_check').text('생년월일을 확인해주세요 :)');
					$('#birth_check').css('color', 'red');  
				}
			}); //End of method /*
			
		// 가입하기 실행 버튼 유효성 검사!
		var inval_Arr = new Array(5).fill(false);
		$('#signup_submit').click(function(){
			// 비밀번호가 같은 경우 && 비밀번호 정규식
			if (($('#member_pw').val() == ($('#member_cpw').val())) && pwJ.test($('#member_pw').val())) {
				inval_Arr[0] = true;
			} else {
				inval_Arr[0] = false;
			}
			// 이름 정규식
			if (nameJ.test($('#member_name').val())) {
				inval_Arr[1] = true;	
			} else {
				inval_Arr[1] = false;
			}
			// 이메일 정규식
			if (mailJ.test($('#member_mail').val())){
				console.log(mailJ.test($('#member_mail').val()));
				inval_Arr[2] = true;
			} else {
				inval_Arr[2] = false;
			}
			// 휴대폰번호 정규식
			if (phoneJ.test($('#member_phone').val())) {
				console.log(phoneJ.test($('#member_phone').val()));
				inval_Arr[3] = true;
			} else {
				inval_Arr[3] = false;
			}
			// 생년월일 정규식
			if (birthJ) {
				console.log(birthJ);
				inval_Arr[4] = true;
			} else {
				inval_Arr[4] = false;
			}
			
			var validAll = true;
			for(var i = 0; i < inval_Arr.length; i++){
				
				if(inval_Arr[i] == false){
					validAll = false;
				}
			}
			
			if(validAll){ // 유효성 모두 통과
				$('#usercheck').submit();
				alert('CamBio님께서 인증 이메일을 보냈으니 확인해주세요!');
			} else{
				alert('입력한 정보들을 다시 한번 확인해주세요 :)')
				
			}
		});

	});
	
	
	//다음 api
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
				<form action="${path}/member/signupProc.do" role="form"
					id="usercheck" name="member" method="post">
					<div class="form-group">
						<i class="fas fa-user">ID</i>
						<div class="col-md-12">
							<input type="text" class="form-control" id="member_id"
								placeholder="Id" name="member_id">
							<div class="eheck_font" id="id_check"></div>
						</div>

					</div>
					<div class="form-group">
						<i class="fas fa-key">PASSWORD</i>
						<div class="col-md-12">
							<input type="password" class="form-control" id="member_pw"
								placeholder="Password" name="member_pw">
							<div class="eheck_font" id="pw_check"></div>
						</div>
					</div>
					<div class="form-group">
						<i class="fas fa-key">CONFIRM PASSWORD</i>
						<div class="col-md-12">
							<input type="password" class="form-control" id="member_cpw"
								placeholder="Confirm Password" name="member_cpw">
							<div class="eheck_font" id="cpw_check"></div>
						</div>
					</div>
					<div class="form-group">
						<i class="fas fa-user">NAME</i>
						<div class="col-md-12">
							<input type="text" class="form-control" id="member_name"
								placeholder="Name" name="member_name">
							<div class="eheck_font" id="name_check"></div>
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
								placeholder="ex)19000000" name="member_birth">
							<div class="eheck_font" id="birth_check"></div>
						</div>
					</div>
					<div class="form-group">
						<span><i class="fas fa-phone"></i>PHONE NUMBER ('-' 없이 번호만
							입력해주세요)</span>
						<div class="col-md-12">
							<input type="text" class="form-control" id="member_phone"
								placeholder="Phone number" name="member_phone">
							<div class="eheck_font" id="phone_check"></div>
						</div>
					</div>
					<div class="form-group">
						<i class="fas fa-envelope">E-MAIL</i>
						<div class="col-md-12">
							<input type="text" class="form-control" id="member_mail"
								placeholder="E-mail" name="member_mail">
							<div class="eheck_font" id="mail_check"></div>
						</div>
						<i class="fas fa-map-marked-alt">ADDRESS</i>
						<div class="col-md-12">
							<input type="text" class="form-control"
								style="width: 70%; display: inline;" id="member_addressnumber"
								placeholder="우편번호" name="member_addressnumber"
								readonly="readonly">
							<button type="button" style="float: right;"
								class="btn btn-dark btn-md" onclick="execPostCode();">우편번호
								찾기</button>
						</div>
						<div class="col-md-12">
							<input type="text" class="form-control" style="margin-top: 10px;"
								id="member_address" placeholder="도로명 주소" name="member_address"
								readonly="readonly"> <input type="text"
								class="form-control" style="margin-top: 10px;"
								id="member_detailaddress" placeholder="상세 주소"
								name="member_detailaddress">
						</div>
					</div>
					<div class="col-md-12" style="text-align: center;">
						<button type="button" class="btn btn-dark" id="signup_submit">회원가입</button>
						<button class="btn btn-dark" onclick="doCancel();">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
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