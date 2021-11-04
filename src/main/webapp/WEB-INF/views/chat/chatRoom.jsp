<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">

	<table class="table table-hover">
		<tr>
			<th>방 번호</th>
			<th>상품 이름</th>
			<th>상품 가격</th>
			<th>대화 상대</th>
		</tr>
		<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.CHAT_ID}</td>
				<td><a href="${pageContext.request.contextPath}/chat/chat.do?resultAvailable=1&chat_id=${list.CHAT_ID}">${list.PRODUCT_NAME}</a></td>
				<td>${list.PRODUCT_PRICE}</td>
				<td>${list.USER_NAME}</td>
			</tr>
		</c:forEach>


	</table>

</div>

<script>



</script>