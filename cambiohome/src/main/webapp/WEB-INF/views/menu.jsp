<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="head.jsp"%>
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
	<div
		class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="${path}">Home</a>
			</li>
			<li class="nav-item"><a class="nav-link"
				href="${path}/member/memberlist.do">MemberList</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${path}/board/boardlist.do">Board</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Gallery</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${path}/chat/chat.do">Chat</a></li>
		</ul>
	</div>
	<div class="mx-auto order-0">
		<a class="navbar-brand mx-auto" href="${path}"><img
			src="${path}/resources/image/logo_white.png" width="100" height="30"
			class="d-inline-block align-top" alt=""></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target=".dual-collapse2">
			<span class="navbar-toggler-icon"></span>
		</button>
	</div>
	<div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
		<ul class="navbar-nav ml-auto">
			<c:if test="${member == null }">
				<li class="nav-item"><a class="nav-link"
					href="${path}/member/signup.do"><i class="fas fa-user-plus"></i>회원가입</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${path}/member/login.do"><i class="far fa-user"></i>로그인</a></li>
			</c:if>
			<c:if test="${member != null}">
				<li class="nav-item"><a class="nav-link"
					href="${path}/member/mypage.do?member_id=${member.member_id}"><i
						class="fas fa-user"></i>마이페이지</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${path}/member/logout.do"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
			</c:if>
		</ul>
	</div>
</nav>
<%-- ${sessionScope.member} --%>
