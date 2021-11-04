<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">

	<div class="col mt-3">
		<p class="h4 border-bottom border-dark pb-3 mb-0">글쓰기</p>
	</div>
	<form method="post" class="form mb-3">

		<div class="mb-3">
			<label for="b_ctgry_id" class="form-label"> </label> <select
				id="b_ctgry_id" class="form-select" name="b_ctgry_id">
				<option value="2">1:1문의</option>
				<c:if test="${member.user_rank_id == '관리자'}">
					<option value="3">공지사항</option>
				</c:if>
			</select>
		</div>

		<div class="row row-cols-1">
			<div class="col mt-3">
				<label class="form-label">제목</label> <input class="form-control"
					type="text" name="cs_b_title" placeholder="제목을 입력해주세요." />
			</div>
			<div class="col mt-3">
				<label class="form-label">내용</label>
				<textarea class="form-control" name="cs_b_content"
					style="resize: none; height: 340px;" placeholder="이곳에 글을 입력해주세요."></textarea>
			</div>
		</div>
		<div class="w-100 row text-end m-0 mt-3">
			<div class="form-check d-flex justify-content-end">
				
			
			</div>
			<div class="mt-2">
				<a class="btn btn-light border-dark me-3" href="/board/listPage.do?num=1" type="button">취소</a>
				<button class="btn btn-success" type="submit">등록</button>
			</div>
		</div>
	</form>
</div>