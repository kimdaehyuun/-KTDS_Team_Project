<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<ol class="breadcrumb lh-1 m-0 py-2 px-3">
		
		
		<li class="breadcrumb-item">
			<a href="/board/listPage.do?num=1&b_ctgry_id=3">공지사항</a>
		</li>
		
		<li class="breadcrumb-item">
			<a href="/board/listPage.do?num=1&b_ctgry_id=2">1:1문의</a>
		</li>
		
		<c:choose>
			<c:when test="${isLogOn == true && member != null }">
				<li class="breadcrumb-item">
					<a href="/board/write.do">글 작성하기</a>
				</li>
			</c:when>
		</c:choose>
		
		
	</ol>
</nav>

</body>
</html>