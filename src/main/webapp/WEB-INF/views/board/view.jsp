<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div id="nav">
		<%@ include file="../include/nav.jsp"%>
	</div>

	<div class="row g-4 py-5 row-cols-1 row-cols-lg-3 w-100">
		<div class="feature col w-100">
			<h3 class=>${view.cs_b_title}</h3>
			<textarea id="txtArea" class="w-100 bg-light" wrap="hard"
				style="overflow: hidden;" disabled>${view.cs_b_content}</textarea>
		</div>
	</div>
	<form method="post" action="/reply/write.do">

		<c:choose>
			<c:when test="${member.user_id eq view.user_id}">
				<div>
					<a class="btn btn-success"
						href="/board/modify.do?cs_board_id=${view.cs_board_id}">게시물 수정</a>
					<a class="btn btn-success"
						href="/board/delete.do?cs_board_id=${view.cs_board_id}">게시물 삭제</a>
				</div>
			</c:when>
		</c:choose>
		<!-- 댓글 시작 -->
		<ul>
			<c:forEach items="${reply}" var="reply">
				<li>
					<div>
						<p>${reply.cmt_date}</p>
						<p>${reply.cmt_content}</p>
					</div>
				</li>
			</c:forEach>
		</ul>

		<c:choose>
			<c:when test="${member.user_id eq '1' || member.user_id eq view.user_id}">
				<div class="row row-cols-2 px-3 mb-3">
					<label class="col col-form-label" for="staticReplyer">작성자</label> <input
						id="staticReplyer" class="form-control" type="text"> <label
						class="col col-form-label" for="staticReply">댓글 작성</label>
					<textarea id="staticReply" name="cmt_content" class="w-100 form-control mb-3"
						style="resize: none;" rows="5"></textarea>

					<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 댓글 안됨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					<p></p>
					<input type="hidden" name="cs_board_id" value="${view.cs_board_id}"/>
					<div class="text-end">
						<button type="submit" class="btn btn-success">댓글 작성</button>
					</div>
				</div>
			</c:when>
		</c:choose>
		<!-- 댓글 끝 -->
	</form>
</div>

<script>
	$(document).ready(function() {
		function adjustHeight() {
			var txtArea = $('textarea');
			txtArea[0].style.height = "auto";
			var txtAreaHeight = txtArea.prop('scrollHeight');
			txtArea.css('height', txtAreaHeight);
		}
		;

		adjustHeight();
	})
</script>