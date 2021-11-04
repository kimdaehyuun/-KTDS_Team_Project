<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div id="nav">
		<%@ include file="../include/nav.jsp"%>
	</div>

	<form method="post" class="form mb-3">
		<div class="row row-cols-1">
			<div class="col mt-3">
				<label class="form-label">제목</label> <input class="form-control"
					type="text" name="cs_b_title" value="${view.cs_b_title}" />
			</div>
		</div>

		<div class="col mt-3">
			<label class="form-label">내용</label>
			<textarea class="form-control" style="resize: none; height: 340px"
				name="cs_b_content">${view.cs_b_content }</textarea>
		</div>
		<div class="mt-3 text-end">
			<button class="btn btn-success" type="submit">완료</button>
		</div>
	</form>
</div>