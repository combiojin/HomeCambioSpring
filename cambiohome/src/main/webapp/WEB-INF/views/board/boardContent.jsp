<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../head.jsp"%>
<script type="text/javascript">
	//댓글 이벤트
	$(document).ready(function() {
		showReplyList();
	});
	//목록이동 이벤트
	$(document).on('click', '#btnList', function() {
		location.href = "${path}/board/boardlist.do";

	});
	//수정 버튼 클릭이벤트
	$(document).on('click', '#btnUpdate', function() {
		var url = "${path}/board/boardUpdate.do";
		url = url + "?bid=" + $
		{
			boardContent.bid
		}
		;
		url = url + "&mode=update";
		location.href = url;
	});
	//삭제 버튼 클릭이벤트
	$(document).on('click', '#btnDelete', function() {
		var url = "${path}/board/boardDelete.do";
		url = url + "?bid=" + $
		{
			boardContent.bid
		}
		;
		location.href = url;
	});

	//AJAX 댓글
	function showReplyList() {
		var url = "${path}/restboard/ReplyList.do";
		var paramData = {
			"bid" : "${boardContent.bid}"
		};
		$
				.ajax({
					type : 'POST',
					url : url,
					data : paramData,
					dataType : 'json',
					success : function(result) {
						var htmls = [];
						if (result.length < 1) {
							htmls.push("등록된 댓글이 없습니다.");
						} else {
							$(result)
									.each(
											function() {
												htmls += '<div class="media text-muted pt-3" id="rid' + this.rid + '">';
												htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
												htmls += '<title>Placeholder</title>';
												htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
												htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
												htmls += '</svg>';
												htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
												htmls += '<span class="d-block">';
												htmls += '<strong class="text-gray-dark">'
														+ this.reg_id
														+ '</strong>';
												htmls += '<span style="padding-left: 7px; font-size: 9pt">';
												htmls += '<a href="javascript:void(0)" onclick="fn_editReply('
														+ this.rid
														+ ', \''
														+ this.reg_id
														+ '\', \''
														+ this.content
														+ '\' )" style="padding-right:5px">수정</a>';
												htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply('
														+ this.rid
														+ ')" >삭제</a>';
												htmls += '</span>';
												htmls += '</span>';
												htmls += this.content;
												htmls += '</p>';
												htmls += '</div>';
											}); //each end
						}
						$("#replyList").html(htmls);
					} // Ajax success end
				}); // Ajax end
	}
	//댓글 저장 버튼 클릭 이벤트
	$(document).on('click', '#btnReplySave', function() {
		var replyContent = $('#content').val();
		var replyReg_id = $('#reg_id').val();

		var paramData = JSON.stringify({
			"content" : replyContent,
			"reg_id" : replyReg_id,
			"bid" : '${boardContent.bid}'
		});
		var headers = {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		};

		$.ajax({
			url : "${path}/restboard/saveReply.do",
			headers : headers,
			data : paramData,
			type : 'POST',
			dataType : 'text',
			success : function(result) {
				showReplyList();
				$('#content').val('');
				$('#reg_id').val('');
			},
			error : function(error) {
				console.log("에러 : " + error);
			}
		});
	});

	//댓글 수정
	function fn_editReply(rid, reg_id, content) {
		var htmls = [];

		htmls += '<div class="media text-muted pt-3" id="rid' + this.rid + '">';
		htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
		htmls += '<title>Placeholder</title>';
		htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
		htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
		htmls += '</svg>';
		htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
		htmls += '<span class="d-block">';
		htmls += '<strong class="text-gray-dark">' + reg_id + '</strong>';
		htmls += '<span style="padding-left: 7px; font-size: 9pt">';
		htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + rid
				+ ', \'' + reg_id + '\')" style="padding-right:5px">저장</a>';
		htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';
		htmls += '</span>';
		htmls += '</span>';
		htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
		htmls += content;
		htmls += '</textarea>';
		htmls += '</p>';
		htmls += '</div>';

		$('#rid' + rid).replaceWith(htmls);
		$('#rid' + rid + ' #editContent').focus();
	}

	//댓글 수정내용 저장
	function fn_updateReply(rid, reg_id) {
		var replyEditContent = $('#editContent').val();
		var paramData = JSON.stringify({
			"content" : replyEditContent,
			"rid" : rid
		});
		var headers = {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		};

		$.ajax({
			url : "${path}/restboard/updateReply.do",
			headers : headers,
			data : paramData,
			type : 'POST',
			dataType : 'text',
			success : function(result) {
				console.log(result);
				showReplyList();
			},
			error : function(error) {
				console.log("에러 : " + error);
			}
		});
	}

	//댓글 삭제
	function fn_deleteReply(rid) {
		var paramData = {
			"rid" : rid
		};

		$.ajax({
			url : "${path}/restboard/deleteReply.do",
			data : paramData,
			type : 'POST',
			dataType : 'text',
			success : function(result) {
				showReplyList();
			},
			error : function(error) {
				console.log("에러 : " + error);
			}
		});
	}
</script>
</head>
<body>
	<!-- menu -->
	<%@include file="../menu.jsp"%>
	<!-- body -->
	<article>
		<div class="container" role="main">
			<h2>게시판 내용</h2>
			<div class="bg-white rounded shadow-sm">
				<div class="board_title">
					<c:out value="${boardContent.title}"></c:out>
				</div>
				<div class="board_info_box">
					<span class="board_author"><c:out
							value="${boardContent.reg_id}"></c:out>,</span> <span class="board_date"><c:out
							value="${boardContent.reg_dt}"></c:out></span>
				</div>
				<div class="board_content">${boardContent.content}</div>
				<div class="board_tag">
					TAG :
					<c:out value="${boardContent.tag}"></c:out>
				</div>
			</div>
			<div style="margin-top: 20px; float: right;">
				<button type="button" class="btn btn-md btn-dark" id="btnUpdate">수정</button>
				<button type="button" class="btn btn-md btn-dark" id="btnDelete">삭제</button>
				<button type="button" class="btn btn-md btn-dark" id="btnList">목록</button>
			</div>

			<!-- Reply Form {s} -->
			<div class="my-3 p-3 bg-white rounded shadow-sm"
				style="padding-top: 10px">
				<form:form name="form" id="form" role="form"
					modelAttribute="replyDTO" method="POST">
					<form:hidden path="bid" id="bid" />
					<div class="row">
						<div class="col-sm-10">
							<form:textarea path="content" id="content" class="form-control"
								rows="3" placeholder="댓글을 입력해 주세요"></form:textarea>
						</div>
						<div class="col-sm-2">
							<form:input path="reg_id" class="form-control" id="reg_id"
								placeholder="댓글 작성자"></form:input>
							<button type="button" class="btn btn-sm btn-dark"
								id="btnReplySave" style="width: 100%; margin-top: 10px">
								저 장</button>
						</div>
					</div>
				</form:form>
			</div>
			<!-- Reply Form {e} -->

			<!-- Reply List {s}-->
			<div class="my-3 p-3 bg-white rounded shadow-sm"
				style="padding-top: 10px">
				<h6 class="border-bottom pb-2 mb-0">Reply list</h6>
				<div id="replyList"></div>
			</div>
			<!-- Reply List {e}-->
		</div>
	</article>
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
