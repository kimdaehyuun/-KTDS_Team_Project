<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Header -->
<div class="container p-0">
	<nav class="py-0 bg-success border-bottom">
		<div class="container d-flex flex-wrap">
			<ul class="nav me-auto">
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/home.do"
					class="ft_jua nav-link link-light px-2 active" aria-current="page">
						나이스 샷 </a></li>



				<c:choose>
					<c:when test="${isLogOn == true && member != null }">
						<c:choose>
							<c:when test="${member.user_rank_id != '관리자'}">
								<li class="nav-item"><a
									href="${pageContext.request.contextPath}/product/pdRegister.do"
									class="nav-link link-light px-2">상품등록</a></li>
							</c:when>
						</c:choose>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when
						test="${isLogOn == true && member != null && member.user_rank_id eq '관리자'}">
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/member/administration.do"
							class="nav-link link-light px-2">관리자 전용</a></li>
					</c:when>
				</c:choose>

				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/board/listPage.do?num=1"
					class="nav-link link-light px-2">고객센터</a></li>

			</ul>

			<c:choose>
				<c:when test="${isLogOn == true && member != null }">
					<ul class="nav">
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/member/myPage.do"
							class="nav-link px-2 disabled text-white">${member.user_name}님
								어서오세요</a></li>
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/member/myPage.do"
							class="nav-link link-light px-2">마이페이지</a></li>
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/member/logout.do"
							class="nav-link link-light px-2">로그아웃</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="nav">
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/member/login.do"
							class="nav-link link-light px-2">로그인</a></li>
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/member/registration.do"
							class="nav-link link-light px-2">회원가입</a></li>
					</ul>
				</c:otherwise>
			</c:choose>

		</div>
	</nav>

	<header class="py-2 border-bottom">
		<div class="container d-flex flex-wrap justify-content-center">
			<a href="${pageContext.request.contextPath}/home.do"
				class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto text-dark text-decoration-none">
				<span class="fs-4"><img style="height: 36px"
					src="${pageContext.request.contextPath}/resources/image/lg_grn_wide_logo.png" /></span>
			</a>
		</div>
	</header>

	<c:choose>

		<c:when test="${member.user_rank_id != '관리자'}">

			<nav class="navbar navbar-expand-sm px-5 py-0 border-bottom m-auto">
				<ul class="navbar-nav row">
					<li class="nav-item col p-0 ahover"><a
						class="nav-link p-3 text-success" id="menu_club"
						href="${pageContext.request.contextPath}/product/pdList.do?cate_id=1&mode=1&filter=&safe=">골프클럽</a></li>
					<li class="nav-item col p-0 ahover"><a
						class="nav-link p-3 text-success" id="menu_golfitem"
						href="${pageContext.request.contextPath}/product/pdList.do?cate_id=2&mode=1&filter=&&safe=">골프용품</a></li>
					<li class="nav-item col p-0 ahover"><a
						class="nav-link p-3 text-success" id="menu_golfwear"
						href="${pageContext.request.contextPath}/product/pdList.do?cate_id=3&mode=1&filter=&&safe=">골프웨어</a></li>
				</ul>
			</nav>

		</c:when>
	</c:choose>

</div>