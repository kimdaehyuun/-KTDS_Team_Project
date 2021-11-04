<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
* {
	border-spacing: 0;
}

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

input[type=number] {
	-moz-appearance: textfield;
}

.row p {
	margin-bottom: 0;
}

.box1 {
	display: none;
}
</style>

<div class="container mt-2">
	<div class="row profile_box">
		<div class="col-4 p-4 text-center">
			<img
				src="${pageContext.request.contextPath}/resources/image/${member.user_profile}"
				class="rounded" width="100%" height="100%">
		</div>
		<div class="col-8 p-4">
			<p style="font-size: 4em;" class="mb-3">${member.user_name}</p>
			<p style="font-size: 2em;" class="mb-3">${member.user_rank_id}</p>
			<p style="font-size: 1.5em;" id="editform">좋은 거래 부탁드려요</p>
		</div>
	</div>
</div>

<div class="container p-0">
	<div class="text-center m-auto pt-4">
		<div class="row flex-wrap">
			<button type="button" id="call_item_btn"
				class="col btn btn-secondary mx-4">상품</button>
			<button type="button" id="call_wish_btn"
				class="col btn btn-secondary mx-4">찜</button>
			<button type="button" id="call_review_btn"
				class="col btn btn-secondary mx-4">후기</button>
			<button type="button" id="call_ship_btn"
				class="col btn btn-secondary mx-4">거래관리</button>
		</div>
	</div>

	<!-- 상품 버튼 눌렀을떄 -->
	<div class="item_container justify-content-start mt-3 flex-wrap">
		<div class="row row-cols-4">
			<c:forEach var="item" items="${infoMap}">
				<div class="box1">
					<div class="item col position-relative p-0 mb-4">
						<a
							href="${pageContext.request.contextPath}/product/pdDetail.do?product_id=${item.PRODUCT_ID }&cate_id=${item.CATE_ID }&user_id=${item.USER_ID }">
							<img
							src="${pageContext.request.contextPath}/resources/image/${item.PRODUCT_IMG}"
							class="rounded" width="100%" height="250px">
						</a>
						<div
							class="item_info position-absolute w-100 text-center bottom-0 start-0">
							<p class="py-2 m-0">
								<a class="me-3"
									href="${pageContext.request.contextPath}/product/pdDetail.do?product_id=${item.PRODUCT_ID }&cate_id=${item.CATE_ID }&user_id=${item.USER_ID }">
									<b style="color: black;">${item.PRODUCT_NAME}</b>
								</a>
								<c:choose>
								<c:when
									test="${item.OD_STATUS == null || item.OD_STATUS == '0'}">
									<span class="badge bg-primary">판매중</span>
								</c:when> 
								<c:when test="${item.OD_STATUS == '1'}">
									<span class="badge bg-warning">거래 진행중</span>
								</c:when> 
								<c:when test="${item.OD_STATUS == '2'}">
									<span class="badge bg-danger">거래 완료</span>
								</c:when>
								<c:otherwise>
									오류
								</c:otherwise>
								</c:choose>
							</p>
							<span>
							<b style="color: #00498c;">${item.PRODUCT_PRICE}원</b>
							</span>
							
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="container mt-3 mb-3 d-flex">
			<button type="button" class="btn btn-success m-auto" id="more1">더보기</button>
		</div>
		
	</div>

	<!-- 찜 버튼 눌렀을때 -->
	<div class="wish_container justify-content-start mt-3 flex-wrap">
		<div class="row row-cols-4">
			<c:forEach var="item" items="${infoWish}">
				<div>
					<div class="item col position-relative p-0 mb-4">
						<a
							href="${pageContext.request.contextPath}/product/pdDetail.do?product_id=${item.PRODUCT_ID }&cate_id=${item.CATE_ID }&user_id=${item.USER_ID }">
							<img
							src="${pageContext.request.contextPath}/resources/image/${item.PRODUCT_IMG}"
							class="rounded" width="100%" height="250px">
						</a>
						<div
							class="item_info position-absolute w-100 text-center bottom-0 start-0">
							<p class="py-2 m-0">
								<a
									href="${pageContext.request.contextPath}/product/pdDetail.do?product_id=${item.PRODUCT_ID }&cate_id=${item.CATE_ID }&user_id=${item.USER_ID }">
									<b style="color: black;">${item.PRODUCT_NAME}</b>
								</a>
							</p>

							<b style="color: red;">${item.PRODUCT_PRICE}원</b>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- 후기 버튼 눌렀을때 -->
	<div
		class="review_container w-100 justify-content-start text-center my-3 flex-wrap">
		<div class="row row-cols-3 border-bottom">
			<div class="col-2 p-2">
				<img src="${pageContext.request.contextPath}/resources/image/2.jpg"
					class="rounded" width="60%">
			</div>
			<div class="col-1 p-2 h-100 row m-0">
				<div class="col m-auto">
					<p>김세원</p>
				</div>
			</div>
			<div class="col-9 p-2 h-100 m-auto row m-0">
				<div class="col m-auto">
					<p>비밀 문의 글입니다.</p>
				</div>
			</div>
		</div>
		<div class="row row-cols-3 border-bottom">
			<div class="col-2 p-2 ">
				<img src="${pageContext.request.contextPath}/resources/image/2.jpg"
					class="rounded" width="60%">
			</div>
			<div class="col-1 p-2 h-100 row m-0">
				<div class="col m-auto">
					<p>김세원</p>
				</div>
			</div>
			<div class="col-9 p-2 h-100 m-auto row m-0">
				<div class="col m-auto">
					<p>비밀 문의 글입니다.</p>
				</div>
			</div>
		</div>
	</div>

	<!-- 거래관리 버튼 눌렀을때 -->
	<div class="deliver_container w-100 m-auto flex-wrap border-top">
		<div class="row my-3">
			<div class="col-6">
				<div class="badge_deliver text-center mb-3">
					<a class="badge bg-success">판매 내역</a>
				</div>
				<c:forEach var="item" items="${infoMap}" varStatus="status">
					<div class="deliver_list_whole">
						<div class="deliver_list">
							<div class="del_list1" style="width: 20%">
								<a
									href="${pageContext.request.contextPath}/product/pdDetail.do?product_id=${item.PRODUCT_ID }&cate_id=${item.CATE_ID }&user_id=${item.USER_ID }">
									<img
									src="${pageContext.request.contextPath}/resources/image/${item.PRODUCT_IMG}"
									class="rounded" width="100%">
								</a>
							</div>
							<div class="del_list2" style="width: 50%">
								<p>${item.PRODUCT_NAME}</p>
								<p>${item.PRODUCT_PRICE}원</p>
							</div>
							<div class="del_list3" style="width: 20%">
								<!-- 여기는 db값을 받아와서 innerText을 이용해 거래상태 값 입력 -->
								<c:choose>
								<c:when
									test="${item.OD_STATUS == null || item.OD_STATUS == '0'}">
									<span class="badge bg-primary">판매중</span>
								</c:when> 
								<c:when test="${item.OD_STATUS == '1'}">
									<span class="badge bg-warning">거래 진행중</span>
								</c:when> 
								<c:when test="${item.OD_STATUS == '2'}">
									<span class="badge bg-danger">거래 완료</span>
								</c:when>
								<c:otherwise>
									오류
								</c:otherwise>
								</c:choose>
							</div>
						</div>

						<div class="deliver_list">
							<select id="opt_deliver_state${status.index}">
								<option value="0" selected>판매중</option>
								<option value="1">거래 진행중</option>
								<option value="2">거래 완료</option>
							</select>
							<button type="button" class="btn btn-secondary" id="stateBtn${status.index}">거래상태 등록</button>
						</div>
						<input type="hidden" id="getPro${status.index}" value="${item.PRODUCT_ID}">
					</div>
				</c:forEach>


			</div>
			<div class="col-6">
				<div class="badge_deliver text-center mb-3">
					<a class="badge bg-success">구매 내역</a>
				</div>
				<c:forEach var="item" items="${infoCheck}" varStatus="status">
					<div class="deliver_list_whole">
					<div class="deliver_list">
						<div class="del_list1" style="width: 20%">
							<a
							href="${pageContext.request.contextPath}/product/pdDetail.do?product_id=${item.PRODUCT_ID }&cate_id=${item.CATE_ID }&user_id=${item.USER_ID }">
							<img
							src="${pageContext.request.contextPath}/resources/image/${item.PRODUCT_IMG}"
							class="rounded" width="100%">
						</a>
						</div>
						<div class="del_list2" style="width: 50%">
							<p>${item.PRODUCT_NAME}</p>
								<p>${item.PRODUCT_PRICE}원</p>
						</div>
						<div class="del_list3" style="width: 20%">
								<!-- 여기는 db값을 받아와서 innerText을 이용해 거래상태 값 입력 -->
								<c:choose>
								<c:when
									test="${item.OD_STATUS == null || item.OD_STATUS == '0'}">
									<span class="badge bg-primary">판매중</span>
								</c:when> 
								<c:when test="${item.OD_STATUS == '1'}">
									<span class="badge bg-warning">거래 진행중</span>
								</c:when> 
								<c:when test="${item.OD_STATUS == '2'}">
									<span class="badge bg-danger">거래 완료</span>
								</c:when>
								<c:otherwise>
									오류
								</c:otherwise>
								</c:choose>
							</div>
					</div>

					<div class="deliver_list">
						<select id="opt_deliver_stateA${status.index}">
							<option value="0" selected>판매중</option>
							<option value="1">거래 진행중</option>
							<option value="2">거래 완료</option>
						</select>
						<button type="button" class="btn btn-secondary" id="AstateBtn${status.index}">거래상태 등록</button>
					</div>
					<input type="hidden" id="getProA${status.index}" value="${item.PRODUCT_ID}">
				</div>
				</c:forEach>
				
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function(e) {
		
		$(".box1").slice(0, 8).show();
		$("#more1").click(function(e) {
			e.preventDefault();
			$(".box1:hidden").slice(0, 8).show();
			if ($(".box1:hidden").length == 0) {
			}
		})

		/* 판매내역 거래상태 등록 버튼 눌렀을때 동작 설정 */
		// 모든 거래상태 확인 버튼을 누를때 동작이 된다
		$("[id^=stateBtn]").click(function() {
			// 인덱스 값을 구해온다
			var idx = this.id.substring(8);
			// 판매내역 거래상태에서 해당하는 인덱스의 드롭다운 정보를 가져오는거
			var target = document.getElementById("opt_deliver_state" + idx);
			// 해당 상품이 판매중인지 거래진행중인지 거래완료인지 임의로 지정한 값을 가져온다
			var sel = target.options[target.selectedIndex].value;
			// 해당 상품의 상품번호 정보를 가져온다
			var pro = document.getElementById("getPro" + idx).value;
			
			$(location).attr('href','${pageContext.request.contextPath}/member/updateState.do?product_id=' + pro + '&od_status=' + sel);
							
		});
		
		
		/* 구매내역 거래상태 등록 버튼 눌렀을때 동작 설정 */
		// 모든 거래상태 확인 버튼을 누를때 동작이 된다
		$("[id^=AstateBtn]").click(function() {
			// 인덱스 값을 구해온다
			var idxA = this.id.substring(9);
			// 구매내역 거래상태에서 해당하는 인덱스의 드롭다운 정보를 가져오는거
			var targetA = document.getElementById("opt_deliver_stateA" + idxA);
			// 해당 상품이 판매중인지 거래진행중인지 거래완료인지 임의로 지정한 값을 가져온다
			var selA = targetA.options[targetA.selectedIndex].value;
			// 해당 상품의 상품번호 정보를 가져온다
			var proA = document.getElementById("getProA" + idxA).value;
			
			$(location).attr('href','${pageContext.request.contextPath}/member/updateState.do?product_id=' + proA + '&od_status=' + selA);
							
		});
		
		
		

	});
</script>