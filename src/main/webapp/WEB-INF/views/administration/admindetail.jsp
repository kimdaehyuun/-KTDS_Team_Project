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

<script
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>

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

<div class="container p-0">

	<div class="jonamain">
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
								class="btn btn-link  link-dark rounded" id="custom">
								<a id="underlineproduct" style="color: black;"
									href="${pageContext.request.contextPath}/member/administration.do">회원관리</a>
							</button></li>
						<li><button type="button"
								class="btn btn-link  link-dark rounded" id="trade">
								<a id="underlineproduct" style="color: black;"
									href="${pageContext.request.contextPath}/member/administration.do">거래현황</a>
							</button></li>
						<li><button type="button"
								class="btn btn-link  link-dark rounded" id="call">
								<a id="underlineproduct" style="color: black;"
									href="${pageContext.request.contextPath}/member/administration.do">고객문의</a>
							</button></li>
					</ul>
				</div>
				</li>
			</ul>
		</div>

		<div class="jonabig_container">
			<div class="tradetitle" style="font-weight: bold;">&nbsp; 상품정보</div>



			<div class="detailtable">
				<table class="detailtable">


					<tr>
						<td class="jonadetailtable">상품번호</td>
						<td class="jonadetailcontent">${admindetail.product_id}</td>

					</tr>
					<tr>

						<td class="jonadetailtable">카테고리</td>
						<td class="jonadetailcontent">${admindetail.cate_name}</td>

					</tr>
					<tr>
						<td class="jonadetailtable">구분</td>
						<td class="jonadetailcontent">${admindetail.gen_name}</td>

					</tr>
					<tr>
						<td class="jonadetailtable">상품이름</td>
						<td class="jonadetailcontent">${admindetail.product_name}</td>

					</tr>
					<tr>
						<td class="jonadetailtable">가격</td>
						<td class="jonadetailcontent">${admindetail.product_price}원</td>

					</tr>
					<tr>
						<td class="jonadetailtable">상품상태</td>
						<c:set var="trade" value="거래상태" />
						<c:choose>
							<c:when test="${admindetail.od_status eq '0'}">
								<td class="jonadetailcontent">판매중</td>
							</c:when>
							<c:when test="${admindetail.od_status eq '1'}">
								<td class="jonadetailcontent">거래중</td>
							</c:when>
							<c:when test="${admindetail.od_status eq '2'}">
								<td class="jonadetailcontent">거래완료</td>
							</c:when>
						</c:choose>

					</tr>
					<tr>
						<td class="jonadetailtable">상세정보</td>
						<td class="jonaproductdetail">${admindetail.product_detail}</td>

					</tr>
					<fmt:formatDate var="ProductDate"
						value="${admindetail.product_date }" pattern="yyyy.MM.dd" />
					<tr>
						<td class="jonadetailtable">상품등록날짜</td>
						<td class="jonadetailcontent">${ProductDate}</td>

					</tr>
					<fmt:formatDate var="OrderDate" value="${admindetail.order_date }"
						pattern="yyyy.MM.dd" />
					<tr>
						<td class="jonadetailtable">상품주문날짜</td>
						<td class="jonadetailcontent">${OrderDate}</td>

					</tr>


				</table>
			</div>
			<div class="tradetitle" style="font-weight: bold;">&nbsp; 판매자 정보</div>
			<div class="detailtable">
				<table class="detailtable">


					<tr>
						<td class="jonadetailtable">회원번호</td>
						<td class="jonadetailcontent">${admindetail.user_id}</td>

					</tr>
					<tr>

						<td class="jonadetailtable">회원등급번호</td>
						<td class="jonadetailcontent">${admindetail.user_rank_id}</td>

					</tr>
					<tr>
						<td class="jonadetailtable">회원계정</td>
						<td class="jonadetailcontent">${admindetail.user_account}</td>

					</tr>
					<tr>
						<td class="jonadetailtable">이름</td>
						<td class="jonadetailcontent">${admindetail.user_name}</td>

					</tr>
					<tr>
						<td class="jonadetailtable">우편번호</td>
						<td class="jonadetailcontent">${admindetail.user_zipcode}</td>

					</tr>
					<tr>
						<td class="jonadetailtable">주소</td>
						<td class="jonadetailcontent">${admindetail.user_address}</td>

					</tr>
					<tr>
						<td class="jonadetailtable">연락처</td>
						<td class="jonadetailcontent">${admindetail.user_contact}</td>

					</tr>
					<fmt:formatDate var="UserDate" value="${admindetail.user_create}"
						pattern="yyyy.MM.dd" />
					<tr>
						<td class="jonadetailtable">회원가입일</td>
						<td class="jonadetailcontent">${UserDate}</td>

					</tr>


				</table>
			</div>


			<div class="tradetitle" style="font-weight: bold;">&nbsp; 구매자 정보</div>

			<div class="detailtable">
				<table class="detailtable">


					<tr>
						<td class="jonadetailtable">회원번호</td>
						<td class="jonadetailcontent">${buyAdDetail.user_id}</td>

					</tr>
					<tr>

						<td class="jonadetailtable">회원등급번호</td>
						<td class="jonadetailcontent">${buyAdDetail.user_rank_id}</td>

					</tr>
					<tr>
						<td class="jonadetailtable">회원계정</td>
						<td class="jonadetailcontent">${buyAdDetail.user_account}</td>

					</tr>
					<tr>
						<td class="jonadetailtable">이름</td>
						<td class="jonadetailcontent">${buyAdDetail.user_name}</td>

					</tr>
					<tr>
						<td class="jonadetailtable">우편번호</td>
						<td class="jonadetailcontent">${buyAdDetail.user_zipcode}</td>

					</tr>
					<tr>
						<td class="jonadetailtable">주소</td>
						<td class="jonadetailcontent">${buyAdDetail.user_address}</td>

					</tr>
					<tr>
						<td class="jonadetailtable">연락처</td>
						<td class="jonadetailcontent">${buyAdDetail.user_contact}</td>

					</tr>
					</tr>
					<fmt:formatDate var="buyerDate" value="${buyAdDetail.user_create}"
						pattern="yyyy.MM.dd" />
					<tr>
						<td class="jonadetailtable">회원등록일</td>
						<td class="jonadetailcontent">${buyerDate}</td>

					</tr>


				</table>
			</div>


		</div>
	</div>
</div>

