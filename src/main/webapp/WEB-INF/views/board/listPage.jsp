<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">

	<div id="nav">
		<%@ include file="../include/nav.jsp"%>
	</div>

 <div class="col-lg-12 grid-margin stretch-card" >
 
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">고객센터</h4>
              
               
                <div class="table-responsive">
                  <table class="table">
                    <thead>
			<tr>
				<th scope="col">번호</th>
		
				<th scope="col">타이틀</th>
				<th scope="col">작성일</th>
			
			</tr>
		</thead>

		<tbody>
			<c:forEach var="lists" items="${list}">
				<c:choose>
					<c:when
						test="${lists.cs_b_lock eq '1' && member.user_rank_id eq '관리자' || member.user_id eq lists.user_id}">
						<tr scope="row">
							<td>${lists.cs_board_id}</td>
						
						
							<td><a href="/board/view.do?cs_board_id=${lists.cs_board_id}">${lists.cs_b_title}</a></td>

							<!-- @@@@@@@@@@@ 조회수 안됨 @@@@@@@@@@@@@@@@@ -->

						
							<td>${lists.cs_b_date}</td>

						</tr>
					</c:when>
					<c:when test="${lists.cs_b_lock eq '0'}">
						<tr scope="row">
							<td>${lists.cs_board_id}</td>
				
						
							<td><a href="/board/view.do?cs_board_id=${lists.cs_board_id}">${lists.cs_b_title}</a></td>
							<!-- @@@@@@@@@@@ 조회수 안됨 @@@@@@@@@@@@@@@@@ -->

					
							<td>${lists.cs_b_date}</td>

							<!-- @@@@@@@@@@@@ 1인 경우 경우 컨텐츠 클릭 불가 및 관리자만 및 등록자만 접속 가능 @@@@@@@@@@@@@@@@@@@ -->
							
						</tr>
					</c:when>
				</c:choose>
			</c:forEach>
		 </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>

	<nav aria-label="Page navigation example" class="">
		<ul class="pagination justify-content-center">
			<c:if test="${prev}">
				<li class="page-item"><a class="page-link"
					href="/board/listPage.do?num=${startPageNum -1 }"> 이전</a></li>
			</c:if>
			<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
				<li class="page-item"><c:if test="${select != num}">
						<a class="page-link" href="/board/listPage.do?num=${num}&b_ctgry_id=${param.b_ctgry_id}">${num }</a>
					</c:if> <c:if test="${select == num }">
						<b class="page-link">${num }</b>
					</c:if></li>
			</c:forEach>

			<c:if test="${next}">
				<li class="page-item"><a class="page-link"
					href="/board/listPage.do?num=${endPageNum +1 }">다음</a></li>
			</c:if>
		</ul>
	</nav>
</div>