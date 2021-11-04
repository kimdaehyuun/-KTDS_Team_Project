<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="<c:url value='/resources/css/styles.mingyun.css'/>" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>


<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#example').DataTable();
	});
	$(document).ready(function() {
		$('#foo-table').DataTable();
	});
	$(document).ready(function() {
		$('#exampleTable').DataTable();
	});
</script>
<div class="container">
	<main class="jonamain">
		<div class="flex-shrink-0 p-3 bg-white" id="sidebars_detail">
			<a href="#"
				class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
				<svg class="bi me-2" width="30" height="24">
				<use xlink:href="#bootstrap" /></svg> <span class="fs-5 fw-semibold">관리자
					페이지</span>
			</a>
			<ul class="list-unstyled ps-0">
				<div class="collapse show" id="home-collapse">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><button type="button"
								class="btn btn-link  link-dark rounded" id="custom">회원관리</button></li>
						<li><button type="button"
								class="btn btn-link  link-dark rounded" id="trade">거래현황</button></li>
						<li><button type="button"
								class="btn btn-link  link-dark rounded" id="call">고객문의</button></li>
					</ul>
				</div>
				</li>
			</ul>
		</div>

		<div class="jonabig_container">
			<div class="user_mangement">

				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 회원정보
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>회원번호</th>
									<th>이름</th>
									<th>회원등급</th>
									<th>계정</th>
									<th>주소</th>
									<th>연락처</th>
									<th>회원등록일</th>
									<th>삭제</th>
								</tr>
							</thead>

							<tbody>

								<c:forEach var="article" items="${AdminProductsList }"
									varStatus="articleNum">
									<fmt:formatDate var="UserCreate"
										value="${article.user_create }" pattern="yyyy.MM.dd" />
									<tr>
										<td>${article.user_id}</td>
										<td>${article.user_name}</td>
										<td>${article.user_rank_id}</td>
										<td>${article.user_account}</td>
										<td>${article.user_address}</td>
										<td>${article.user_contact}</td>
										<td>${UserCreate}</td>
										<td><a onclick="return confirm('정말로 삭제하시겠습니까?')" id ="underlineproduct"
											href="${pageContext.request.contextPath}/member/removeAdminMem.do?user_id=${article.user_id}"
											class="btn btn-link  link-dark rounded">삭제</a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="deal_mangement">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 거래현황
					</div>
					<div class="card-body">
						<table id="example" class="table table-striped"
							style="width: 100%">
							<thead>
								<tr>

									<th>상품번호</th>
									<th>카테고리</th>
									<th>상품이름</th>
									<th>상품가격</th>
									<th>판매자</th>

									<th>거래상태</th>

									<th>등록날짜</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="article" items="${AdminProductsList2 }"
									varStatus="articleNum">
									<%-- <fmt:formatDate var="OrderDate" value="${article.order_date }"
										pattern="yyyy.MM.dd" /> --%>
									<fmt:formatDate var="ProductDate"
										value="${article.product_date }" pattern="yyyy.MM.dd" />
									<tr>

										<td><a id ="underlineproduct" style="color:black;"
											href="${pageContext.request.contextPath}/member/administrationdetail.do?product_id=
										${article.product_id}&user_id=${article.user_id}&order_id=${article.order_id}">${article.product_id}</a></td>
										<td><a id ="underlineproduct" style="color:black;"
											href="${pageContext.request.contextPath}/member/administrationdetail.do?product_id=
										${article.product_id}&user_id=${article.user_id}&order_id=${article.order_id}">${article.cate_name}</a></td>
										<td><a id ="underlineproduct" style="color:black;"
											href="${pageContext.request.contextPath}/member/administrationdetail.do?product_id=
										${article.product_id}&user_id=${article.user_id}&order_id=${article.order_id}">
												${article.product_name}</a></td>
										<td><a id ="underlineproduct" style="color:black;"
											href="${pageContext.request.contextPath}/member/administrationdetail.do?product_id=
										${article.product_id}&user_id=${article.user_id}&order_id=${article.order_id}">${article.product_price}원</a></td>
										<td><a id ="underlineproduct" style="color:black;"
											href="${pageContext.request.contextPath}/member/administrationdetail.do?product_id=
										${article.product_id}&user_id=${article.user_id}&order_id=${article.order_id}">${article.user_name}</a></td>


										<c:set var="trade" value="거래상태" />
										<c:choose>
											<c:when test="${article.od_status eq '0'}">
												<td>판매중</td>
											</c:when>
											<c:when test="${article.od_status eq '1'}">
												<td>거래중</td>
											</c:when>
											<c:when test="${article.od_status eq '2'}">
												<td>거래완료</td>
											</c:when>
										</c:choose>


										<td><a id ="underlineproduct" style="color:black;""
											href="${pageContext.request.contextPath}/member/administrationdetail.do?product_id=
										${article.product_id}&user_id=${article.user_id}&order_id=${article.order_id}">${ProductDate}</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="admincustomer_mangement">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 고객문의
					</div>
					<div class="card-body">

						<table id="exampleTable" class="table table-bordered">
							<thead>
								<tr>
									<th>질문번호</th>
									<th>회원번호</th>
									<th>카테고리</th>
									<th>작성자</th>
									<th width="150px">제목</th>
									<th>작성일</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="article" items="${AdminProductsList3 }"
									varStatus="articleNum">
									<fmt:formatDate var="Cs_b_date" value="${article.cs_b_date }"
										pattern="yyyy.MM.dd" />
									<tr>
										<td>${article.cs_board_id}</td>
										<td>${article.user_id}</td>
										<td>${article.b_ctgry_id}</td>
										<td>${article.user_name}</td>
										<td><a id ="underlineproduct" style="color:black;"
											href="/board/view.do?cs_board_id=${article.cs_board_id}">${article.cs_b_title}</a>
										</td>
										<td>${Cs_b_date}</td>
										<td><a onclick="return confirm('정말로 삭제하시겠습니까?')" id ="underlineproduct"
											href="${pageContext.request.contextPath}/member/removeAdminBoard.do?cs_board_id=${article.cs_board_id}"
											class="btn btn-link  link-dark rounded">삭제</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
	</main>
</div>

