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
		location.href = "${path}/board/boardForm.do";
	});
	
	function fn_contentView(bid) {
		var url = "${path}/board/boardContent.do"
		url = url + "?bid="+bid;
		location.href = url;
	}
	
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;

			var url = "${path}/board/boardlist.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;

			location.href = url;

		}

	  //페이지 번호 클릭
		function fn_pagination(page, range, rangeSize, searchType, keyword) {
			var url = "${path}/board/boardlist.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;

			location.href = url;	
		}

		//다음 버튼 이벤트
		function fn_next(page, range, rangeSize) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;

			var url = "${path}/board/boardlist.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			
			location.href = url;
		}
		
		//검색 이벤트
		$(document).on('click', '#btnSearch', function(e){
			e.preventDefault();
			var url = "${path}/board/boardlist.do";
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
										<td><a href="#"
											onclick="fn_contentView(<c:out value="${list.bid}"></c:out>)">
												<c:out value="${list.title}"></c:out>
										</a></td>
										<td><c:out value="${list.reg_id}"></c:out></td>
										<td><c:out value="${list.view_cnt}"></c:out></td>
										<td><c:out value="${list.reg_dt}"></c:out></td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
				<!-- pagination{e} -->
				<div id="paginationBox" class="col-sm-10" style="float: left;">
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
				<div class="col-sm-1" style="float: right; margin: 10px;">
					<button type="button" class="btn btn-dark btn-md" id="btnWrite">작성</button>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<!-- search{s} -->
				<div class="form-group row justify-content-center">
					<div class="w100" style="padding-right: 10px">
						<select class="form-control form-control-sm" name="searchType"
							id="searchType">
							<option value="title">제목</option>
							<option value="Content">본문</option>
							<option value="reg_id">작성자</option>
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