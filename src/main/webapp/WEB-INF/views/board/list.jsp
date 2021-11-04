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
			<%-- 
 <c:forEach items="${list}" var="list">
 <tr>
 <td>${list.cs_board_id}
 
 </td>
 
  <td>${list.user_id}
  ${list.rownum}
  </td>
   <td>${list.b_ctgry_id}</td>
    <td>
    <a href="/board/view.do?cs_board_id=${list.cs_board_id}"> ${list.cs_b_title}</a>
    </td>
     <td>${list.cs_b_content}</td>
      <td>${list.cs_b_views}</td>
 <td>${list.cs_b_date}</td>
   <td>${list.cs_b_lock}</td>
   </tr>
   </c:forEach>
  --%>
		</tbody>
	</table>
</div>