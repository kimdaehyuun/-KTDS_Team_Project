<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div id="nav">
		<%@ include file="../include/nav.jsp"%>
	</div>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>회원번호</th>
				<th>카테고리</th>
				<th>타이틀</th>
				<th>내용</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.cs_board_id}</td>

					<td>${list.user_id}${list.rownum}</td>
					<td>${list.b_ctgry_id}</td>
					<td><a href="/board/view.do?cs_board_id=${list.cs_board_id}">
							${list.cs_b_title}</a></td>
					<td>${list.cs_b_content}</td>
					<td>${list.cs_b_views}</td>
					<td>${list.cs_b_date}</td>
					<td>${list.cs_b_lock}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div>
		<c:if test="${page.prev}">
			<span> [ <a
				href="/board/listPageSearch.do?num=${page.startPageNum -1 }"> 이전</a>]
			</span>
		</c:if>

		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
			var="num">
			<span> <c:if test="${select != num}">
					<a href="/board/listPageSearch.do?num=${num }">${num }</a>
				</c:if> <c:if test="${select == num }">
					<b>${num }</b>
				</c:if>

			</span>
		</c:forEach>

		<c:if test="${page.next}">
			<span>[ <a
				href="/board/listPageSearch.do?num=${page.endPageNum +1 }">다음</a>]
			</span>
		</c:if>

		<%-- 
<c:forEach begin="1" end="${pageNum}" var="num">
<span>
<a href = "/board/listPage.do?num=${num}">${num}</a>
</span>
</c:forEach>--%>
	</div>

	<div>
		<select name="searchType">
			<option value="cs_b_title">제목</option>
			<option value="cs_b_content">내용</option>
			<option value="cs_b_title_cs_b_content">제목+내용</option>

		</select> <input type="text" name="keyword" />
		<button type="button" id="searchBtn">검색</button>
	</div>
</div>

<script>
	document.getElementById("searchBtn").onclick = function() {

		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword = document.getElementsByName("keyword")[0].value;

		location.href = "/board/listPageSearch.do?num=1" + "&searchType="
				+ searchType + "&keyword=" + keyword;
	};
</script>
