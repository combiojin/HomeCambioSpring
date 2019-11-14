<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>BoardList</title>
<meta charset="UTF-8">
<%@include file="../head.jsp"%>
<script type="text/javascript">
	$(document).on('click', '#btnWrite', function(e) {
		e.preventDefault();
		location.href = "${path}/member/admindelete.do";
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
<%-- 				<form id="delefrm" action="${path}/member/admindelete.do"> --%>
					<h2>게시판</h2>
					<table class="table table-dark table-bordered"
						style="text-align: center;">
						<colgroup>
							<col style="width: 5%;">
							<col style="width: auto;">
							<col style="width: 15%;">
							<col style="width: 10%;">
							<col style="width: 10%;">
						</colgroup>
						<thead>
							<tr>
								<%-- 							<c:if test="${member.member_id eq 'admin' }"> --%>
								<!-- 								<th>체크</th> -->
								<%-- 							</c:if> --%>
								<th>NO</th>
								<th>글제목</th>
								<th>작성자</th>
								<th>조회수</th>
								<th>작성일</th>
								<%-- 							<c:if test="${member.member_id eq 'admin' }"> --%>
								<!-- 								<th>회원수정</th> -->
								<%-- 							</c:if> --%>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty boardList}">
									<tr>
										<td colspan="6" align="center">데이터가 없습니다.</td>
									</tr>
								</c:when>

								<c:when test="${!empty boardList}">
									<c:forEach var="list" items="${boardList}">
										<tr>
											<td><c:out value="${list.bid}"></c:out></td>
											<td><c:out value="${list.title}"></c:out></td>
											<td><c:out value="${list.reg_id}"></c:out></td>
											<td><c:out value="${list.view_cnt}"></c:out></td>
											<td><c:out value="${list.reg_dt}"></c:out></td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>
						</tbody>
					</table>
					<%-- 					<c:if test="${member.member_id eq 'admin' }"> --%>
					<div class="col-sm-1" style="float: right; margin: 10px;">
						<button type="button" class="btn btn-dark" id="btnWrite">작성</button>
					</div>
					<!-- 						<div class="col-sm-1" style="float: right; margin: 10px;"> -->
					<%-- 							<a class="btn btn-dark" href="${path}/member/admininsert.do">회원등록</a> --%>
					<!-- 						</div> -->
					<%-- 					</c:if> --%>
<!-- 				</form> -->
			</div>
		</div>
		<div class="row"></div>
	</div>
</body>
</html>