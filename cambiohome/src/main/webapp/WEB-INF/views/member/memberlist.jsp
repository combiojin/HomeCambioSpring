<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>MemberList</title>
<meta charset="UTF-8">
<%@include file="../head.jsp"%>
<script type="text/javascript">
	function dodelete() {
		if (confirm("삭제 하시겠습니까?")) {
			location.href = "${path}/member/admindelete.do";
		} else {
			alert("삭제 취소 되었습니다.");
			location.href = "${path}/member/memberlist.do"
		}
	}

	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;

		var url = "${path}/member/memberlist.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;

	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${path}/member/memberlist.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

		var url = "${path}/member/memberlist.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}
	//검색 이벤트
	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();
		var url = "${path}/member/memberlist.do";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	});
</script>
</head>
<body>
	<!-- menu -->
	<%@include file="../menu.jsp"%>
	<!-- body -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form id="delefrm" action="${path}/member/admindelete.do">
					<div
						style="background-color: black; width: 100%; height: 50px; text-align: center; color: white;">
						<h2 style="text-align: center;">CamBio MemberList</h2>
					</div>
					<table class="table table-dark table-bordered"
						style="text-align: center;">
						<colgroup>
							<c:if test="${member.member_id eq 'admin' }">
								<col style="width: 10%;">
							</c:if>
							<col style="width: 5%;">
							<col style="width: 15%;">
							<col style="width: auto;">
							<col style="width: 15%;">
						</colgroup>
						<tr>
							<c:if test="${member.member_id eq 'admin' }">
								<th>체크</th>
							</c:if>
							<th>NO</th>
							<th>아이디</th>
							<th>메일</th>
							<c:if test="${member.member_id eq 'admin' }">
								<th>회원수정</th>
							</c:if>
						</tr>
						<c:forEach items="${memberlist}" var="md">
							<tr>
								<c:if test="${member.member_id eq 'admin' }">
									<td><input type="checkbox" name="member_idx"
										value="${md.member_idx}"></td>
								</c:if>
								<td>${md.member_idx}</td>
								<td>${md.member_id}</td>
								<td>${md.member_mail}</td>
								<c:if test="${member.member_id eq 'admin' }">
									<td><a class="btn btn-dark"
										href="${path}/member/adminupdate.do?member_idx=${md.member_idx}">수정</a></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
					<!-- pagination{e} -->
					<div id="paginationBox" class="col-sm-8" style="float: left;">
						<ul class="pagination">
							<c:if test="${pagination.prev}">
								<li class="page-item pagecolor"><a
									class="page-link pagecolor" href="#"
									onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
							</c:if>
							<c:forEach begin="${pagination.startPage}"
								end="${pagination.endPage}" var="idx">
								<li
									class="page-item pagecolor<c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
									class="page-link pagecolor" href="#"
									onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
										${idx} </a></li>
							</c:forEach>
							<c:if test="${pagination.next}">
								<li class="page-item pagecolor"><a class="page-link"
									href="#"
									onClick="fn_next('${pagination.range}','${pagination.range}', '${pagination.rangeSize}')">Next</a></li>
							</c:if>
						</ul>
					</div>
					<!-- pagination{e} -->
					<c:if test="${member.member_id eq 'admin' }">
						<div style="float: right; margin: 10px;">
							<button class="btn btn-dark btn-lg" onclick="dodelete();">회원삭제</button>
						</div>
						<div style="float: right; margin: 10px;">
							<a class="btn btn-dark btn-lg"
								href="${path}/member/admininsert.do">회원등록</a>
						</div>
					</c:if>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<!-- search{s} -->
				<div class="form-group row justify-content-center">
					<div class="w100" style="padding-right: 10px">
						<select class="form-control form-control-sm" name="searchType"
							id="searchType">
							<option value="member_id">아이디</option>
						</select>
					</div>
					<div class="w300" style="padding-right: 10px">
						<input type="text" class="form-control form-control-sm"
							name="keyword" id="keyword">
					</div>
					<div>
						<button class="btn btn-sm btn-dark" name="btnSearch"
							id="btnSearch">검색</button>
					</div>
				</div>
				<!-- search{e} -->
			</div>
		</div>
	</div>
</body>
</html>